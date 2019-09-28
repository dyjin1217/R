library(tidyverse)
library(plotly)

# 예제 데이터 : ggplot2::diamonds
# 질적 자료   : cut, color, clarity

# cut에 대한 빈도를 구해서 저장

# 빈도를 내림차순으로 정렬해서 cut.df로 저장하기
cut.df <- sort(table(diamonds$cut) , decreasing = TRUE)


# cut.df를 데이터 프레임으로 변경하기
cut.df
cut.df <- as.data.frame(cut.df)


cut.df
colnames(cut.df) <- c("cut", "frequency")

# cut.df의 변수명을 변경하기
# plotly 패키지를 이용한 막대그래프 작성하기
# plotly::plot_ly(data = , x = ~, y = ~, type = "bar", marker = )
plotly::plot_ly(data = cut.df,
                x    = ~cut,
                y    = ~frequency,
                type = "bar")

# 막대의 색깔을 변경하기
# plotly::plot_ly(data = , x = ~, y = ~, type = "bar", marker = )
plotly::plot_ly(data   = cut.df,
                x      = ~cut,
                y      = ~frequency,
                type   = "bar",
                marker = list(color = "purple"))
