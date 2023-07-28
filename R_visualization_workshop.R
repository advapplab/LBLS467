# 1: --------------- PREPARE PACKAGES ---------------#
setwd('/Users/jasperhewitt/Desktop')
#install packages if not done so before
#install.packages('tidyverse')
#install.packages('ggplot2')
#install.packages('plotly')
#install.packages('gridExtra')
#install.packages('ggExtra')

#load packages into your current session
library('tidyverse')
library('ggplot2')
library('plotly')
library('gridExtra')
library('ggExtra')


# 2: --------------- GET DATA ---------------#

#the full data set can be found here: https://github.com/advapplab/LBLS467/tree/main/data

#get score_csv

#get bookroll csv
df<-read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/br.csv")

#get viscode csv
viscode_df<-read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/viscode.csv")

#get standardized version fo bookroll and viscode 
standard_df<-read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/standard.csv")
standard_df <- standard_df[rowSums(is.na(standard_df)) <= 30, ]


# 3: --------------- scores per class (boxplots) ---------------#

#info on boxplots https://www.sharpsightlabs.com/blog/ggplot-boxplot/

#get average scores per class
viscode_df_class<-viscode_df %>% 
  group_by(class) %>% 
  summarise(mean=mean(score))

#see how many students failed 
count_below_60 <- viscode_df %>% 
  filter(score < 60) %>% 
  group_by(class) %>% 
  summarise(n = n())

#simple plot 
ggplot(viscode_df, aes(x = class, y = score)) +
  geom_boxplot() +
  labs(x = "Class", y = "Score") +
  theme_minimal() +
  ggtitle("Score Distribution per Class") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#get failcount and failrate per class 
count_failrate <- viscode_df %>% 
  mutate(fail = ifelse(score < 60, 1, 0)) %>%
  group_by(class) %>%
  summarise(total = n(),
            fail_count = sum(fail),
            fail_rate = round((fail_count / total * 100), 1)) #one decimal

#merge together
viscode_df<-merge(viscode_df, count_failrate, by = "class")

#final boxplot
ggplot(viscode_df, aes(x = class, y = score)) +
  geom_boxplot(aes(fill = class)) + #change the colour. fill = 'red' will change all of the boxes to red. We want every class to have a different colour so we input: class
  geom_label(aes(label = paste0("< 60: ", fail_count), y = 106), #input the fail_count variable that we created
             vjust = 0,
             size = 3,
             fill = "light blue",
             label.size = 0.35,
             label.padding = unit(0.5, "lines"),
             label.r = unit(0.15, "lines")) +
  geom_label(aes(label = paste0("failrate: ", fail_rate), y = 100),
             vjust = 0,
             size = 3,
             fill = "light green",
             label.size = 0.35,
             label.padding = unit(0.5, "lines"),
             label.r = unit(0.15, "lines")) +
  labs(x = "Class", y = "Score") +
  theme_minimal() +
  ggtitle("Score Distribution per Class") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# 4: --------------- interactions influence on score (scatter plot) ---------------#

#let's see how the students' interactions with Bookroll and viscode influence the total interactions on the score. 

#print names of the columns to decide which ones to accumulate
names(standard_df)

#we want to accumulate everything except 'userid', 'class', 'score', and 'viscode.spent_time'
standard_df <- standard_df %>%
  mutate(total_interactions = rowSums(select(., -c('userid', 'score', 'class', 'Viscode.spent_time'))))

# Standardize 'total_interactions' column
standard_df$total_interactions <- scale(standard_df$total_interactions)

#plot in a scatterplot
#ggplot(standard_df, aes(x = total_interactions, y = score)) +
#  geom_point() +
#  labs(x = "Total Interactions", y = "Score") +
#  theme_minimal() +
#  ggtitle("Relationship between Total Interactions and Score")

# Convert 'total_interactions' column back to a vector
standard_df$total_interactions <- as.vector(standard_df$total_interactions)

