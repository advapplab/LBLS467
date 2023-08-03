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


# ---------------- 1. Questions and answers boxplot ------------ #

#questions: 
#1. 請稍微調整顯示fail_rate跟fail_count標籤的位置 (geom_label)

#2. 請自己加一個顯示每一班total student的一個標籤
  #算每一班的總共有多少學生 (we already have a variable that contains the number of students see 'total')
  #把新的資料merge到我們的df
  #使用geom_label來顯示新的variable


#ANSWER (all in one)
#note that we do not neccesarily have to 

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
  geom_label(aes(label = paste0("fail count: ", fail_count), y = 105), #specify label location
             vjust = 0, #slightly adjust the position of the label (relative to y)
             size = 3, #adjust the size of the label 
             fill = "light blue", #adjust colour of the plot
             label.size = 0.35, #adjust size of label border
             label.padding = unit(0.2, "lines"), #adjust space between text and border
             label.r = unit(0.15, "lines")) + #adjust border roundness
  #insert label 2 (failrate)
  geom_label(aes(label = paste0("failrate: ", fail_rate), y = 101),
             vjust = 0,
             size = 3,
             fill = "light green",
             label.size = 0.35,
             label.padding = unit(0.2, "lines"),
             label.r = unit(0.15, "lines")) +
  # insert label 3 (total students)
  geom_label(aes(label = paste0("total students: ", total), y = 97), #specify label location
             vjust = 0, #slightly adjust the position of the label (relative to y)
             size = 3, #adjust the size of the label 
             fill = "light gray", #adjust colour of the plot
             label.size = 0.35, #adjust size of label border
             label.padding = unit(0.2, "lines"), #adjust space between text and border
             label.r = unit(0.15, "lines")) + #adjust border roundness             
  labs(x = "Class", y = "Score") +
  theme_minimal() + 
  ggtitle("Score Distribution per Class") + #set title 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) #basic settings



# ---------------- 2. Questions and answers violin plot ------------ #

#run this part before starting the exercise #$&^%@
standard_df<-read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/standard.csv")
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
#until here #$&^%@

#QUESTIONS
#1. 請調整小提琴圖裡面的點的大小

#2. 請把小提琴圖變成一個boxplot，你覺得哪一個比較好看？
  #暗示: geom_violin...

#plot data
standard_df %>%
  ggplot(aes(x=interaction_range, y=score, fill=interaction_range)) + #specify data 
  geom_boxplot(show.legend=FALSE, width=0.6, alpha=0.5) + #<---- change geom_violin into geom_boxplot here
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.1, fill="black") + #<----- change dotsize here
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






# ---------------- 3. Questions and answers advanced scatter plot ------------ #
#run this part before starting the exercise #$&^%@
standard_df<-read.csv("https://raw.githubusercontent.com/advapplab/LBLS467/main/data/standard.csv")
standard_df <- standard_df[rowSums(is.na(standard_df)) <= 30, ]
# Calculate total_interactions by summing all columns except the specified ones
columns_to_exclude <- c('userid', 'score', 'class', 'Viscode.spent_time')
standard_df$total_interactions <- rowSums(select(standard_df, -columns_to_exclude))
# Standardize 'total_interactions'
standard_df$total_interactions <- scale(standard_df$total_interactions) %>% as.vector()
#until here #$&^%@
#QUESTIONS
#1.  compare two other classes, like f and h
#2.  turn the marginalized histogram into a marginalized boxplot
#3.  adjust the settings of the ellipse to 98%


#answer (all in one) :
#create new df that only contains the data of the two classes of interest
fh_df <- standard_df %>%
  filter(class == 'f' | class == 'h') #<---- CHANGE TO OTHER CLASSES

# Generate the base plot
#specify the df we want to plot, the X-axis, Y-axis and the colors
p <- ggplot(fh_df, aes(x = total_interactions, 
                       y = score, color = class)) + 
  geom_point() + #specify that it has to be a scatter plot
  stat_ellipse(level=0.99)+ #<----- ADJUST ELLIPSE SETTINGS  
  theme(legend.position = "bottom") + #put legend below the image
  #specify the labels for the X and Y axis 
  labs(x = "Total Interactions", y = "Score", color = "Class") 

# Add marginal histograms
ggMarginal(p, type = "boxplot", #<------ADJUST MARGINALIZED PLOT TO BOXPLOT
           groupColour = TRUE, #set color same as dots
           groupFill = TRUE) #set color same as dots



