library(readxl)
library(tidyr)
week13hw <- list()
week13hw$dat$raw <- read_excel("~/Downloads/Data_Extract_From_World_Development_Indicators-6.xlsx")
#week13hw$dat$raw|>View()
week13hw$dat$raw |>names()
week13hw$dat$y2008 <- select(week13hw$dat$raw , c(-"2018 [YR2018]", -"Country Code", -"Series Code"))
week13hw$dat$y2008 <- spread(week13hw$dat$y2008 , key = "Series Name", value = "2008 [YR2008]")

week13hw$dat$y2008  <-select(week13hw$dat$y2008 , -"CO2 emissions (kt)")
week13hw$dat$y2008$year<- 2008
#week13hw$dat$y2008|>View()

week13hw$dat$y2018 <- select(week13hw$dat$raw, c(-"2008 [YR2008]", -"Country Code", -"Series Code"))
week13hw$dat$y2018  = spread(week13hw$dat$y2018 , key = "Series Name", value = "2018 [YR2018]")
week13hw$dat$y2018|>names()
week13hw$dat$y2018  <-select(week13hw$dat$y2018 , -"CO2 emissions (kt)")
#dweek13hw$dat$y2018|>View()
week13hw$dat$y2018$year<- 2018
#week13hw$dat$y2018|>View()

names(week13hw$dat$y2018) <- c("country", 'co2', 'gdp', 'year' )
names(week13hw$dat$y2008) <- c("country", 'co2', 'gdp', 'year' )

week13hw$dat$final<-rbind(week13hw$dat$y2008, week13hw$dat$y2018)
#week13hw$dat$final$co2 <- week13hw$dat$final[ ,'co2']/2
#week13hw$dat$final$ <- week13hw$dat$final[ ,'co2']/2

#week13hw$dat$final|>View()
library(ggrepel)
length(week13hw$dat$final$country)
ggplot()+
  geom_point(
    aes(
      x = week13hw$dat$final$gdp,
      y = week13hw$dat$final$co2,
      group = week13hw$dat$final$year,
      alpha = week13hw$dat$final$year,
      size = week13hw$dat$final$co2
    ),
    colour="Blue"
  )+
  geom_segment(
    aes(
      x = subset(week13hw$dat$final, week13hw$dat$final$year == 2008)$gdp,
      y = subset(week13hw$dat$final, week13hw$dat$final$year == 2008)$co2,
      xend = subset(week13hw$dat$final, week13hw$dat$final$year == 2018)$gdp, 
      yend = subset(week13hw$dat$final, week13hw$dat$final$year == 2018)$co2
    ), arrow = arrow(length = unit(0.2,"cm")), size = 0.5 
  )+ 
  geom_text_repel(
    aes(
      x = subset(week13hw$dat$final, week13hw$dat$final$year == 2018)$gdp,
      y = subset(week13hw$dat$final, week13hw$dat$final$year == 2018)$co2,
      label = subset(week13hw$dat$final, week13hw$dat$final$year == 2018)$country
    ),
    size = 2.5 #input$size
  )+
  guides(
    alpha = guide_legend('top', title = "Year", label = TRUE),
    size = guide_legend(title = "CO2 (metric tons)", label = TRUE)
  )+
  scale_x_continuous(breaks = seq(0,60000,20000), labels = scales::comma, limits = c(0, 65000))+
  scale_y_continuous(breaks = seq(0,20,5), position = 'right', limits = c(0, 20), expand = expansion(mult = 0))+
  theme( 
    #panel.background = element_rect(fill = "White", colour = "grey50"),
    panel.grid.major = element_line(colour = "grey"),
    axis.line.x = element_line(),
    axis.ticks.x = element_blank(),
    axis.line.y = element_line(linetype = 0.5),
    axis.text.y = element_text(vjust = 0),
    axis.ticks.y = element_blank(),
    plot.caption = element_text(hjust = 0)
  )+
  labs( title = 'Top 15 CO2 Emitters and Their GDP Growth Between 2008 and 2018 ',
        subtitle = 'Selected countries, GDP growth and CO2 emissions reductions',
        caption = 'source: World Bank', x = 'GDP per person ($)', y = 'CO2 emissions per person  (metric tons)')
