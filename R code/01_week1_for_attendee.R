# 강의자료 : https://github.com/encaion/temp 
  
#### .=========.####
#### | [[ Week 1 ]] ####
#### .=========.####

# File > Reopen with Encoding > UTF-8  
# 한글 입력 안될 경우 : File > Open 에서 파일명 입력란에 한글 입력 후 닫기 

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
1 + 1


#### __ [05] 연산자 ####
#### ____ ● 할당 연산자 ####
x = 1

#### ____ ● 산술 연산자 ####
30 + 50
30 / 50
5 %/% 2 # 몫 
5 %% 2  # 나머지 
5^2 # 제곱  
5 ** 2 # 제곱  

#### ____ ● 논리 연산자 ####
"감자" == "고구마"
10 > 20

#### __ [06] 기초 산술 함수 ####
#### ____ ● 산술 함수 ####
# 프롬프트(>)는 제외하고 입력합니다!
# 삼각함수
sin(pi / 3)
cos(pi / 3)
tan(pi / 3)

# 어림하기
abs(3)
abs(-3)
round(24.51)
round(24.49)
round(24.51, -1)
round(24.51, 1)
floor(24.51)
ceiling(24.51)

# 팩토리얼
factorial(2)
factorial(4)
factorial(6)

#### ____ ● 수열 생성 ####
# 특수기호(:)를 사용한 숫자 생성
1:5
1.5:5 # step 1 생략 
1.5:6
1.5:1.5
5:1

# 모든 연산자는 함수다.
':'(1, 5) 
'+'(1, 2)
c(1, 2, 3, 4, 5)

# seq() 함수를 사용한 숫자 생성
seq(from = 1, to = 3) # by=1 생략
seq(from = 1, to = 3, by = 0.5)
seq(from = 1, to = 3, by = 1.2)
seq(from = 1, to = 3, length.out = 8)
seq(1,3)
seq(1,3, 0.5)

# rep() 함수를 사용한 숫자 생성
rep(1:3, 5)
rep("안녕", 5)
rep(1:3, time = 5)
rep(1:3, each = 5)
?rep # Replicate

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
c(1, 2, 3)
c(1, 2, "a")

# 행렬 - matrix() 
matrix(1:6, nrow = 2)
matrix(1:6, ncol = 2)
matrix(1:6, nrow = 2, byrow = TRUE) # row부터 채움

aa = matrix(1:6, nrow = 2, byrow = TRUE)
aa
aa[, 2]
aa[1,2]

sum(aa[, 2]) # 벡터 값들을 sum 

# 데이터 프레임 - data.frame()
# 원소의 갯수가 동일해야 한다.
df = data.frame(aa = 1:3,
                bb = c("a", "b", "c"))
df

# 리스트 - list()
list(aa = 1:5,
     bb = matrix(1:3))

#### ____ ● 자료구조 - 이미지 ####
install.packages("imager")
library("imager")

# setwd("~/회사업무/R교육(2018)/Hana_TI_week1")

img = load.image("sample_cat_image.jpg")
plot(img)


# hint : 구글 검색 시 "검색단어 in r" 형태로 검색 (예 : interpoloation in r)

#### ____ ● 자료구조 - 웹페이지 ####
web = readLines("sample_webpage_text.txt") # 1줄씩 읽음 
web[1:3] # 1~3 줄만 표시 
web
web = readLines("sample_webpage_text.txt", n = 4) # 4줄만 읽음 
web

#### __ [08] 패키지 ####
#### ____ ● 개요

#### ____ ● 패키지 설치(인터넷 O) ####
# install.packages("beepr")
install.packages("beepr")
library("beepr")

?library


#### ____ ● 패키지 설치(인터넷 X) ####
# https://cran.r-project.org/
# 설치 폴더 : C:\Users\juno2\Documents\R\win-library\3.5 

#### ____ ● 패키지 불러오기 ####
library("data.table")
data.table::address() # 함수명 중복 시 패키지 지정 "::" 

#### ____ ● 유용한 패키지 ####
# ▶ 데이터 조작 및 처리: dplyr, reshape2, data.table
# ▶ 그래프 등 시각화 관련: ggplot2, ggmap, ggvis, lattice, plotly
# ▶ 데이터 분석 등 기계학습 관련: CART, e1071, C50, DMwR
# ▶ 시계열 데이터 처리: lubridate, xtm
# ▶ 텍스트 처리: splitstackshape, KoNLP


#### ____ ● 재미난 패키지 ####
install.packages("beepr")
install.packages("coinmarketcapr")
install.packages("Rfacebook")



#### __ [09] 데이터 입력 ####
#### ____ ● 작업폴더(working directory) ####

#### ____ ● 작업폴더 확인과 설정 ####
# 작업폴더 확인 - getwd()
getwd()

# 작업폴더 설정 - setwd()
setwd("bank") # 현재 작업디렉토리의 하위 폴더 설정 (C:/Users/hanauser17/Documents/bank) 
setwd("..") # 상위디렉토리 C:/Users/hanauser17 

