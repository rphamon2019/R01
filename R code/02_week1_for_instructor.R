#### .=========.####
#### | [[ Week 1 ]] ####
#### .=========.####

#### 0. 수업 개요 ####
#### __ [01] 들어가며 ####

#### __ [02] 데이터 기반의 의사결정의 필요성 ####

#### __ [03] 관련 언어 및 도구 ####

#### .==================. ####

#### 1. 분석 사례 소개 ####
#### __ [01] 일상 속 데이터 분석 ####

#### .==================. ####

#### 2. 데이터 리터러시 ####
#### __ [01] 실습 문제 ####
#### _____ ● Q1: 통계 #####
# 특정 회사의 급여 수준을 논할 때 평균 연봉을 주로 언급한다.
# 여기서 평균 연봉을 대표값으로 사용하는 것은 적절한가?


#### _____ ● Q2: 시각화 #####
# 변수가 5개인 하나의 데이터세트를 시각화 한다고 하자.
# 이 때 4개의 그래프로 그리는 것과 1개의 그래프로 그리는 것은
# 어떤 차이가 있는가?


#### _____ ● Q3: 자연어 처리 #####
# 한국어는 영어나 일본어에 비해 분석하기 까다롭다고 한다.
# 그 이유를 고민해보고 나름의 의견을 제시하라.


#### _____ ● Q4: 그래프 #####
# 아래 그래프는 몇 차원 그래프라고 할 수 있는가?


#### _____ ● Q5: 그래프 #####
# 아래 그래프로부터 얻을 수 있는 정보를 모두 기술하시오.



#### .==================. ####

#### 3. R 기초 ####
#### __ [01] 개요 ####
#### __ [02] 설치 ####
#### __ [03] 프로그램 시작하기 ####
#### ____ ● 단축키 ####
# 실행: [Ctrl] + [Enter]
# 새 파일 열기: [Ctrl] + [o]
# 스크립트 저장: [Ctrl] + [s]
# 주석 처리: [Ctrl] + [Shift] + [c]
# 스크립트창 이동: [Ctrl] + [1]
# 콘솔창 이동: [Ctrl] + [2]
# 콘솔창 클리어: [Ctrl] + [l]
# 문서 개요 확인: [Ctrl] + [Shift] + [o]

#### __ [04] 명령어의 이해 ####
#### ____ ● 명령어 입력 ####


#### ____ ● 명령어 실행 ####



#### __ [05] 연산자 ####
#### ____ ● 할당 연산자 ####

#### ____ ● 산술 연산자 ####

#### ____ ● 논리 연산자 ####


#### __ [06] 기초 산술 함수 ####
#### ____ ● 산술 함수 ####
# 프롬프트(>)는 제외하고 입력합니다!
# 삼각함수
sin(pi/3)
cos(pi/3)
tan(pi/3)

# 어림하기
abs(3)
abs(-3)

round(24.51)
round(24.49)
round(24.51, -1)
round(24.41,  1)

floor(24.51)
ceiling(24.51)

# 팩토리얼
factorial(2)
factorial(4)
factorial(6)


#### ____ ● 수열 생성 ####
# 특수기호(:)를 사용한 숫자 생성
1:5
1.5:5
1.5:6
1.5:1.5

-2:-9

# seq() 함수를 사용한 숫자 생성
seq(from = 1, to = 3)
seq(from = 1, to = 3, by = 0.5)
seq(from = 1, to = 3, by = 1.2)

seq(from = 1, to = 3, length.out = 8)
seq(from = 1, to = 3, length.out = 9)

# rep() 함수를 사용한 숫자 생성
rep(1:3, 5)
rep("안녕", 5)

rep(x = 1:3, time = 5)
rep(x = 1:3, times = 5)
rep(x = 1:3, timess = 5)
rep(x = 1:3, kkkkkk = 5)

rep(x = 1:3, each = 5)


#### __ [08] 기본 자료형 ####
#### ____ ● 원소 속성 ####
# ▶ 수치형(numeric): 숫자로 이루어져 있으며 정수(integer)와 실수(double)를 포함
# ▶ 문자형(character): 문자로 이루어져 있으며 그 길이에 관계없이 형식이 같음
# ▶ 팩터형(factor): 명목/순서형 변수
# ▶ 논리형(logical): TRUE와 FALSE. 즉 참/거짓 을 나타내는 형식

#### ____ ● 특수 유형 ####
# ▶ NA: 결측값(missing value, 값이 존재하지 않음)
# ▶ NULL: 데이터 유형과 자료의 길이도 0인 비어있는 값
# ▶ NaN: 수학적으로 정의가 불가한 수
# ▶ Inf: 무한값(infinite)

#### ____ ● 객체 구조 ####
# 벡터 - c()
c(1, 3, 4, 6)
c("a" = 3,
  "b" = 2,
  "c" = 22)

