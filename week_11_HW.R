library(readr)
dat <- read_csv("data/2020_top10_disease.csv")
str(dat)

disease <- dat$疾病
number <- (dat$`全國就醫人數(千人)`)/1000
point <- (dat$`平均值(點)`)


ggplot()+
  geom_col(
    data = dat,
    mapping = aes(
      x = disease ,
      y = point
    ),
    width = 0.8,
    fill = 2,
    group = 1
  )+
  geom_line(
    data = dat,
    mapping = aes(
      x = disease,
      y = number*10
    ),
    col = 'black',
    size = 2,
    group = 1
  )+
  geom_text(
    mapping = aes(
      x = seq(1,10),
      y = 100000,
      label = c('急性腎衰竭及慢性腎臟疾病', '口腔及唾液腺之疾病', '糖尿病', '高血壓性疾病', '消化器官之惡性腫瘤', '缺血性心臟病', '腦血管疾病', '急性上呼吸道感染', '因其他特定健康照護而接觸者', '呼吸道及胸內器官之惡性腫瘤')),
    angle = 90,
    alpha = 0.5,
    size = 4#input$size
  )+
  theme(axis.text.x=element_blank())+
  scale_y_continuous(labels = scales::comma, name= '就醫人數', expand = c(0,0), 
                     sec.axis = sec_axis( ~./10,labels = scales::comma, name = "門診費用平均"))+
  labs( title = '2020年全民健保門診前十大疾病',
        subtitle = "（單位：千人, 點）",
        caption = '資料來源：中央健康保險署三代倉儲系統門診、交付機構及住院明細檔', x = NULL, y = NULL)