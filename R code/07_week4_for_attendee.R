#### .=========.####
#### | [[ Week 4 ]] ####
#### .=========.####

# 하나씩 실행시키세요.
install.packages("car")
install.packages("pscl")
install.packages("ROCR")
install.packages("MASS")
install.packages("ggplot2")
install.packages("C50")
install.packages("htmltools")

library("car")
library("pscl")
library("ROCR")
library("MASS")
library("ggplot2")
library("C50")
library("htmltools")



#### 1. 3주차 복습 ####

#### 2. 분석 절차 및 사례 ####

#### __ [01] 온라인 의류 쇼핑몰 ####
#### ____ ● 온라인 의류 쇼핑몰 ####


#### __ [02] 주의 사항 ####
#### ____ ● 말하기 전에 생각했나요? ####

#### ____ ● 분석하기 전에 생각했나요? ####

#### __ [03] 분석 모델링 개요 ####
#### ____ ● 용어 정리 ####

#### ____ ● 데이터 종류 및 특징 ####

#### ____ ● 주요 분석 기법 ####

#### ____ ● 머신러닝 수행 절차 ####

#### __ [04] 최신 알고리즘 동향 ####
#### ____ ● State of the Art ####

#### ____ ● About Model ####
# ▶ Supervised vs. Unsupervised
# ▶ Prediction vs. Classification
# ▶ Feature Engineering & Selection


#### ____ ● Overfitting ####

#### ____ ● Feature Engineering ####

#### ____ ● Bagging(Bootstrap + aggregating) ####

#### ____ ● Bagging 상세 ####

#### ____ ● Prediction ####

#### ____ ● Classification ####

#### __ [05] 딥러닝 ####
#### ____ ● 인공신경망 ####

#### ____ ● 활용 예시 ####
# 게임

# 의학

# 자연어 처리

#### ____ ● 활용 예시(이미지 처리) ####
# 위성 사진 분석

# 의료 사진 분석

# 차량 사진 분석

# 해수 사진 분석

# 인물 사진 분석

# http://scs.ryerson.ca/~aharley/vis/conv/flat.html
# http://waifu2x.udp.jp

#### ____ ● 활용 예시(강화학습 + 자율주행) ####
# https://selfdrivingcars.mit.edu/deeptraffic/

#### ____ ● 유전 알고리즘 ####

#### ____ ● 강화 학습 ####

#### ____ ● 인공신경망 프레임워크 ####

#### ____ ● 인공신경망의 미래 ####


#### __ 3. 예측 분석 ####
#### __ [01] 선형 회귀 분석 ####
#### ____ ● 선형 회귀(Linear Regression) ####

#### ____ ● 활용 예시 ####

#### ____ ● 관련 이론 ####
# 모형 수식

# 설명력

#### ____ ● 예제 코드 ####
# bike.csv : 자전거 대여 정보 
# casual : 비정기 대여 건 
# registerd : 정기대여 건 
# count : 합계 
bike = read.csv("bike.csv", stringsAsFactors = FALSE)
head(bike)

bike = bike[, -c(1, 11, 12)] # datetime, registered, count 항목 제외 

head(bike)

train = bike[1:4000, ]
test = bike[4001:nrow(bike), ]

colnames(bike)

model = lm(casual ~ ., data = train) 
# model = lm(casual ~ season + holiday + workingday + weather + 
#                     temp + atemp + humidity + windspeed, data = train) 
# model = lm(casual ~ . -temp, data = train) # temp 항목 제외한 나머지를 독립변수로 사용 
# lm : linear model 
# casual ~ . : casual을 종속변수로 하고 나머지 항목들을 독립변수로 사용 
# 

#### ____ ● 해석 및 평가 ####
summary(model)


library("car")
vif(model) 
# 분산팽창계수(VIF, variance inflation factor) : 독립변수간 다중공선성 확인 
# 분산팽창계수는 일반적으로 10 미만 값을 허용. 
# 10 이상 시 다중공선성 문제 야기되므로 제거해야 한다. -> temp, atemp 동시 제거하면 안된다.
# 일반적으로 상관계수가 높은 원소들간의 다중공선성이 높다. 