#### ____ ● 데이터 가져오기 실습 - 특정 구분자 ####
aws = read.delim("AWS_sample.txt", 
                 sep = "#", 
                 stringsAsFactors = FALSE) # 문자열을 factor로 자동 변경하는 것 중지  
head(aws)

#### __ [10] 데이터 확인 ####
#### ____ ● 상/하단 행 확인 ####
# head()
head(aws) # 6줄 
head(aws, 10)

# tail()
tail(aws) # 6줄 
tail(aws, 10)

#### ____ ● 객체 구조 및 변수별 기술통계 확인 ####
# str()
str(aws) # 객체 구조 확인 

# summary()
summary(aws) # 각 변수의 기술통계 확인 

# nrow()
nrow(aws) # 행 갯수 

# ncol() # 열 갯수 
ncol(aws)

# dim()
dim(aws) # 행/열 갯수 
?dim

# colnames()
colnames(aws) # 변수명 확인 

#### __ [11] 데이터 추출 ####
#### ____ ● 행과 열 ####

#### ____ ● '$'를 사용한 데이터 추출 ####
aws$TA
aws$TA[928]
aws$TA[928:930]
aws$TA[c(3, 5, 7)]
aws$TA + 200

#### ____ ● 벡터연산을 사용한 데이터 추출 - 행 ####
aws[2, ]
aws[135, ]
aws[3:10, ]
aws[c(2, 135, 3:10), ]
aws[c(2, 3:10, 135), ]

#### ____ ● 벡터연산을 사용한 데이터 추출 - 열 ####
aws[, 3]
aws[, 3:4]
aws[, c(1, 3)]
aws[, "Wind"]
aws[, c("AWS_ID", "TA")]
head(aws[, c("AWS_ID", "TA")])

#### ____ ● 벡터연산을 사용한 데이터 추출 - 행열 ####
aws[1, 3]
aws[2:5, c("TA", "Wind")] 
aws[2:5, c("Wind", "TA")]
aws[1:4, 1:4]
aws[1:4, -5] # 5열(X.) 제외 
aws[1:4, -3] # 3열(TA) 제외 
aws[1:4, c(1,2,4,5)]
aws[1:4, c(-2, -4)]
aws[1:4, -c(2, 4)]

# 변수명, 파일명에 한글/공백 사용 금지 


#### __ [12] 데이터 치환/삽입 ####
#### ____ ● 벡터연산을 사용한 데이터 치환 ####
# 데이터를 뽑을 수 있으면 넣을 수 있다.

# ※ 순서대로 입력하세요.
aws[1, ] = -1
head(aws)

aws[1:2, ] = -33
head(aws)

aws["6", ] = -4
head(aws)

aws[c(1:2, 6), ] = -6666
head(aws)

#### ____ ● 벡터연산을 사용한 데이터 삽입 ####

# Q. column 명을 바꿔봅시다.
aws[, 6] = "new"
head(aws)

aws[, ncol(aws) + 1] = "new!!!"
head(aws)

aws[, "last one"] = 12345 # 동일 칼럼명 존재 시 치환, 부재 시 열 추가 
head(aws)
tail(aws)

# Q1. 6번째 column name을 바꾸시오.
colnames(aws)
colnames(aws)[6] = "aaa"
head(aws)
# Q2. 6, 7번째 column name을 한 줄의 코드로 바꾸시오.
colnames(aws)[c(6, 7)] = c("bbb", "ccc")
head(aws)

# column name으로 변경 
colnames(aws)[which(colnames(aws) == "TM")] = "Time"
colnames(aws)

# column index 확인 
t(colnames(aws)) # 전치행렬 
t(t(colnames(aws))) 

str(aws) # data.frame 
aws[2] # data.frame   
str(aws[2])
aws[, 2] # chr 벡터 
str(aws[, 2])

#### __ [13] 데이터 병합 ####
#### ____ ● bind 함수를 사용한 데이터 병합 ####
aaa = aws[10:13, 3:4]
bbb = aws[20:23, 3:4]

# cbind()
cbind(aaa, bbb) # thin matrix  
cbind(aaa, bbb[-1, ]) # Error : imply differing number of rows: 4, 3

# rbind()
rbind(aaa, bbb) # tall matrix 


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
install.packages("ggplot2")
library("ggplot2")

data("diamonds", package = "ggplot2")
head(diamonds, 3)

table(diamonds$cut, diamonds$clarity)
table(diamonds$cut)
prop.table(table(diamonds$cut)) # 비율 
prop.table(table(diamonds$cut)) * 100 # 백분율
paste0(prop.table(table(diamonds$cut)) * 100, "%")
paste0(round(prop.table(table(diamonds$cut)) * 100, 2), "%")
pie(table(diamonds$cut))

