# Q1. 결측값 처리
# Q1-1) orig_destination_distance 변수의 결측값을 제외한
#       평균 값을 구하시오.
dist_mean = mean(df$orig_destination_distance, na.rm = TRUE)

# Q1-2) orig_destination_distance 변수의 결측값을
#       Q1-1에서 구한 값으로 대치하여라.
df[is.na(df$orig_destination_distance), 
   "orig_destination_distance"] = dist_mean

# Q2. 날짜 계산
# Q2-1) 검색일(date_time)에서 체크인 일자(srch_ci) 까지의
#       차이를 계산하고 "date_diff" 라는 새로운 변수에
#       그 값을 대입하시오.
#       (단, 대입하는 값의 형식은 numeric으로 한정한다.)

df[, "date_diff"] = as.numeric(as.Date(df$srch_ci) - 
                                 as.Date(df$date_time))
head(df)

# Q2-2) 각 검색데이터에서(row) 숙박 일수를 계산하고
#       "nights" 라는 새로운 변수에 그 값을 대입하시오.
#       (srch_ci, srch_co 변수 활용, 4박 5일의 경우 4로 계산)
df[, "nights"] = as.numeric(as.Date(df$srch_co) - 
                              as.Date(df$srch_ci))
head(df)

# Q2-3) "date_diff" 변수를 활용하여 
#       검색일 부터 최초 숙박일 까지 남은 개월 수를 계산하고
#       "month_left" 라는 변수에 그 값을 대입하시오.
#       (단, 소수점 아래 숫자는 버린다, 30일 단위로 나눔.)
df[, "month_left"] = floor(df$date_diff / 30)
head(df)


head(df, 1)
summary(df)


# Q3. 호텔이 위치한 국가별 평균 숙박일수를 계산하고
#     가장 숙박일수가 긴 3개 국가의 번호를 
#     가장 숙박일수가 긴 순서대로 기술하시오.

df1 = df
df2 = df

# 방법 1) 결측치를 1로 대치한 후 계산하는 경우
df1[is.na(df1$nights), "nights"] = 1
df1_agg = aggregate(data = df1, nights ~ hotel_country, FUN = "mean")
df1_agg = df1_agg[order(-df1_agg$nights),]
df1_agg[1:3, "hotel_country"]

# 방법 2) 결측치를 제외하고 계산하는 경우.
# df2 = df2[is.na(df2$nights),] # 결측인 row를 뽑는 경우
# df2 = df2[!is.na(df2$nights)     , ] # 방법 2-1
df2 = df2[ is.na(df2$nights) == 0, ] # 방법 2-2
df2_agg = aggregate(data = df2, nights ~ hotel_country, FUN = "mean")
df2_agg = df2_agg[order(-df2_agg$nights), ]
df2_agg[1:3, "hotel_country"]
df2_agg

# 방법 3) 2번 보다 더 간결하게 코드를 작성하는 경우.
df3_agg = aggregate(data = df, nights ~ hotel_country, 
                    FUN = "mean")
df3_agg[order(-df3_agg$nights), ][1:3, ]


# Q4. 상관분석
# Q4-1) orig_destination_distance와 date_diff 변수간
#       상관계수를 소수 넷 째 자리에서 반올림하여
#       셋 째 자리까지 표기하시오.
df_sub = df[is.na(df$date_diff) == 0, c("orig_destination_distance",
                                        "date_diff")]

cor(df_sub$orig_destination_distance,
    df_sub$date_diff)

# Q4-2) orig_destination_distance와 date_diff 변수간
#       상관계수 검정을 실시하고 p-value를
#       소수 넷 째 자리에서 반올림하여
#       셋 째 자리까지 표기하고 귀무가설의 기각 여부를
#       YES또는 NO로 기술하시오.
cor.test(df_sub$orig_destination_distance,
         df_sub$date_diff)
# YES

# Q5. 로지스틱 회귀
# 종속변수: is_booking
# 독립변수: nights, month_left, orig_destination_distance,
#           is_mobile, srch_adults_cnt
train = df[1:900000, ]
test  = df[900001:nrow(df), ]
model = glm(is_booking ~ nights + month_left + 
              orig_destination_distance + is_mobile + 
              srch_adults_cnt,
            data = train, family = "binomial")

# 위의 조건으로 이항 로지스틱 회귀 분석을 실시할 때,
# 유의미한 변수의 개수는 몇 개인가?
summary(model)

# 생성한 모델을 사용하여 예측값을 생성하고
# test 객체에 새로운 변수 "pred"를 만들어 해당 변수에
# 예측값을 집어넣으시오.
test[, "pred"] = predict(model, newdata = test, type = "response")

# 기존 값(is_booking)과 예측값(pred)의 값을 비교했을 때
# 정확도(accuracy)는 얼마인가?
# (단, 소수 넷 째 자리에서 반올림 할 것)
# 경계값은 0.5로 처리한다.
test[, "pred"] = ifelse(test$pred > 0.5, 1, 0)
caret::confusionMatrix(table(test$is_booking, test$pred))

# 앞에서 얻은 결과를 사용하여(모델, 예측값)
# AUC값을 계산하시오.
# (단, 소수 넷 째 자리에서 반올림 할 것)
library("ROCR")
pr = prediction(test$pred, test$is_booking)
# prf = performance(pr, measure = "tpr", x.measure = "fpr")
# plot(prf)
performance(pr, measure = "auc")

dd = performance(pr, measure = "auc")
round(dd@y.values[[1]], 3)