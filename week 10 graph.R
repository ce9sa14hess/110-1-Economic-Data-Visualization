
```{r}
data1 = list() 
data1$Poland <- data.frame(
  x=c(10, 10, 10),
  y=c(18, 100-18-20, 20),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)
data1$US <- data.frame(
  x=c(9, 9, 9),
  y=c(18, 100-18-16, 16),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)

data1$France <- data.frame(
  x=c(8, 8, 8),
  y=c(25, 100-25-38, 38),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)

data1$Britain <- data.frame(
  x=c(7, 7, 7),
  y=c(30, 100-30-21, 21),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)

data1$Canada <- data.frame(
  x=c(6, 6, 6),
  y=c(33, 100-33-10, 10),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)


data1$Average <- data.frame(
  x=c(5, 5, 5),
  y=c(39.5, 100-39.5-21, 21),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)
data1$switzer <- data.frame(
  x=c(4, 4, 4),
  y=c(46, 100-46-17, 17),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)
data1$Italy <- data.frame(
  x=c(3, 3, 3),
  y=c(56, 100-56-28, 28),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)
data1$India <- data.frame(
  x=c(2, 2, 2),
  y=c(58, 100-58-30, 30),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)
data1$Mexico <- data.frame(
  x=c(1, 1, 1),
  y=c(73, 100-73-9, 9),
  fill=factor(c("More", "Same", "Less"),levels=c("Less", "Same", "More"))
)

country = c('Mexico(May 2020)', 'India(Apr 2020)', 'Italy(July 2020)','Switzerland(Feb 2021)', 'Average(unweighted)', 'Canada(Feb 2021)', 'Britain(Jan 2021)', 'France(Feb2021)', 'United States(Oct 2020)','Poland(Aug 2020)' )

ggplot()+
  geom_hline(yintercept = c(20, 40, 60, 80, 100), alpha = 0.5)+
  geom_text(
    mapping = aes(
      x = 10.7,
      y = c(20, 40, 60, 80, 100),
      label = c('20', '40', '60', '80', '100'),
      size = 0.25
    ))+
  list(
    geom_col(
      data = data1$Poland,
      mapping = aes(
        x = x,y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data=data1$US,
      mapping=aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$France ,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    
    geom_col(
      data = data1$Britain,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$Canada,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$Average,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$switzer,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$Italy,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$India,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ),
    geom_col(
      data = data1$Mexico,
      mapping = aes(
        x = x, y = y, fill = fill
      ),
      width=0.75
    ))+
  geom_text(
    mapping = aes(
      x = 10,
      y = c(5, 45, 85),
      label = c("Less", "Same", "More")
    ),
    color = 'White',
    vjust = 0.5,
    hjust = 0,
    position = position_dodge(width = 4),
    size = 5
  )+
  
  coord_flip()+
  theme_classic()+
  theme(axis.ticks.x= element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y= element_blank(),
        axis.text.y = element_text(
          vjust = 1,
           hjust = 0
        ),
        legend.position = "none")+
  scale_x_continuous(breaks = seq(1, 10, len = 10),  labels = country, expand = c(0,0))+
  scale_y_continuous (expand = c(0,0))+
  labs(x = NULL, y = NULL)+
  ggtitle('Does working from home allow you to be more or less productive?')


```
