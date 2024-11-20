##Install the packages that are needed for this task.
library(ggplot2)
library(dplyr)
library(tidyverse)

head(diamonds)

##Removing all of the columns that are not required for this task.
##We got rid of columns like carot, and color.
diamondFrequencyStats <- diamonds %>%
  dplyr::select(!carat) %>%
  dplyr::select(!color) %>%
  dplyr::select(!clarity) %>%
  dplyr::select(!depth) %>%
  dplyr::select(!table) %>%
  dplyr::select(!price) %>%
  group_by(cut) %>%
  ##Looking at all of the mathematical functions like mean, maedian and quartiles.
  summarize(
    count = n(),
    ##Using the across function to go through all values of x, y, and z
    across(
      c(x,y,z),
      .fns = list(
        min = ~min(.x),
        Q1 = ~quantile(.x, 0.25),
        median = ~median(.x),
        Q3 = ~quantile(.x, 0.75),
        mean = ~mean(.x),
        sd = ~sd(.x),
        max = ~max(.x),
        mad = ~mad(.x)
      )
    )
  )
  
##View Final Table
View(diamondFrequencyStats)
  