# And then, run the mutate function
standard_df <- standard_df %>%
  mutate(interaction_range = case_when(
    total_interactions <= -1.5 ~ '< -1.5',
    total_interactions > -1.5 & total_interactions <= -1.0 ~ '-1.5 / -1.0',
    total_interactions > -1.0 & total_interactions <= -0.5 ~ '-1.0 / -0.5',
    total_interactions > -0.5 & total_interactions <= 0 ~ '-0.5 / 0',
    total_interactions > 0 & total_interactions <= 0.5 ~ '0 / 0.5',
    total_interactions > 0.5 & total_interactions <= 1.0 ~ '0.5 / 1.0',
    total_interactions > 1.0 & total_interactions <= 1.5 ~ '1.0 / 1.5',
    total_interactions > 1.5 & total_interactions <= 2.0 ~ '1.5 / 2.0',
    total_interactions > 2.0 ~ '2.0 and above'
  ))
#organize them so they will appear in the right order in the plot
standard_df$interaction_range <- factor(standard_df$interaction_range, 
                                        levels = c('< -1.5', '-1.5 / -1.0', '-1.0 / -0.5', '-0.5 / 0',
                                                   '0 / 0.5', '0.5 / 1.0', '1.0 / 1.5', '1.5 / 2.0',
                                                   '2.0 and above'))
# Ensure the score column is numeric
standard_df$score <- as.numeric(standard_df$score)

# Create the score_category column
standard_df <- standard_df %>%
  mutate(score_category = cut(score, breaks = c(0, 60, 70, 80, 90, 100), 
                              labels = c("0-60", "60-70", "70-80", "80-90", "90-100"), include.lowest = TRUE))

# organize them so it will be from bottom to top
standard_df$score_category <- factor(standard_df$score_category, levels = rev(levels(standard_df$score_category)))

# calculate the number of students per interaction range and grade category
grade_counts <- standard_df %>%
  group_by(interaction_range, score_category) %>%
  summarise(count = n()) 

# Calculate percentage of each group
grade_counts <- grade_counts %>% 
  group_by(interaction_range) %>% 
  mutate(percentage = round((count/sum(count)) * 100, 2))

# Plot
p <- ggplot(grade_counts, aes(x = interaction_range, y = count, fill = score_category, 
                              text = paste("Percentage:", percentage, "%"))) +
  geom_bar(stat = "identity") +
  labs(x = "Interaction Range", y = "Number of Students", fill = "Score Category") +
  theme_minimal() +
  ggtitle("Number of Students for Each Score Category and Interaction Range") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Convert to interactive plotly plot
gp <- ggplotly(p, tooltip = "text")
print(gp)



#save the interactive plot 
# Install the htmlwidgets package if you haven't already
#if (!require(htmlwidgets)) install.packages("htmlwidgets")

# Save your plotly graph to an html file
#htmlwidgets::saveWidget(gp, "student_interaction_range.html")


# 5: --------------- violin plot that shows grade distribution per interaction range ---------------#

# simple violin plots
ggplot(standard_df, aes(x = interaction_range, y = score)) +
  geom_violin() +
  labs(x = "Interaction Range", y = "Score") +
  theme_minimal() +
  ggtitle("Score Distribution for Each Interaction Range") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

levels(standard_df$interaction_range)

#advanced violin plot 

# Set your colors
interaction_color1 <- "#BEBEBE"
interaction_color2 <- "#0000FF"
interaction_color3 <- "#FF0000"
interaction_color4 <- "#008000"
interaction_color5 <- "#800080"
interaction_color6 <- "#808000"
interaction_color7 <- "#00FFFF"
interaction_color8 <- "#FF00FF"
interaction_color9 <- "#000080"

# Get the counts
interaction_counts <- standard_df %>%
  count(interaction_range)

interaction_range_labels <- c("< -1.5", "-1.5 / -1.0", "-1.0 / -0.5", "-0.5 / 0", "0 / 0.5", 
                              "0.5 / 1.0", "1.0 / 1.5", "1.5 / 2.0", "2.0 and above")
interaction_range_colors <- c(interaction_color1, interaction_color2, interaction_color3,
                              interaction_color4, interaction_color5, interaction_color6,
                              interaction_color7, interaction_color8, interaction_color9)

interaction_range_n <- purrr::map_dbl(interaction_range_labels, 
                                      ~ interaction_counts %>% filter(interaction_range == .x) %>% pull(n))