model2 = lm(casual ~ . -temp, data = train) # temp 만 제거 (보다 논리적인 항목을 남긴다.)
vif(model2)

# 원소 제거는 모두 별표가 표시되거나, 특정 원소 제거 시 설명력이 확 떨어지는 경우까지 제거한다. 

# datetime 에서 요일, 시간 추출하여 추가 분석 
# 하다 말았음... 
bike = read.csv("bike.csv", stringsAsFactors = FALSE)
head(bike)

install.packages("lubridate")
library("lubridate")
head(hour(bike$datetime))




#### ____ ● 예측 알고리즘 예제 ####

#### __ [02] 로지스틱 회귀 분석 ####
#### ____ ● 로지스틱 회귀(Logistic Regression) ####

#### ____ ● 활용 예시 ####

#### ____ ● 관련 이론 ####
# 종속변수 관련 

# 모형 수식

# 로짓 변환 

#### ____ ● 예제 코드 ####
df = read.csv("titanic_train.csv", na.strings = "")
df = df[, c(2, 3, 5:8, 10, 12)]
df[is.na(df$Age), "Age"] = mean(df$Age, na.rm = TRUE)
df = df[!is.na(df$Embarked), ] # ! : not 연산자 
# df = df[is.na(df$Embarked) == 0, ] # 위 라인과 동일 로직 (0 : FALSE, 1 : TRUE)

rownames(data) = NULL # row name 제거 = row name 초기화 

train = df[1:800, ]
test = df[800:nrow(df), ]

# glm : Generalized Linear Model 
model = glm(Survived ~ ., 
            family = binomial(link = "logit"), 
            # family = "binomial", # 위 라인과 동일 
            data = train)

#### ____ ● 해석 및 평가 ####
summary(model)

#### ____ ● 예제 코드 + 해석 및 평가 ####
library("pscl")
pR2(model)

library("car")
vif(model)

model_pred = predict(model, 
                     newdata = test[, 2:8], 
                     type = "response")
head(model_pred)
test[, "prediction"] = model_pred
head(test)

model_pred2 = ifelse(test = model_pred > 0.5, yes = 1, no = 0)
test[, "Survived_pred"] = ifelse(test = model_pred > 0.5, yes = 1, no = 0)
head(test)

mis_class_err = round(mean(model_pred2 != test$Survived), 3)
print(paste("Accuracy", 1 - mis_class_err))

table(test$Survived, test$Survived_pred) # 데이터 기준 표시 
table(test[, c("Survived", "Survived_pred")]) # 항목명 기준 표시 

install.packages("caret") 
library("caret")
install.packages("e1071")
library("e1071")
confusionMatrix(table(test[, c("Survived", "Survived_pred")]))



library("ROCR")
pr = prediction(model_pred, test$Survived)
prf = performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

# AUC (Area Under Curve) : 최소 0, 최대 1, 1에 가까울수록 예측력이 좋음
auc = performance(pr, measure = "auc")
auc@y.values[[1]] 


# 기상 (먼지) 
earth.nullschool.net
www.r2d3.us

#### __ [03] 로버스트 회귀 분석 ####
#### ____ ● 로버스트 회귀(Robust Regression) ####

#### ____ ● 관련 이론 ####
# 후버의 M-추정 

# LTS

#### ____ ● 예제 코드 ####
set.seed(12)
x = seq(1, 10)
y = 2.5 + 0.5 * x + rnorm(10, 0, 1)

y[10] = -10 
par(mfrow = c(1, 2))
plot(y ~ x, ylim = c(-10, 10))

library("MASS")
m0 = lm(y ~ x)
m1 = rlm(y ~ x)
m2 = lqs(y ~ x)
plot(y ~ x, ylim = c(-10, 10))
abline(m0$coef)
abline(m1$coef, lty = "dotted", col = "blue")
abline(m2$coef, lty = "dotted", col = "red")


#### 4. 분류 분석 ####
#### __ [01] 개요 ####
#### ____ ● 용어 정리 ####

#### ____ ● 알고리즘별 결과 비교 ####

