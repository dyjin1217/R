# 참고자료 : Youtube 이부일 교수님 강의자료

# 패키지 설치하기와 로딩하기
library(tidyverse)
library(plotly)

# Warning 끄기
options(warn=-1)


# 예제 데이터 : ggplot2::diamonds
# 양적 자료   : price

# 일변량 양적 자료의 분석
# 1. 표 = 빈도표
# (1) 구간의 빈도
# (2) 구간의 백분율

# i.   최소값, 최대값
# ii.  범위 : 최대값 - 최소값
# iii. 구간의 개수를 정함
# iv.  구간의 너비 = 폭 : 범위 / 구간의 개수
# v.   첫 번째 구간에는 최소값이 포함되도록 함
# vi.  제일 마지막 구간에는 최대값이 포함되도록 함

# price : 320 ~ 19000
# 0 ~ 5000
# 5000 ~ 10000
# 10000 ~ 15000
# 15000 ~ 20000

# 초과 ~ 이하
# 이상 ~ 미만

# data$new.variable <- cut(data$variable,
#                          breaks = 구간의 정보,
#                          right  = 하한과 상한 중에서 누가 =를 가질 것인가?)
diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0, to = 20000, by = 5000),
                            right  = FALSE) # 이상 ~ 미만 구간

View(diamonds)


# (1) 구간의 빈도 구하기
table(diamonds$price.group)

levels(diamonds$price.group) <- c("5000미만",
                                  "5000이상~10000미만",
                                  "10000이상~15000미만",
                                  "15000이상")

# (2) 구간의 백분율 구하기
prop.table(table(diamonds$price.group))*100
round(prop.table(table(diamonds$price.group))*100 , digits = 1)


# 2. 그래프
# (1) 히스토그램(Histogram)
# i. hist(data$variable)수
hist(diamonds$price)
hist(diamonds$price,
     xlim   = c(0, 20000),
     main   = "Histogram of Diamond Price",
     xlab   = "Price",
     labels = TRUE,
     col    = "purple")

# ii. hist(data$variable, breaks = 사용자가 원하는 구간 정보)
hist(diamonds$price,
     breaks = c(0, 5000, 10000, 15000, 20000),
     xlim   = c(0, 20000),
     main   = "Histogram of Diamond Price",
     xlab   = "Price",
     labels = TRUE,
     col    = "purple")

hist(diamonds$price,
     breaks = seq(from = 0, to = 20000, by = 5000),
     xlim   = c(0, 20000),
     main   = "Histogram of Diamond Price",
     xlab   = "Price",
     labels = TRUE,
     col    = "purple")

# iii. hist(data$variable, breaks = 구간의 개수)
hist(diamonds$price,
     breaks = 100,
     xlim   = c(0, 20000),
     main   = "Histogram of Diamond Price",
     xlab   = "Price",
     labels = TRUE,
     col    = "purple")


# ggplot2 패키지를 이용한 히스토그램 작성하기
# ggplot2::ggplot(data = , mapping = aes(x = )) + 
# geom_histogram(binwidth = , bins = ) +
# facet_wrap(~ variable)

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram()

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 2000) # 구간의 너비(폭)

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 10) # 구간의 개수

# 집단별 히스토그램
ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 10) +
  facet_wrap(~cut) # cut별 : 5개 집단

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 10) +
  facet_wrap(~cut + color) # cut * color : 5 * 7 = 35개 집단


# plotly 패키지를 이용하여 히스토그램 작성하기
# plotly::plot_ly(data     = data.name,
#                 x        = ~variable,
#                 type     = "histogram",
#                 xbins    = list(start = , end = , size = ),
#                 histnorm = "probability") %>%
#   plotly::layout(title = ,
#                  xaxis = ,
#                  yaxis = )
plotly::plot_ly(data = diamonds,
                x    = ~price,
                type = "histogram")

plotly::plot_ly(data  = diamonds,
                x     = ~price,
                type  = "histogram",
                xbins = list(start = 0, end = 20000, size = 2000))

