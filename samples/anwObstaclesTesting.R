library(tidyverse)
Obs <- anwObstacles %>%
        rename("ObstacleName" = "Obstacle Name") %>%
        count(ObstacleName) %>%
        ggplot() +
        geom_bar(stat = "identity", aes(x = ObstacleName, y = n)) +
        labs(x = "Obstacle", y = "Number of Appearances on ANW")
Obs