#### __ [02] k-평균 군집(K-means Clustering) ####
#### ____ ● 정의 ####

#### ____ ● 특징 ####

#### ____ ● k-평균 군집(k-means Clustering) 상세 ####

#### ____ ● 예제 코드(R) ####
library("ggplot2")
data("iris")
set.seed(200)
head(iris)
cluster_K = kmeans(iris[, 3:4], centers = 3, iter.max = 20) 
# iris[, 3:4] : Petal.Length, Petal.Width 
# centers = 3 : 군집수 
# iter.max = 20 : 반복횟수 

ggplot(data = iris,
       aes(x = Petal.Length,
           y = Petal.Width,
           color = iris$Species)) + 
  geom_point(alpha = 0.4, size = 3.5) + 
  geom_point(color = cluster_K$cluster + 1) + 
  scale_color_manual(values = c("red", "blue", "green")) + 
  theme(legend.position = "bottom",
        legend.title = element_blank())


#### ____ ● 결과 및 해석(R) ####
cluster_K
table(iris$Species, cluster_K$cluster)
str(cluster_K)
cluster_K$cluster

df = iris
df[, "cluster"] = cluster_K$cluster
head(df)

aggregate(data = df, Sepal.Length ~ cluster, FUN = "mean")

#### __ [03] 계층적 군집 분석 ####
#### ____ ● 계층적 군집(Hierarchical Clustering)의 정의 ####

#### ____ ● 계층적 군집(Hierarchical Clustering)의 특징 ####

#### ____ ● 관련 이론 ####
# 최단 연결법

# 최장 연결법 

# 평균 연결법

# 연결 방법별 비교

#### ____ ● 예제 코드(R) ####
clusters = hclust(dist(iris[, 3:4]))
plot(clusters)

clusterCut <- cutree(clusters, 3)
clusterCut

#### ____ ● 결과 및 해석 - R ####
iris[, "cut"] = clusterCut
iris_agg1 = aggregate(Petal.Length ~ cut, data = iris, FUN = "mean")
iris_agg2 = aggregate(Petal.Width ~ cut, data = iris, FUN = "mean")

iris_agg = cbind(iris_agg1, iris_agg2)
iris_agg = iris_agg[, -3]
iris_agg 

#### __ [04] 의사결정나무 ####
#### ____ ● 의사결정나무(Decision Tree)의 정의 ####

#### ____ ● 의사결정나무(Decision Tree)의 특징 ####

#### ____ ● 예제 코드 - R ####
set.seed(56781)
train.indeces = sample(1:nrow(iris), 100)
iris.train = iris[train.indeces, ]
iris.test = iris[-train.indeces, ]

install.packages("C50")
library("C50")
model.C50 = C5.0(Species ~ ., data = iris.train)
plot(model.C50)

# prp() 함수로 의사결정나무 차트를 예쁘게 할 수 있다. 
# https://blog.revolutionanalytics.com/2013/06/plotting-classification-and-regression-trees-with-plotrpart.html
# Plotting Classification Trees with the plot.rpart and rattle pckages
library(rpart)				        # Popular decision tree algorithm
library(rpart.plot)				# Enhanced tree plots
library(rattle)					# Fancy tree plot
#library(RColorBrewer)				# Color selection for fancy tree plot
#library(party)					# Alternative decision tree algorithm
#library(partykit)				# Convert rpart object to BinaryTree
#library(caret)					# Just a data source for this script

# Make big tree
tree.1 <- rpart(Species ~ ., 
                data = iris.train, 
                control=rpart.control(minsplit=20, cp=0))
# prp(tree.1)
# text(tree.1) # ??? 
fancyRpartPlot(tree.1)				# A fancy plot from rattle



#### ____ ● 결과 및 해석 - R ####
library("htmltools")
HTML(model.C50$output) 

#### ____ ● 의사결정나무 예제 ####


#### 5. 머신러닝 실습 ####
#### __ [01] 선형 회귀 분석 ####
df = read.csv("bike.csv", stringsAsFactors = FALSE)
head(df)
t(t(colnames(df)))

df1 = df[, -c(1, 11:12)]