# plot bit 亂 （dots all over the place）
#standard_df %>%
#  ggplot(aes(x=interaction_range, y=score, fill=interaction_range)) +
#  geom_violin(show.legend=FALSE, width=0.6, alpha=0.5) +  # make violins slightly transparent
#  geom_jitter(show.legend=FALSE, width=0.25, shape=21, color="black", fill="black", alpha=0.7) +  # make dots darker
#  labs(x=NULL, y="Score") +
#  scale_x_discrete(labels=interaction_range_labels) +
#  scale_fill_manual(name=NULL,
#                    breaks=interaction_range_labels,
#                    labels=interaction_range_labels,
#                    values=interaction_range_colors) +
#  theme_classic() +
#  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Using geom_dotplot
standard_df %>%
  ggplot(aes(x=interaction_range, y=score, fill=interaction_range)) +
  geom_violin(show.legend=FALSE, width=0.6, alpha=0.5) +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.3, fill="black") + # adjust dotsize here
  labs(x=NULL, y="Score") +
  scale_x_discrete(labels=interaction_range_labels) +
  scale_y_continuous(breaks = seq(0, max(standard_df$score), by = 10)) + # Adjust the breaks here
  scale_fill_manual(name=NULL,
                    breaks=interaction_range_labels,
                    labels=interaction_range_labels,
                    values=interaction_range_colors) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# 5: --------------- code speed and score ---------------# no findings.  

# create scatter plot
ggplot(standard_df, aes(x = total_interactions, y = score)) +
  geom_point() +
  labs(x = "code_speed", y = "Score") + 
  theme_minimal() +
  ggtitle("Relationship between Total Interactions and Score")

names(standard_df)


# 5: --------------- let's go back to the boxplot of average per class and consider if their interactions match up  ---------------# 

# Set theme
theme_set(theme_bw(12))

# Calculate average total_interactions and average score per class
avg_interaction_score <- standard_df %>%
  group_by(class) %>%
  summarise(avg_interaction = mean(total_interactions), 
            avg_score = mean(score)) %>%
  arrange(avg_interaction)

# Update the class variable to include average score
avg_interaction_score$class <- paste(avg_interaction_score$class, " (Avg. Score: ", round(avg_interaction_score$avg_score, 2), ")", sep = "")

# Plot
ggplot(avg_interaction_score, aes(x = reorder(class, avg_interaction), y = avg_interaction, fill = class)) +
  geom_bar(stat = "identity", width = 0.5) +
  geom_text(aes(label = round(avg_interaction, 2), 
                hjust = ifelse(avg_interaction > 0, -0.1, 1.1),
                vjust = 0.5)) +
  coord_flip() +
  labs(x = "Class", y = "Average Interaction") +
  theme_minimal() +
  theme(legend.position = "none")

# Create scatter plot using ggplot() function THIS ONE NOT NECCESARY PERHAPS!
ggplot(standard_df, aes(x = total_interactions, y = score, color = class)) +
  geom_point() +
  stat_ellipse() + 
  theme(legend.position = "top") +
  labs(x = "Total Interactions", y = "Score", color = "Class")

#let's look at the interesting classes ! 
aeg_df <- standard_df %>%
  filter(class == 'a' | class == 'e' | class == 'g')

# Create scatter plot using ggplot() function
ggplot(aeg_df, aes(x = total_interactions, y = score, color = class)) +
  geom_point() +
  stat_ellipse() + 
  theme(legend.position = "top") +
  labs(x = "Total Interactions", y = "Score", color = "Class")

# Generate the base plot
p <- ggplot(aeg_df, aes(x = total_interactions, y = score, color = class)) +
  geom_point() +
  stat_ellipse() +
  theme(legend.position = "bottom") +
  labs(x = "Total Interactions", y = "Score", color = "Class")

# Add marginal histograms
ggMarginal(p, type = "histogram", 
           groupColour = TRUE,
           groupFill = TRUE)

#now compare class a with class h (the class with the lowest average interaction). 
#let's look at the interesting classes ! 
ah_df <- standard_df %>%
  filter(class == 'a' | class == 'h')


# Generate the base plot
p <- ggplot(ah_df, aes(x = total_interactions, y = score, color = class)) +
  geom_point() +
  stat_ellipse() +
  theme(legend.position = "bottom") +
  labs(x = "Total Interactions", y = "Score", color = "Class")

# Add marginal histograms
ggMarginal(p, type = "histogram", 
           groupColour = TRUE,
           groupFill = TRUE)

#now plot
#now compare class a with class h (the class with the lowest average interaction). 
#let's look at the interesting classes ! 
ae_df <- standard_df %>%
  filter(class == 'a' | class == 'e')


