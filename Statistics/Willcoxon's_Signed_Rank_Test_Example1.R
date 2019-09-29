# 참고자료 : Youtube 이부일 교수님 강의
# 월콕슨의 부호 순위 결정

# 일표본 검정에서 모집단의 분포가 정규성이 깨졌을때 하는 비모수적 방법

# 귀무가설: 한국 성인들의 한달 평균 용돈은 35만원
# 대립가설: 한국 성인들의 한달 평균 용돈은 35만원보다 많다.

# wilcox.test(data$variable, 
#        mu = ,
#        alternative = )

# mu : 귀무가설이 참일때의 모집단의 평균 (default는 0)
# alternative : "greater", "less", "two-sided(default)"

money <- c(25,16,44,82,36,58,18)
wilcox.test(money,
            mu=35, 
            alternative="greater")
# 결론
# 유의확률이 0.406이므로 유의수준 0.05에서 한국 성인들의 한달 용돈에 
# 유의한 변화는 없는것으로 보임
# 따라서 귀무가설을 기각하지 않음

            
            
            
            
            
            
            
