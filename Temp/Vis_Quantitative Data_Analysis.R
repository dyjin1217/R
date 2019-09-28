# �����ڷ� : Youtube �̺��� ������ �����ڷ�

# ��Ű�� ��ġ�ϱ�� �ε��ϱ�
library(tidyverse)
library(plotly)

# Warning ����
options(warn=-1)


# ���� ������ : ggplot2::diamonds
# ���� �ڷ�   : price

# �Ϻ��� ���� �ڷ��� �м�
# 1. ǥ = ��ǥ
# (1) ������ ��
# (2) ������ �����

# i.   �ּҰ�, �ִ밪
# ii.  ���� : �ִ밪 - �ּҰ�
# iii. ������ ������ ����
# iv.  ������ �ʺ� = �� : ���� / ������ ����
# v.   ù ��° �������� �ּҰ��� ���Եǵ��� ��
# vi.  ���� ������ �������� �ִ밪�� ���Եǵ��� ��

# price : 320 ~ 19000
# 0 ~ 5000
# 5000 ~ 10000
# 10000 ~ 15000
# 15000 ~ 20000

# �ʰ� ~ ����
# �̻� ~ �̸�

# data$new.variable <- cut(data$variable,
#                          breaks = ������ ����,
#                          right  = ���Ѱ� ���� �߿��� ���� =�� ���� ���ΰ�?)
diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0, to = 20000, by = 5000),
                            right  = FALSE) # �̻� ~ �̸� ����

View(diamonds)


# (1) ������ �� ���ϱ�
table(diamonds$price.group)

levels(diamonds$price.group) <- c("5000�̸�",
                                  "5000�̻�~10000�̸�",
                                  "10000�̻�~15000�̸�",
                                  "15000�̻�")

# (2) ������ ����� ���ϱ�
prop.table(table(diamonds$price.group))*100
round(prop.table(table(diamonds$price.group))*100 , digits = 1)


# 2. �׷���
# (1) ������׷�(Histogram)
# i. hist(data$variable)��
hist(diamonds$price)
hist(diamonds$price,
     xlim   = c(0, 20000),
     main   = "Histogram of Diamond Price",
     xlab   = "Price",
     labels = TRUE,
     col    = "purple")

# ii. hist(data$variable, breaks = ����ڰ� ���ϴ� ���� ����)
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

# iii. hist(data$variable, breaks = ������ ����)
hist(diamonds$price,
     breaks = 100,
     xlim   = c(0, 20000),
     main   = "Histogram of Diamond Price",
     xlab   = "Price",
     labels = TRUE,
     col    = "purple")


# ggplot2 ��Ű���� �̿��� ������׷� �ۼ��ϱ�
# ggplot2::ggplot(data = , mapping = aes(x = )) + 
# geom_histogram(binwidth = , bins = ) +
# facet_wrap(~ variable)

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram()

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 2000) # ������ �ʺ�(��)

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 10) # ������ ����

# ���ܺ� ������׷�
ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 10) +
  facet_wrap(~cut) # cut�� : 5�� ����

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(bins = 10) +
  facet_wrap(~cut + color) # cut * color : 5 * 7 = 35�� ����


# plotly ��Ű���� �̿��Ͽ� ������׷� �ۼ��ϱ�
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



# (2) ���ڱ׸�(Boxplot)
# �̻�ġ(outlier) ������ �ľ��ϱ� �ۼ�
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

## ggplot2�� �̿��� ���ڱ׸�(Boxplot) �ۼ��ϱ� 

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

# ���ܺ��� �׸���
ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price)) +
  geom_boxplot()

ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot()

ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot()

# ��� �����ϰ� �ٲٱ�
ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot() +
  theme_classic()

# ������ġ ����
ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot() +
  theme_classic() +
  theme(legend.position = "bottom")

ggplot2::ggplot(data=diamonds, mapping = aes(x= cut, y = price,fill=cut)) +
  geom_boxplot(outlier.color = "red") +
  theme_classic() +
  theme(legend.position = "bottom")

# ���ܺ� �׸��� (�ٸ����)
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

# plotly ��Ű���� �̿��� ���ڱ׸� �ۼ��ϱ�
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

# ���ܺ� ���ڱ׸��� ����
plotly::plot_ly(data = diamonds,
                x = ~cut,
                y = ~price,
                type = "box",
                color = ~cut)

# ���ܺ� ���ڱ׸��� ����
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