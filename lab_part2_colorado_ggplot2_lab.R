##################################################################
### лабораторная работа ggplot2:  Часть вторая лабораторная работа
### университета Колорадо 
##################################################################

film_death_counts <- read.csv(file="film_death_counts.csv",header = T)

library(ggplot2)

head(film_death_counts)

ggplot(data=film_death_counts, aes(x=Year, y = IMDB_Rating)) + geom_point(aes(color=MPAA_Rating)) + ylab("Average IMDB Rating")

ggplot(data=film_death_counts, aes(x=Year, y = IMDB_Rating)) + geom_smooth() + ylab("Average IMDB Rating") + ylim(2,9)

library(dplyr)
film_death_counts_filtered = film_death_counts %>% filter(MPAA_Rating %in% c("G", "PG", "PG-13", "R"))
ggplot(data=film_death_counts_filtered, aes(x=Body_Count)) + geom_histogram() + facet_grid(.~MPAA_Rating) + scale_y_sqrt(limits=c(0,150)) + xlab("Number of deaths") + xlim(0,800)



film_death_counts$deaths_per_minute <- film_death_counts$Body_Count/film_death_counts$Length_Minutes
ggplot(data=film_death_counts, aes(deaths_per_minute, title)) + geom_bar()
