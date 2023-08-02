# 1: --------------- PREPARE PACKAGES ---------------#
#install packages if not done so before
#install.packages('tidyverse')
#install.packages('ggplot2')
#install.packages('plotly')
#install.packages('gridExtra')
#install.packages('ggExtra')

#load packages into session
library('tidyverse')
library('ggplot2')
library('plotly')
library('gridExtra')
library('ggExtra')

# 2: --------------- GET AND PREPROCESS DATA ---------------#
standard_df<-read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/standard.csv")
standard_df <- standard_df[rowSums(is.na(standard_df)) <= 30, ]


# 3: --------------- scores per class (boxplots) ---------------#

#info on boxplots https://www.sharpsightlabs.com/blog/ggplot-boxplot/

#simple plot 
ggplot(standard_df, aes(x = class, y = score)) +
  geom_boxplot() +
  labs(x = "Class", y = "Score") +
  theme_minimal() +
  ggtitle("Score Distribution per Class") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#STEP 1: get failcount and failrate per class 
count_failrate <- standard_df %>% 
  mutate(fail = ifelse(score < 60, 1, 0)) %>%
  group_by(class) %>%
  summarise(total = n(),
            fail_count = sum(fail),
            fail_rate = round((fail_count / total * 100), 1)) #one decimal

#STEP2: merge together
standard_df<-merge(standard_df, count_failrate, by = "class")

#STEP 3: create complex boxplot
ggplot(standard_df, aes(x = class, y = score)) + #define X and Y axis
  geom_boxplot(aes(fill = class)) + #set colour
  #insert label 1 (fail_count)
  geom_label(aes(label = paste0("fail count: ", fail_count), y = 104), #specify label location
             vjust = 0, #slightly adjust the position of the label (relative to y)
             size = 3, #adjust the size of the label 
             fill = "light blue", #adjust colour of the plot
             label.size = 0.35, #adjust size of label border
             label.padding = unit(0.2, "lines"), #adjust space between text and border
             label.r = unit(0.15, "lines")) + #adjust border roundness
  geom_label(aes(label = paste0("failrate: ", fail_rate), y = 100),
             vjust = 0,
             size = 3,
             fill = "light green",
             label.size = 0.35,
             label.padding = unit(0.2, "lines"),
             label.r = unit(0.15, "lines")) +
  labs(x = "Class", y = "Score") +
  theme_minimal() + 
  ggtitle("Score Distribution per Class") + #set title 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) #basic settings

# 4: --------------- interactions influence on score (Violin plot) ---------------#
# Re-Import the data
standard_df <- read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/standard.csv")
standard_df <- standard_df[rowSums(is.na(standard_df)) <= 30, ]

# Calculate total_interactions by summing all columns except the specified ones
columns_to_exclude <- c('userid', 'score', 'class', 'Viscode.spent_time')
standard_df$total_interactions <- rowSums(select(standard_df, -columns_to_exclude))

# Standardize 'total_interactions'
standard_df$total_interactions <- scale(standard_df$total_interactions) %>% as.vector()

# Define interaction ranges
interaction_ranges <- c('< -1.5', '-1.5 / -1.0', '-1.0 / -0.5', '-0.5 / 0', '0 / 0.5', '0.5 / 1.0', '1.0 / 1.5', '1.5 and above')
breaks <- c(-Inf, -1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5, Inf)
standard_df$interaction_range <- cut(standard_df$total_interactions, breaks = breaks, 
                                     labels = interaction_ranges, include.lowest = TRUE, right = FALSE)

# Set colors
interaction_range_colors <- c("#BEBEBE", "#0000FF", "#FF0000", "#008000", "#800080", "#808000", "#00FFFF", "#FF00FF")

#get avg_scores and fail_rate per interaction range
summary_data <- standard_df %>%
  mutate(fail = ifelse(score < 60, 1, 0)) %>%
  group_by(interaction_range) %>%
  summarise(
    avg_score = mean(score),
    total = n(),
    fail_count = sum(fail),
    fail_rate = round((fail_count / total * 100), 1) #one decimal
  )


# Merge this information back to the original dataframe
standard_df <- merge(standard_df, summary_data, by = "interaction_range", all.x = TRUE)

#plot data
standard_df %>%
  ggplot(aes(x=interaction_range, y=score, fill=interaction_range)) + #specify data 
   geom_violin(show.legend=FALSE, width=0.6, alpha=0.5) + #specify violin plot
   geom_dotplot(binaxis='y', stackdir='center', dotsize=0.3, fill="black") + #add dots to visualize individual scores
   labs(x='Interaction Range', y="Score") + #set X and Y axis labels
   scale_x_discrete(labels=interaction_ranges) + #set X axis scales and labels
    scale_y_continuous(breaks = seq(0, max(standard_df$score, na.rm=TRUE), by = 10)) + #set y axis scale and labels
    scale_fill_manual(name=NULL,
                      breaks=interaction_ranges,
                     labels=interaction_ranges,
                      values=interaction_range_colors) + #use the colors that we created before 
    theme_classic() + #set theme 
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) + #basic settings
    geom_text(aes(x = interaction_range, y = 105,  #add the average scores per interaction range on position y = 105
                                         label = paste("avg score:", round(avg_score, 2))), size = 3, color = "black")+
    geom_text(aes(x = interaction_range, y = 102,  #add the failrate per interaction range on position y=102 
                                        label = paste("failrate: ", round(fail_rate, 2))), size = 3, color = "black")

#basic violin plot (ugly)

# Basic violin plot
# Basic violin plot
standard_df %>%
  ggplot(aes(x=interaction_range, y=score)) +
  geom_violin(show.legend=FALSE) +
  labs(x='Interaction Range', y="Score") +
  theme_classic()


# 5: --------------- advanced scatter plot  ---------------# 

# Set theme
#theme_set(theme_bw(12))


#create new df that only contains the data of the two classes of interest
ae_df <- standard_df %>%
  filter(class == 'a' | class == 'e')

# Generate the base plot
#specify the df we want to plot, the X-axis, Y-axis and the colors
p <- ggplot(ae_df, aes(x = total_interactions, 
                       y = score, color = class)) + 
  geom_point() + #specify that it has to be a scatter plot
  stat_ellipse()+ #add an ellipse 
  theme(legend.position = "bottom") + #put legend below the image
  #specify the labels for the X and Y axis 
  labs(x = "Total Interactions", y = "Score", color = "Class") 

# Add marginal histograms
ggMarginal(p, type = "histogram", #specify type of plot
           groupColour = TRUE, #set color same as dots
           groupFill = TRUE) #set color same as dots


#----------------- BONUS: different variable means for students with grades higher than 80 and lower than 80 ------------------#


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
exclude_cols <- c("userid", "score", "class", "standard.spent_time")

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












