
# anwObstacles

<!-- badges: start -->
<!-- badges: end -->

The goal of anwObstacles is to provide easy access to data regarding obstacle placement in seasons 1-10 of American Ninja Warrior.



## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(anwObstacles)
library(tidyverse)
Obs <- anwObstacles %>%
        count(ObstacleName) %>%
        ggplot() +
        geom_bar(stat = "identity", aes(x = ObstacleName, y = n)) +
        labs(x = "Obstacle", y = "Number of Appearances on ANW")
Obs
```
