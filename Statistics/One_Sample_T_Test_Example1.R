# 참고자료 :Youtube 이부일 교수님 강의
# 일표본 t검정(One sample t-test)

# 가정 : 모집단의 양적 자료가 정규분포를 따름(정규성 가정)

# 모집단의 양적자료의 평균이 기존자료보다 
# 커졌는지, 작아졌는지, 달라졌는지를
# 통계적으로 검정(분석) 하는 방법

# 예제 데이터 : women
# 변수명 : height, weight

# 귀무가설: 미국 성인 여성들의 평균 몸무게는  130파운드
# 대립가설: 미국 성인 여성들의 평균 몸무게는  130파운드 보다 크다.

# t.test(data$variable, 
#        mu = ,
#        alternative = )

# mu : 귀무가설이 참일때의 모집단의 평균 (default는 0)
# alternative : 대립가설
# 대립가설 : "greater", "less", "two-sided(default)"

t.test(women$weight, mu=130, alternative = "greater")

# p-value = 0.05731
# 유의확률이 0.057이므로 유의수준 0.05(5%)에서
# 귀무가설 기각할수 없음(귀무가설 체택)
# 미국 성인 여성들의 몸무게의 유의한 변화는 없었음







