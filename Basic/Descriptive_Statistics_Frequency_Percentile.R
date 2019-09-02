# 참고자료 : 이부일 교수님 Youtube 강의

# Frequency(빈도 구하기)

library(ggplot2)

# ggplot2::diamonds
# 질적 자료 : cut, color, clarity

# (1) 빈도(Frequency) 구하기
# table(data$variable)
table(diamonds$cut)

# sort(frequency, decreasing = TRUE)
sort(table(diamonds$cut), decreasing = TRUE)


# (2) 백분율(Percent) 구하기
# prop.table(frequency)*100
prop.table(table(diamonds$cut))*100
sort(prop.table(table(diamonds$cut))*100 , decreasing 
     = TRUE)

# 백분율의 소수점 자리수는 1자리만까지만 표현함
# round(percent, digits = 1)
round(sort(prop.table(table(diamonds$cut))*100 , 
           decreasing = TRUE) , digits = 1)


library(tidyverse)
library(prettyR)

# 예제 데이터 : ggplot2::diamonds
# 질적 자료     : cut, color, clarity


# 1. 일변량(Uni-Variate) 질적 자료의 분석
# 1.1 표 : 빈도, 백분율
# (1) 빈도 구하기   : table(data$variable)
# (2) 백분율 구하기 : prop.table(table(data$variable))* 100

# 빈도와 백분율을 한 번에 구하기
# prettyR::freq(data$variable,
#               display.na = TRUE or FALSE,
#               decr.order = TRUE or FALSE)

prettyR::freq(diamonds$cut)

# NA와 유효백분율을 출력하지 않음
prettyR::freq(diamonds$cut,
              display.na = FALSE)

# 빈도를 기준으로 오름차순으로 정렬하기
prettyR::freq(diamonds$cut,
              display.na = FALSE,
              decr.order = FALSE)

# 빈도를 기준으로 내림차순으로 정렬하기
prettyR::freq(diamonds$cut,
              display.na = FALSE,
              decr.order = TRUE)

library(tidyverse)
library(prettyR)
library(epiDisplay)

# 예제 데이터 : ggplot2::diamonds
# 질적 자료 : cut, color, clarity

# 1. 일변량(Uni-Variate) 질적 자료의 분석
# 1.1 표 : 빈도, 백분율
# (1) 빈도 구하기   : table(data$variable)
# (2) 백분율 구하기 : prop.table(table(data$variable)) * 100

# 빈도와 백분율을 한 번에 구하기 : prettyR::freq()
# prettyR::freq(data$variable,
#               display.na = TRUE or FALSE,
#               decr.order = TRUE or FALSE)

prettyR::freq(diamonds$cut)

prettyR::freq(diamonds$cut,
              display.na = FALSE)

prettyR::freq(diamonds$cut,
              display.na = FALSE,
              decr.order = FALSE)

prettyR::freq(diamonds$cut,
              display.na = FALSE,
              decr.order = TRUE)

# 빈도와 백분율을 한 번에 구하기 : epiDisplay::tab1()
# epiDisply::tab1(data$variable,
#                 cum.percent = TRUE or FALSE,
#                 sort.group  = "increasing" or "decreasing")

epiDisplay::tab1(diamonds$cut)

# 누적 백분율을 출력하지 않음
epiDisplay::tab1(diamonds$cut,
                 cum.percent = FALSE)


# 빈도를 기준으로 내림차순으로 정렬하기
epiDisplay::tab1(diamonds$cut,
                 cum.percent = FALSE,
                 sort.group  = "decreasing")

# 빈도를 기준으로 오름차순으로 정렬하기
epiDisplay::tab1(diamonds$cut,
                 cum.percent = FALSE,
                 sort.group  = "increasing") 