# 행렬 - matrix() 
matrix(1:6, ncol = 2)
matrix(1:6, nrow = 2)

matrix(1:6, ncol = 2, byrow = TRUE)

# 데이터 프레임 - data.frame()
data.frame(aa = 1:4,
           bb = c("a", "b", "c", "d"))


# 리스트 - list()
list(aa = 1:3,
     bb = matrix(1:6, ncol = 2),
     cc = data.frame(aa = 1:4,
                     bb = c("a", "b", "c", "d")))


#### ____ ● 자료구조 - 이미지 ####
library("imager")
img = load.image("sample_cat_image.jpg")
plot(img)

dim(img)

img[ , , , 3]

#### ____ ● 자료구조 - 웹페이지 ####
web = readLines("sample_webpage_text.txt")
head(web, 10)

web[4]

readLines("sample_webpage_text.txt", n = 3)

#### __ [08] 패키지 ####
#### ____ ● 개요

#### ____ ● 패키지 설치(인터넷 O) ####
# install.packages("beepr")

#### ____ ● 패키지 설치(인터넷 X) ####
# https://cran.r-project.org/

#### ____ ● 패키지 불러오기 ####
library("beepr")
beep(6)


#### ____ ● 유용한 패키지 ####
# ▶ 데이터 조작 및 처리: dplyr, reshape2, data.table
# ▶ 그래프 등 시각화 관련: ggplot2, ggmap, ggvis, lattice, plotly
# ▶ 데이터 분석 등 기계학습 관련: CART, e1071, C50, DMwR
# ▶ 시계열 데이터 처리: lubridate, xtm
# ▶ 텍스트 처리: splitstackshape, KoNLP


#### ____ ● 재미난 패키지 ####


#### __ [09] 데이터 입력 ####
#### ____ ● 작업폴더(working directory) ####

#### ____ ● 작업폴더 확인과 설정 ####
# 작업폴더 확인 - getwd()

# 작업폴더 설정 - setwd()

#### ____ ● 데이터 가져오기 실습 - 특정 구분자 ####
aws = read.delim("AWS_sample.txt",
                 sep = "#",
                 stringsAsFactors = FALSE)
head(aws)
tail(aws)


#### __ [10] 데이터 확인 ####
#### ____ ● 상/하단 행 확인 ####
# head()
head(aws)
head(aws, 10)

# tail()
tail(aws)
tail(aws, 10)

#### ____ ● 객체 구조 및 변수별 기술통계 확인 ####
# str()
str(aws)

# summary()
summary(aws)

# nrow()
nrow(aws)

# ncol()
ncol(aws)

# dim()
dim(aws)

# colnames()
colnames(aws)

#### __ [11] 데이터 추출 ####
#### ____ ● 행과 열 ####

#### ____ ● '$'를 사용한 데이터 추출 ####
aws$TA
aws$TA + 100

#### ____ ● 벡터연산을 사용한 데이터 추출 - 행 ####
aws[2, ]
aws[135, ]

aws[3:10, ]

aws[c(2, 135, 3:10), ]

#### ____ ● 벡터연산을 사용한 데이터 추출 - 열 ####
aws[, 3]

aws[, 3:4]

aws[, c(1, 3)]
c(1, 2, 3)
50:100

aws[, "Wind"]

aws[, c("AWS_ID", "TA")]

#### ____ ● 벡터연산을 사용한 데이터 추출 - 행열 ####
aws[1, 3]

aws[2:5, c("TA", "Wind")]

#### __ [12] 데이터 치환/삽입 ####
#### ____ ● 벡터연산을 사용한 데이터 치환 ####
# ※ 순서대로 입력하세요.
aws[1, ] = -1
head(aws)

aws["6", ] = -4
head(aws)

aws[1:2, ] = -33
head(aws)

aws[c(1:2, 6), ] = -6666
head(aws)

#### ____ ● 벡터연산을 사용한 데이터 삽입 ####
aws[, 6] = "new"
head(aws)

aws[, ncol(aws) + 1] = "new!!!"
head(aws)

aws[, "last_one"] = 12345
head(aws)

# Q. column 명을 바꿔봅시다.
colnames(aws)[6] = "asd"
colnames(aws)[6:7]
colnames(aws)[c(6, 7)] = c("a", "b")
head(aws)


#### __ [13] 데이터 병합 ####
#### ____ ● bind 함수를 사용한 데이터 병합 ####
aaa = aws[10:13, 3:4]
bbb = aws[20:23, 3:4]

# cbind()
cbind(aaa, bbb)

# rbind()
rbind(aaa, bbb)

aaa[  , -1]
aaa[  ,  2]
cbind(aaa[  , -1], bbb)
cbind(aaa[-1,   ], bbb)

rbind(aaa[  , -1], bbb)
rbind(aaa[-1,   ], bbb)

cbind(aaa, new_col = 1:4)

head(aws)
head(aws[, -(2:4)])
head(aws[, c(-2, -3, -4)])

