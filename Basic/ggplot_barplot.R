# 참고자료 : 이부일 교수님 Youtube 강의

library(tidyverse)
library(RColorBrewer)

# 예제 데이터 : ggplot2::diamonds
# 질적 자료   : cut, color, clarity

# ggplot2 패키지를 이용한 막대그래프 작성하기
# ggplot2::ggplot(data = , mapping = aes(x = , y = )) +
# geom_bar()

# 기본 막대그래프
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut)) +
  geom_bar()

# 모든 막대의 색깔을 purple로 지정하기
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut)) +
  geom_bar(fill = "purple")

# RColorBrewer 패키지를 이용하여 막대의 색깔을 지정하기
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut)) +
  geom_bar(fill = RColorBrewer::brewer.pal(n = 5, name = "Blues"))

# 막대의 색깔과 범례 나타내기
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar()

# 막대그래프의 배경화면 변경하기1
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() +
  theme_bw()

# 막대그래프의 배경색 변경하기2
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() +
  theme_classic()

# 차트제목, x축제목, y축제목 넣기
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() +
  theme_classic() +
  labs(title = "Cut of Diamonds",
       x     = "Cut",
       y     = "Frequency")

# 차트제목, x축제목, y축제목의 글씨크기, 글씨색깔, 글씨폰트 변경하기
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() +
  theme_classic() +
  labs(title = "Cut of Diamonds",
       x     = "Cut",
       y     = "Frequency") +
  theme(plot.title = element_text(size = 20, color = "red", face = "bold"),
        axis.title.x = element_text(size = 15, color = "blue", face = "italic"),
        axis.title.y = element_text(size = 15, color = "purple", face = "bold.italic", angle = 270))