# ==========================================================================

# DATA SCIENCE SEMINAR, FALL 2016, WEEK 04

# ==========================================================================

library("ggplot2")

# ==========================================================================

# set your working directory
# examples:
# Mac OSX = setwd("/Users/jdoe/Desktop")
# Windows, Personal = setwd("C:/Users/jdoe/Desktop")
# Windows, SLU Labs = setwd("E:/Users/jdoe/Desktop")

setwd("/Users/herb/Desktop")

# ==========================================================================

# file name - seminar-05.R

# project name - data science seminar, fall 2016

# purpose - week 05 - customizing plots

# created - 30 Nov 2016

# updated - 30 Nov 2016

# author - Chris

# ==========================================================================

# full description - 

# updates - 

# ==========================================================================
# ==========================================================================

# add data to data frame

df <- mpg

# ==========================================================================

# Plot from Last Week

ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method")

# ==========================================================================

# Labeling the X Axis and Y Axis

# xlab and ylab are applied in the background - this code produces the same
# output as the previous plot

# plot 2
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  xlab("displ") +
  ylab("hwy")

# adjusting the text in xlab and ylab allows you to manipulate their display

# plot 3
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  xlab("Displacement (liters)") +
  ylab("Highway Fuel Efficiency (miles per gallon)")

# ==========================================================================

# Adjusting Scales

# Limiting the scales will alter the underlying data available to R
# For example, R will refit both the linear and loess models based on the
# limited data displayed in the next plot

# plot 4
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  xlab("Displacement (liters)") +
  scale_y_continuous(name = "Highway Fuel Efficiency (miles per gallon)", limits = c(20, 40))

# This same technique can be used with the function scale_x_continuous()
# to adjust the x axis

# plot 5
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  scale_x_continuous(name = "Displacement (liters)", limits = c(2, 5)) +
  scale_y_continuous(name = "Highway Fuel Efficiency (miles per gallon)", limits = c(20, 40))

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Using cartesian coordinates, as in the example below, will not alter the
# underlying data, so the points and then regression lines appear to flow
# off the bottom of the plot.

# Plot 6 replicates plot 4, but with cartesian coordinates applied instead

# plot 6
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  xlab("Displacement (liters)") +
  ylab("Highway Fuel Efficiency (miles per gallon)") +
  coord_cartesian(ylim = c(20, 40))

# Plot 7 replicates plot 5

# plot 7
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  xlab("Displacement (liters)") +
  ylab("Highway Fuel Efficiency (miles per gallon)") +
  coord_cartesian(xlim = c(2, 5), ylim = c(20, 40))

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Expanding plots can also be done using cartesian coordinates
# This is useful if you want to show 0 on both axes

# plot 8
ggplot(df, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(color = "loess"), method = "loess", se = FALSE) +
  geom_smooth(aes(color = "lm"), method = "lm", se = FALSE) +
  labs(color = "Method") +
  xlab("Displacement (liters)") +
  ylab("Highway Fuel Efficiency (miles per gallon)") +
  coord_cartesian(xlim = c(0, 8), ylim = c(0, 45))

# ==========================================================================

# Working with Categorical Data

# this is a plot from a previous seminar

ggplot(df, aes(class)) +
  geom_bar() 

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# We can easily select a subset of the data to graph using the dplyr package

# install.packages("dplyr")
library(dplyr)

# plot 10
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class)) +
    geom_bar() 

# This does not alter the data frame itself, it only selects the appropriate
# observations to include in the plot

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Adding color

# There are two easy ways to adjust the colors of your bar graphs

# The first uses a setting to adjust the intensity of the color, known
# as 'chroma' in color theory

# plot 11
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
    geom_bar() +
    scale_fill_hue(c = 300)

# plot 12
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_fill_hue(c = 90)

# An alternative is to use the RColorBrewer package, which has a 
# range of predefined pallettes 

# plot 13
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")

# plot 14
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set2")

# A third alternative is to use grey scale

# plot 15
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_fill_grey()

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Changing labels

# plot 16
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_x_discrete(name = "Vehicle Class", labels = c("Two Seater", "Compact", "Subcompact")) +
  scale_fill_brewer(palette = "Set2")

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# editing the key

# legend position can be set to top, bottom, left, right, or none

# plot 16
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_x_discrete(name = "Vehicle Class", labels = c("Two Seater", "Compact", "Subcompact")) +
  scale_fill_brewer(palette = "Set2", name = "Legend") +
  theme(legend.position = "top")

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Adding titles

# plot 17
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_x_discrete(name = "Vehicle Class", labels = c("Two Seater", "Compact", "Subcompact")) +
  scale_fill_brewer(palette = "Set2", name = "Legend") +
  theme(legend.position = "top") +
  labs(title = "Small Cars")

# plot 17
df %>%
  filter(class == "2seater" | class == "compact" | class == "subcompact") %>%
  ggplot(., aes(class, fill = class)) +
  geom_bar() +
  scale_x_discrete(name = "Vehicle Class", labels = c("Two Seater", "Compact", "Subcompact")) +
  scale_fill_brewer(palette = "Set2", name = "Legend") +
  theme(legend.position = "top") +
  ggtitle("Small Cars")

# ==========================================================================

# Saving Your Plot

# pair with setwd() 
ggsave("test.png")