#### __ [14] 데이터 요약 ####
#### ____ ● 개요 ####
# ▶ str(): 객체 구조 확인
# ▶ summary(): (2차원) 객체의 변수별 기술통계량 확인
# ▶ length(): 1차원 객체의 길이 계산
# ▶ unique(): 1차원 객체의 고유 원소 추출
# ▶ quantile(): 1차원 객체의 분위수 계산
# ▶ nrow(): 2차원 객체의 row 개수 계산
# ▶ ncol(): 2차원 객체의 column 개수 계산
# ▶ table(): 객체의 고유 원소 개수 계산
# ▶ aggregate(): 조건에 따른 요약 정보 계산
# ▶ apply(): (2차원) 객체의 row 또는 column 기준 일괄 계산


#### ____ ● table() 함수를 사용한 표 만들기 ####
# install.packages("ggplot2")
data("diamonds", package = "ggplot2")
table(diamonds$cut)


#### ____ ● 데이터 준비 ####
data("airquality")
df = airquality
head(df, 2)

#### ____ ● 함수의 활용 ####
# unique()
unique(df$Month)

# quantile()
quantile(df$Wind)

quantile(df$Wind, probs = 0.123)
quantile(df$Wind, probs = c(0.01, 0.99))

#### __ [15] 문자열 데이터 처리 ####
#### ____ ● 기본 처리 ####
# 데이터 준비
sample = data.frame(aa = c("abc_sdfsdf", "abc_KKdfsfsfs", "ccd"),
                    bb = 1:3,
                    stringsAsFactors = FALSE)
sample

# 문자 개수 세기
nchar(sample[1, 1])

# 특정 문자 위치 확인
which(sample[, 1] == "ccd")

# 대소문자 변환
toupper(sample[1, 1])
tolower(sample[2, 1])

#### ____ ● 응용 ####
# install.packages("splitstackshape")
library("splitstackshape")

# 문자열 분리
# cSplit <- S 대문자 입니다.
cSplit(sample, splitCols = "aa", sep = "_")

dd = strsplit(c("asd_ad_ddd", "dd_dd"), 
              split = "_")
dd[[1]][1:2]

# 문자 결합
paste0(sample[, 1], sample[, 2])
paste(sample[, 1], sample[, 2], sep = " HAHAHA ")

for(n in 1:10){
  # print(paste0("file_", n, "_type_dd.csv"))
  print(paste("file", n, "type", "dd.csv",
              sep = "_"))
}

paste("010", "9507", "4925", sep = "-")
paste("010", "9507", "4925", collapse = "-")

paste(c("010", "9507", "4925"), sep = "-")
paste(c("010", "9507", "4925"), collapse = "-")


# 특정 위치 문자 추출
substr(sample[, 1], 1, 2)

substr(sample[, 1], start = 1, stop = 2)


#### __ [16] 반복문 조건문 ####
#### ____ ● 반복문 - for() ####
# for() 함수
for(number in 1:3){
  print(number)
}

for(number in c(1, 3, 9)){
  print(number)
}

for(number in 3:6){
  print(number)
}

# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용
for(num in 1:4){
  df_1[num, "new_column"] = num * 2
}
df_1

#### ____ ● 조건문 - if() ####
# if() 함수
n = 3
if(n == 3){
  print("n은 3입니다.")
} else {
  print("n은 3이 아닙니다.")
}

n = 5
if(n == 3){
  print("n은 3입니다.")
} else {
  print("n은 3이 아닙니다.")
}

# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용
for(n in 1:4){
  if(n >= 3){
    print(df_1[n, "bb"])
  } else {
    print("응?")
  }
}
#### ____ ● 조건 연산자 ####
# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)

# 실습
df_1[df_1$bb >= 3, ]
df_1[df_1$aa == "b", ]
df_1[df_1$aa != "b", ]
df_1[(df_1$bb > 1) & (df_1$bb < 4), ]

#### __ [17] 파일 입출력 ####
#### ____ ● 파일 불러오기 ####

#### ____ ● 다양한 데이터 불러오기 ####
# life_expectancy
df = read.csv("life_expectancy.csv", stringsAsFactors = FALSE)
head(df)

# population_country
df = read.csv("population_country.csv", stringsAsFactors = FALSE)
head(df)

# rating_chocobar
df = read.csv("rating_chocobar.csv", stringsAsFactors = FALSE)
head(df)

# rating_ramyun
df = read.csv("rating_ramyun.csv", stringsAsFactors = FALSE)
head(df)

# store_apple
df = read.csv("store_apple.csv", stringsAsFactors = FALSE)
head(df)

#### ____ ● 파일 저장하기 ####
write.csv(df)

library("readr")
write_tsv(df, "write_tsv.txt")

# install.packages("xlsx")
library("xlsx")
write.xlsx(df, "write_xlsx.xlsx")

