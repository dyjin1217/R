# 참고자료 : 이부일 교수님 Youtube 강의
# 정규성 검정(Normality_Test)
# 귀무가설 : 정규분포를 따름
# 대립가설 : 정규분포를 따르지 않음

# Shapiro-Wilk Normality Test
# shapiro.test(data$variable)


# 예제 데이터 : attitude
# 변수 : 7개
# 양적자료

shapiro.test(attitude$rating)

# 유의확률이 0.255이므로 
# 유의수준 0.05에서 귀무가설을 기각할수 없음
# 따라서정규성 가정 만족

# 7열 한번에 테스트

methods <- c()
variables <- c()
statistics <- c()
pvalues <- c()

for(i in 1:7){
  result <- list()
  if(shapiro.test(attitude[,i])$p.value >= 0.05){
    result <- t.test(attitude[,i], mu = 50, alternative = "greater")
  }else{
    result <- wilcox.test(attitude[,i], mu = 50, alternative = "greater")
  }
  variables <- rbind(variables, colnames(attitude)[i])
  methods <- rbind(methods, result$method)
  statistics <- rbind(statistics, round(result$statistic,digits=3))
  pvalues <- rbind(pvalues, result$p.value,digits=3)
}

one_sample_test <- data.frame(variables,methods, statistics, pvalues)
one_sample_test