model = lm(formula = casual ~ ., data = df1)
summary(model)

model = lm(formula = casual ~ .-windspeed, data = df1) # 풍속 제외 
summary(model)

library("lubridate")
df[, "hour"] = hour(df[, "datetime"])
df[, "wday"] = wday(df[, "datetime"])
head(df)

df2 = df[, -c(1, 11:12)]
head(df2)

model2 = lm(casual ~ ., data = df2)
summary(model2)

model2 = lm(casual ~ .-windspeed, data = df2)
summary(model2)



df1 = read.csv("bike_rental.csv", stringsAsFactors = FALSE)
df2 = read.csv("bike_weather.csv", stringsAsFactors = FALSE)

library("lubridate")
df1[, "hour"] = hour(df$datetime)
df1[, "date"] = as.Date(df$datetime)

sapply(df2, "class")

df_agg_hour = aggregate(casual ~ hour, 
                        data = df1, 
                        FUN = "mean")
head(df_agg_hour)

library("ggplot2")
ggplot(data = df_agg_hour,
       aes(x = hour, 
           y = casual, 
           fill = casual)) + 
  geom_hline(yintercept = c(20, 40, 60, 80, 100)) + 
  geom_col() 



# Casual 변수 
#   - 월별, 시간별, 요일별 그래프 
# Hint 
# aggregate()
# library("lubridate")
# weekdays()

df = read.csv("bike.csv", stringsAsFactors = FALSE)
df1 = df 

library("lubridate")
df1[, "month"] = month(df$datetime)
df1[, "hour"] = hour(df$datetime)
#df1[, "wday"] = wday(df$datetime)
df1[, "weekday"] = weekdays(as.Date(df$datetime), abbreviate = TRUE)

head(df1)

# Month 
df_agg_c_month = aggregate(data = df1, 
                           casual ~ month, 
                           FUN = "mean")
df_agg_c_month

library("ggplot2")
ggplot(data = df_agg_c_month, 
       aes(x = month,
           y = casual,
           fill = casual)) + 
  geom_bar(stat = "identity")

ggplot(data = df_agg_c_month,
       aes(x = month,
           y = casual,
           fill = casual)) + 
  geom_col()

# Week Day 
df_agg_c_wday = aggregate(data = df1, 
                          casual ~ wday, 
                          FUN = "mean")
df_agg_c_wday

ggplot(data = df_agg_c_wday, aes(x = wday,
                                 y = casual,
                                 fill = casual)) + 
  geom_col()


df_agg_c_weekday = aggregate(data = df1, 
                             casual ~ weekday, 
                             FUN = "mean")
df_agg_c_weekday

str(df_agg_c_weekday)

ggplot(data = df_agg_c_weekday,
       aes(x = factor(df_agg_c_weekday$weekday, 
                      c("월", "화", "수", "목",
                        "금", "토", "일")),
           y = casual,
           fill = casual)) + 
  geom_col() 

# df_agg_c_weekday$weekday 데이터가 영문인 경우 
ggplot(data = df_agg_c_weekday,
       aes(x = factor(df_agg_c_weekday$weekday, 
                      c("Mon", "Tue", "Wed", "Thu",
                        "Fri", "Sat", "Sun")),
           y = casual,
           fill = casual)) + 
  geom_col() 

# Registered 변수 
#   - 월별, 시간별, 요일별 그래프 

# Month 
df_agg_r_month = aggregate(data = df1, 
                           registered ~ month, 
                           FUN = "mean")
df_agg_r_month

ggplot(data = df_agg_r_month, aes(x = month,
                                  y = registered,
                                  fill = registered)) + 
  geom_col()


# weekday 
df_agg_r_weekday = aggregate(data = df1, 
                          registered ~ weekday, 
                          FUN = "mean")
df_agg_r_weekday

ggplot(data = df_agg_r_weekday, aes(x = weekday,
                                 y = registered,
                                 fill = registered)) + 
  geom_col()


# cycle plot : 월별 추이를 연도별 구분 차트 
# https://encaion.wordpress.com/2016/03/10/drawing-cycle-plot/

#### __ [02] 로지스틱 회귀 분석 ####


