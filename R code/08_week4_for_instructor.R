#### .=========.####
#### | [[ Week 3 ]] ####
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
bike = read.csv("bike.csv", stringsAsFactors = FALSE)
bike = bike[, -c(1, 11, 12)]

train = bike[1:4000, ]
test  = bike[4001:nrow(bike), ]

model = lm(casual ~ ., data = train)
summary(model)model

#### ____ ● 해석 및 평가 ####
library("car")
vif(model)

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
df = df[!is.na(df$Embarked), ]
rownames(data) = NULL

train = df[1:800, ]
test  = df[800:nrow(df), ]

model = glm(Survived ~ ., family = binomial(link = "logit"), data = train)
summary(model)

#### ____ ● 해석 및 평가 ####

#### ____ ● 예제 코드 + 해석 및 평가 ####
library("pscl")
pR2(model)

library("car")
vif(model)

model_pred = predict(model, newdata = test, type = "response")
model_pred_2 = ifelse(test = model_pred > 0.5, yes = 1, no = 0)

mis_class_err = round(mean(model_pred_2 != test$Survived), 3)
print(paste("Accuracy", 1 - mis_class_err))

library("ROCR")
pr = prediction(model_pred, test$Survived)
prf = performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc = performance(pr, measure = "auc")
auc@y.values

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
m0 =  lm(y ~ x)
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
cluster_K = kmeans(iris[, 3:4], centers = 3, iter.max = 20)

ggplot(data = iris,
       aes(x = Petal.Length,
           y = Petal.Width,
           color = iris$Species)) + 
  geom_point(alpha = 0.4, size = 3.5) + 
  geom_point(color = cluster_K$cluster + 1) + 
  scale_color_manual(values = c("red", "blue", "green")) + 
  theme(legend.position = "bottom",
        legend.title = element_blank())

cluster_K
table(iris$Species, cluster_K$cluster)


#### ____ ● 결과 및 해석(R) ####

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

clusterCut = cutree(clusters, 3)
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
iris.train = iris[ train.indeces, ]
iris.test  = iris[-train.indeces]

library("C50")
model.C50 = C5.0(Species ~ ., data = iris.train)
plot(model.C50)

#### ____ ● 결과 및 해석 - R ####
library("htmltools")
HTML(model.C50$output)

#### ____ ● 의사결정나무 예제 ####


#### 5. 머신러닝 실습 ####
#### __ [01] 선형 회귀 분석 ####

#### __ [02] 로지스틱 회귀 분석 ####

