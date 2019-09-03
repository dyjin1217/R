# 참고자료 : 이부일 교수님 Youtube 강의

library(tidyverse)
library(RColorBrewer)
# 예제 데이터 : ggplot2::diamonds
# 질적 자료   : cut, color, clarity

# 1. 일변량 질적자료 분석
# 1.1 표 = 빈도표(Frequency Table)
# (1) 빈도(Frequency)
# (2) 백분율 (Percent)


# 1.2 그래프

# (1) 막대그래프
# barplot(frequency or percent)
barplot(table(diamonds$cut))
barplot(sort(table(diamonds$cut),decreasing = TRUE))

# col = color
barplot(sort(table(diamonds$cut),decreasing = TRUE),
        col="purple")
barplot(sort(table(diamonds$cut),decreasing = TRUE), 
        col=c("red","blue","purple","green","yellow"))
barplot(sort(table(diamonds$cut),decreasing = TRUE), 
        col=c("red","blue"))

color.palatte <- RColorBrewer::brewer.pal(n = 5, name = "Blues")
barplot(sort(table(diamonds$cut),decreasing = TRUE), 
        col=color.palatte)
barplot(sort(table(diamonds$cut),decreasing = TRUE), 
        col=sort(color.palatte, decreasing=FALSE))

# 차트의 제목 main = "title"        

barplot(sort(table(diamonds$cut),decreasing = TRUE), 
        col=sort(color.palatte, decreasing=FALSE),
        main = "Cut of Diamonds")

# x축 제목 : xlab = "x's axis title'
# xlab = xlabel 약자

barplot(sort(table(diamonds$cut),decreasing = TRUE), 
        col=sort(color.palatte, decreasing=FALSE),
        main = "Cut of Diamonds",
        ylab = "Frequency",
        xlab = "Cut")

# x축눈금 = xlim = c(min,max)
# xlim = ylimit의 약자
# horiz 입력시 x,y축 교환 필요
barplot(sort(table(diamonds$cut),decreasing = FALSE), 
        col=sort(color.palatte, decreasing=FALSE),
        main = "Cut of Diamonds",
        xlab = "Frequency",
        ylab = "Cut",
        xlim = c(0,25000),
        horiz = TRUE)


        