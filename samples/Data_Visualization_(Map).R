library(tidyverse)
library(usmap)

setwd("/home/leonardr/math241S20PkgGrp9/data")
load(file = "anwObstacles.rda")

class(anwObstacles$Season)
class(anwObstaclesninja$Location)

ninja <- filter(anwObstacles, Season >= 5)
ninja_US <- filter(ninja, Location != "Venice")
ninja_USA <- filter(ninja_US, Location != "San Pedro (Military)")

ninja_map <- ninja_USA %>%
  group_by(Location) %>%
  summarize("Total Obstacles" = n(), "Seasons" = n_distinct(`Season`))

latitude <- c(33.75, 39.29, 41.49, 32.78, 29.21, 39.74, 29.76, 39.77, 39.10, 36.17, 34.05, 25.76, 44.98, 35.47, 28.54, 39.95, 40.44, 29.42, 38.63)
longitude <- c(-84.39, -76.61, -81.69, -96.79, -81.03, -105.00, -95.37, -86.16, -94.58, -115.14, -118.24, -80.19, -93.27, -97.42, -81.38, -75.17, -80.00, -98.49, -90.20)

ninja_map$latitude <- latitude
ninja_map$longitude <- longitude

ninja_map <- ninja_map[c("longitude", "latitude", "Location", "Total Obstacles", "Seasons")]

cities <- usmap_transform(ninja_map)

plot_usmap(fill = "dodgerblue4", alpha = 0.5, color = "gray100", size = 1) +
  ggrepel::geom_label_repel(data = cities,
                            aes(x = longitude.1, y = latitude.1, label = Location),
                            size = 4, alpha = 1,
                            label.r = unit(0.5, "lines"), label.size = 0.5) +
  geom_point(data = cities,
             aes(x = longitude.1, y = latitude.1, size = Total.Obstacles),
             color = "firebrick3", alpha = 0.8) +
  scale_size_continuous(breaks = seq(15, 150, 15), 
                        range = c(0, 15),
                        limits = c(0, 150),) +
  labs(title = "American Ninja Warrior Obstacles",
       subtitle = "Seasons 5-10",
       size = "Total Obstacles") +
  theme(plot.title = element_text(size = 18)) +
  theme(plot.subtitle = element_text(face="italic", size = 16)) +
  theme(legend.position = "right")