# Q. table() 함수를 사용하여 cut 변수의 정보를 
#    data.frame() 함수로 정리하시오.
#    cut 변수의 고유값은 class 변수, 
#    비율 정보는 prop 변수에 저장.
prop = paste0(round(prop.table(table(diamonds$cut)) * 100, 2), "%")
df = data.frame(class = names(table(diamonds$cut)), 
                prop = prop)

df

#### ____ ● 데이터 준비 ####
data("airquality")
df = airquality
head(df, 2)

data() # 사용 가능한 dataset 표시 

#### ____ ● 함수의 활용 ####
# unique()
unique(df$Month)
unique(df$Day)

# quantile()
quantile(df$Wind) # 0%  25%  50%  75% 100%
quantile(df$Temp)
quantile(df$Wind, probs = 0.05) # 5% 값 
quantile(df$Wind, probs = 0.95) # 95% 값 
quantile(df$Wind, probs = c(0.1, 0.9, 0.012)) # 10%    90%   1.2%  


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
which(c(TRUE, FALSE, TRUE))
TRUE + TRUE # 1 + 1 
TRUE - FALSE # 1 - 0 
sum(c(TRUE, FALSE, TRUE)) # TRUE : 1, FALSE : 0 

sum(sample[, 1] == "ccd") # 1열 데이터가 ccd 와 같은 횟수 

# 대소문자 변환
toupper(sample[1, 1])
tolower(sample[2, 1])


#### ____ ● 응용 ####
install.packages("splitstackshape")
library("splitstackshape")


# 문자열 분리
# cSplit <- S 대문자 입니다.
sample
cSplit(sample, splitCols = "aa", sep = "_")
cSplit(sample, splitCols = "aa", sep = "_", drop = FALSE) ## "aa" 칼럼 유지 


sample
aa = strsplit(x = sample$aa, split = "_") # 기본 함수 -> 불편 
aa
aa[[2]][2]

# 문자 결합
sample 
paste0(sample[, 1], sample[, 2])
paste(sample[, 1], sample[, 2], sep = " HAHAHA ")

paste0(123, 123, 123)
paste0(c(123, 123, 123)) # 벡터 : 처리 안됨 
paste(123, 123, 123, sep = "-") # 전환번호 등 처리 시 사용 
paste(c(123, 123, 123), sep = "-") # 벡터 : 처리 안됨 

# 벡터 데이터 처리 (collapse)
paste0(c(123, 123, 123), collapse = "")
paste(c(123, 123, 123), collapse = "")
paste(c(123, 123, 123), collapse = "-")

# 복수 파일명 생성 필요 시 
n = "0023"
paste0("fin_id_1234_", n, ".csv")


# 특정 위치 문자 추출
sample 
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

for(num in 3:6){
  print(num * num)
}


# 데이터 준비
df_1 = data.frame(aa = c("a", "b", "c", "d"),
                  bb = 1:4)
df_1

# 응용
for(num in 1:4){
  df_1[num, "new_column"] = num * 2
  # print(df_1) # 데이터가 채워지는 과정 표시 
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
for(n in 1:nrow(df_1)){
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
df_1

# 실습
df_1[df_1$bb >= 3, ] # Row에 대한 조건 
df_1[df_1$aa == "b", ]
df_1[df_1$aa != "b", ]
df_1[(df_1$bb > 1) & (df_1$bb < 4), ]
df_1[(df_1$bb == 1) & (df_1$bb == 4), ]
df_1[(df_1$bb == 1) | (df_1$bb == 4), ]
df_1[df_1$bb %in% c(1, 4), ] # 교집합 intersection ( = 조건 | 조건 | 조건 )


#### __ [17] 파일 입출력 ####
#### ____ ● 파일 불러오기 ####
df = read.csv("bike.csv")
head(df, 2)

library("data.table")
df = fread("bike.csv")
head(df, 2)

install.packages("readxl")
library("readxl")
df = read_excel("iris_xlsx.xlsx")
head(df, 2)


#### ____ ● 다양한 데이터 불러오기 ####
# life_expectancy
df2 = read.csv("life_expectancy.csv")
head(df2)
str(df2)

# population_country
df3 = read.csv("population_country.csv")
head(df3)

# rating_chocobar
df4 = read.csv("rating_chocobar.csv")
head(df4)
summary(df4)
df4[df4$Rating >= 5, ]

# rating_ramyun
df5 = read.csv("rating_ramyun.csv")
head(df5)
str(df5)


# store_apple

#### ____ ● 파일 저장하기 ####
write.csv(df, "write_csv_basic.csv", row.names = FALSE) # row names 제외 저장, 보통 이렇게 사용한다. 
write.csv(df, "write_csv_basic2.csv", row.names = TRUE) # row names 포함 저장, 읽고 쓰기를 반복하면 row names가 데이터로 처리될 가능성이 있다.

install.packages("readr")
library("readr")
write_tsv(df, "write_tsv.txt") # tab으로 구분 

install.packages("xlsx")
library("xlsx") # Java 설치 필요 
write.xlsx(df, "write_xlsx.xlsx")