plotly::plot_ly(data     = diamonds,
                x        = ~price,
                type     = "histogram",
                xbins    = list(start = 0, end = 20000, size = 2000),
                histnorm = "probability")

plotly::plot_ly(data     = diamonds,
                x        = ~price,
                type     = "histogram",
                xbins    = list(start = 0, end = 20000, size = 2000),
                histnorm = "probability") %>% 
plotly::layout(title = "Histogram of Price",
               xaxis = list(title = "Price"),
               yaxis = list(title = "Probability"))



# (2) 상자그림(Boxplot)
# 이상치(outlier) 유무를 파악하기 작성
# boxplot(data$variable, 
#         range      = 1.5,
#         horizontal = TRUE or FALSE,
#         col        =,
#         border     =,
#         notch      = TRUE or FALSE)
boxplot(diamonds$price)

boxplot(diamonds$price,
        horizontal = TRUE,
        col        = "orange",
        border     = "red",
        notch      = TRUE)

## ggplot2를 이용한 상자그림(Boxplot) 작성하기 

ggplot2::ggplot(data=diamonds, mapping = aes(x= "", y = price)) +
  geom_boxplot()

ggplot2::ggplot(data=diamonds, mapping = aes(x= "", y = price)) +
  geom_boxplot(color = "red", fill = "purple")

ggplot2::ggplot(data=diamonds, mapping = aes(x= "", y = price)) +
  geom_boxplot(color = "red", fill = "purple") +
  coord_flip()

ggplot2::ggplot(data=diamonds, mapping = aes(x= "", y = price)) +
  geom_boxplot(outlier.color="red", 
               outlier.shape=10,
               outlier.size = 3)

# 집단별로 그리기
ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price)) +
  geom_boxplot()

ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot()

ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot()

# 배경 투명하게 바꾸기
ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot() +
  theme_classic()

# 범례위치 변경
ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot() +
  theme_classic() +
  theme(legend.position = "bottom")

ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot(outlier.color = "red") +
  theme_classic() +
  theme(legend.position = "bottom")

# 집단별 그리기 (다른방법)
ggplot2::ggplot(data=diamonds, mapping = aes(x= "", y = price)) +
  geom_boxplot(outlier.color = "red") +
  theme_classic() +
  theme(legend.position = "right") +
  facet_wrap(~cut + color)

ggplot2::ggplot(data=diamonds, mapping = aes(x= "", y = price)) +
  geom_boxplot(outlier.color = "red") +
  theme_classic() +
  theme(legend.position = "right") +
  facet_wrap(~cut + color, nrow=5, ncol=7)
  

ggplot2::ggplot(data=diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot(outlier.color = "red") +
  theme_classic() +
  theme(legend.position = "right") +
  facet_wrap(~color, nrow=1, ncol=7)

# plotly 패키지를 이용한 상자그림 작성하기
# plotly::plot_ly(data = ,
#                 x    = ~,
#                 y    = ~,
#                 type = "box",)
#                 color = I("color"))

plotly::plot_ly(data = diamonds,
                y = ~price,
                type = "box")

plotly::plot_ly(data = diamonds,
                y = ~price,
                type = "box",
                color = I("purple"))

plotly::plot_ly(data = diamonds,
                x = ~cut,
                y = ~price,
                type = "box",
                color = I("purple"))

plotly::plot_ly(data = diamonds,
                x = ~cut,
                y = ~price,
                type = "box",
                color = I("purple"))

# 집단별 상자그림의 생깔
plotly::plot_ly(data = diamonds,
                x = ~cut,
                y = ~price,
                type = "box",
                color = ~cut)

# 집단별 상자그림의 생깔
plotly::plot_ly(data = diamonds,
                x = ~cut,
                y = ~price,
                type = "box",
                color = ~cut)


plotly::plot_ly(data = diamonds,
                x = ~cut,
                y = ~price,
                type = "box",
                color = ~color)

plotly::plot_ly(data = diamonds,
                x = ~interaction(cut,color),
                y = ~price,
                type = "box")
