library(ggplot2)
library(ggthemes)
library(extrafont)
library(plyr)
library(scales)
library(ggwaffle)
library(showtext)
nba <- read.csv("nbadraftas.csv")
showtext_auto()
font_add_google("Source Code Pro","source cp")

png("test.png", units="in", width=5, height=5, res=300)
>ggplot(nba, aes(as.factor(class), as.factor(player), fill = as.factor(all.star))) +
    geom_waffle() +
    coord_fixed() +
    theme_classic() +
    scale_y_discrete(limits = rev(levels(as.factor(nba$player)))) +
    scale_x_discrete(position = "top") +
    labs(title = "Former Lottery Picks That Became All Stars", y = "Overall Pick #",x = "Draft Year", fill = "All Star", caption= "Data Source: Baksetball Reference | Made by Neeraj Grover") +
    theme(axis.title.x = element_blank(), legend.position="right", legend.direction="vertical", legend.title = element_blank()) +
    theme(text = element_text(size = 11,family="source cp"), plot.title = element_text(size = 15),plot.caption = element_text(size = 8)) +
    scale_fill_manual(values=c('#cdcdcd',"#1C1D30"),labels = c("Not All Star","All Star")) +
    theme(plot.title = element_text(hjust = 0.5))
> dev.off()
