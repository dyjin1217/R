# 참고자료 : 이부일 교수님 Youtube 강의

# 예제 데이터 : sleep
# 변수명 : extra, group, ID

# 귀무가설 : A 수면제의 수면시간의 평균과 B수면제의 수면시간의 평균은 같음
# 대립가설 : B 수면제의 수면시간의 평균과 B수면제의 수면시간의 평균은 같지 않음


# 귀무가설 : 두 수면제 제품 간 수면시간에 차이가 없음
# 귀무가설 : 두 수면제 제품 간 수면시간에 차이가 있음

# 1단계 : 정규성 검정
# 귀무가설 : 정규분포를 따름
# 대립가설 : 정규분포를 따르지 않음

# 그룹별 테스트
# by(data$variable, data$variable, function.name)
# by(양적자료, 질적자료, function_name)

by(sleep$extra, sleep$group, shapiro.test)

# 정규성 검정의 결론
# 두 수면제 제품의 수면시간은 모두 정규성 가정 만족

# 2단계 : 등분산성 검정
# 귀무가설 : 등분산
# 대립가설 : 이분산

# var.test(data$variable ~ data$variable)
# var.test(양적자료 ~ 질적자료)
var.test(sleep$extra ~ sleep$group)

# 참고(표본의 분산)
by(sleep$extra, sleep$group, var)

# 결론
# 유의확률이 0.0743이므로 0.05에서 
# 등분산성 가정을 만족함
# 귀무가설을 기각하지 않음(체택)

# 3단계 : 등분산이 가정된 독립 2표본 검정(two sample t-test)
# t.test(formula ~ variable ~ variable,
#        data = ,
#        alternative = )
# t.test(formula ~ 양적자료 ~ 질적자료,
#        data = ,
#        alternative = )

t.test(formula = extra ~ group, 
       data = sleep,
       alternative = "two.sided",
       var.equal = TRUE)

# 최종결론
# 유의확률이 0.079이므로 유의수준 0.05에서
# 두 수면제 제품의 수면시간에는 통계적으로 유의한
# 차이는 없는 것으로 나타


# 3단계 : 만약에
# 2단계의 결론이 등분산성 가정이 깨지는 것으로 나타났다면
# 이분산이 가정된 2표본 t검정(two sample t-test)

# t.test(formula ~ variable ~ variable,
#        data = ,
#        alternative = )
# t.test(formula ~ 양적자료 ~ 질적자료,
#        data = ,
#        alternative = )

t.test(formula = extra ~ group, 
       data = sleep,
       alternative = "two.sided",
       var.equal = FALSE)