# Generate the base plot
p <- ggplot(ae_df, aes(x = total_interactions, y = score, color = class)) +
  geom_point() +
  stat_ellipse() +
  theme(legend.position = "bottom") +
  labs(x = "Total Interactions", y = "Score", color = "Class")

# Add marginal histograms
ggMarginal(p, type = "histogram", 
           groupColour = TRUE,
           groupFill = TRUE)




# plot average interaction per class in diverging bar chart. 






names(standard_df)


#----------------- different variable means for students with grades higher than 80 and lower than 80 ------------------#


# Add a new column to your dataframe that categorizes the students based on their scores
standard_df <- standard_df %>%
  mutate(score_group = ifelse(score > 80, "Over 80", "Below 80"))

# Calculate the mean of total_interactions for each group
mean_interactions <- standard_df %>%
  group_by(score_group) %>%
  summarise(mean_total_interactions = mean(total_interactions, na.rm = TRUE))

# Print the result
print(mean_interactions)

# Order score_group in ascending order to make the plot more interpretable
mean_interactions <- mutate(mean_interactions, score_group = factor(score_group, levels = c("Below 80", "Over 80")))

# Plotting
ggplot(mean_interactions, aes(x = score_group, y = mean_total_interactions, fill = score_group)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(x = "Score Group", y = "Mean of Total Interactions", fill = "Score Group") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#boxplot

# Plotting
ggplot(standard_df, aes(x = score_group, y = total_interactions, fill = score_group)) +
  geom_boxplot() +
  stat_summary(fun = mean, geom = "point", shape = 20, size = 3, color = "black") +
  coord_flip() +
  labs(x = "Score Group", y = "Total Interactions", fill = "Score Group") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#errors for students above and below 80
# Define columns to exclude
exclude_cols <- c("userid", "score", "class", "Viscode.spent_time")

# Create a vector of columns containing 'Error'
error_cols <- colnames(standard_df)[grepl("Error", colnames(standard_df))]

# Add 'score' to the vector of selected columns (necessary for grouping)
selected_cols <- c(error_cols, "score")

# Compute means for each group and keep it in the same dataframe
mean_df <- standard_df %>%
  select(one_of(selected_cols)) %>%
  mutate(score_group = ifelse(score > 80, "Over 80", "Below 80")) %>%
  group_by(score_group) %>%
  summarise(across(-one_of(exclude_cols), mean, na.rm = TRUE)) %>%
  pivot_longer(cols = -score_group, names_to = "variable", values_to = "mean")

# Plotting
ggplot(mean_df, aes(x = variable, y = mean, fill = score_group)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(x = "Variables", y = "Average", fill = "Score Group") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

names(standard_df)



# Define the columns you're interested in
selected_cols <- c("ADD.BOOKMARK", "ADD.MARKER", "ADD.MEMO", "ADD_HW_MEMO", 
                   "ADD_RECOMMENDATION", "BOOKMARK_JUMP", "CHANGE.MEMO", "CLEAR_HW_MEMO",
                   "CLOSE", "CLOSE_RECOMMENDATION", "DELETE.BOOKMARK", "DELETE.MARKER",
                   "DELETE_MEMO", "GETIT", "LINK_CLICK", "MEMO_JUMP", "NEXT", "NOTGETIT",
                   "OPEN", "OPEN_RECOMMENDATION", "PAGE_JUMP", "PREV", "REGIST.CONTENTS",
                   "SEARCH", "SEARCH_JUMP", "UNDO_HW_MEMO")

# Define columns to exclude
exclude_cols <- c("userid", "score", "class", "Viscode.spent_time")

# Add 'score' to the vector of selected columns (necessary for grouping)
selected_cols <- c(selected_cols, "score")

# Compute means for each group and keep it in the same dataframe
mean_df <- standard_df %>%
  select(one_of(selected_cols)) %>%
  mutate(score_group = ifelse(score > 80, "Over 80", "Below 80")) %>%
  group_by(score_group) %>%
  summarise(across(-one_of(exclude_cols), mean, na.rm = TRUE)) %>%
  pivot_longer(cols = -score_group, names_to = "variable", values_to = "mean")

# Plotting
ggplot(mean_df, aes(x = variable, y = mean, fill = score_group)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(x = "Variables", y = "Average", fill = "Score Group") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))






































