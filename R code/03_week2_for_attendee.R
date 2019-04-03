#### .=========.####
#### | [[ Week 2 ]] ####
#### .=========.####

# 하나씩 실행시키세요.
install.packages("lubridate")
install.packages("reshape2")
install.packages("sqldf")
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")
install.packages("plotly")
install.packages("networkD3")

library("lubridate")
library("reshape2")
library("sqldf")
library("dplyr")
library("data.table")
library("ggplot2")
library("plotly")
library("networkD3")

#### 1. 1주차 복습 ####
aws = read.delim("AWS_sample.txt", sep = "#", stringsAsFactors = FALSE)
aws$TA[aws$TA >= 35]
aws[aws$TA >= 35, ]

for (num in c(1, 2, 3, 4, 10)) {
  print(paste0("num :", num^2))
}

#### 2. 업무 자동화의 첫 걸음 ####
#### __ [01] 반복문에 살붙이기 ####

#### ____ ● 진행상황을 보여주는 반복문 ####
# 기본
for (n in 1:65){
  cat(paste0("\r==== Progress : ", n, "/65 ====")) # "\r" 
  Sys.sleep(0.2)
}

# cat : 출력시 줄바꿈 안함 (print는 줄바꿈)
cat("aaa");Sys.sleep(1);cat("\rbbb");
print("aaa");print("bbb");
cat("aaa");cat("\rbbb"); # \r 덮어씀 (Carrage Return)

# 응용
for (n in 1:65){
  cat(paste0("\r==== Progress : ", n, "/65 (", round(n/65 * 100, 1), "%) ===="))
  Sys.sleep(0.2)
}

#### __ [02] 다수 파일 관리 ####
#### ____ ● 폴더 100개, 파일 300개 ####
# 폴더 + 파일 생성
source("data_generator_folders_files.R")
# source : 

file_list = list.files(path = "Item_19274_DB/",
                       patter = "Backup",  # Backup 이라는 단어 포함된 파일만 
                       recursive = TRUE, # 하위 폴더 순환 포함 
                       full.names = TRUE)
file_list[1:5] # file_list = 벡터 

class(file_list)
str(file_list)
length(file_list)

file_list = list.files(path = "Item_19274_DB/",
                       patter = "promo", 
                       recursive = TRUE,
                       full.names = TRUE)
file_list[1:5]

df = read.csv(file_list[1])
head(df)

df = data.frame();df_sub = data.frame();
for (n in 1:length(file_list)){
  df_sub = read.csv(file_list[n], stringsAsFactors = FALSE)
  df = rbind(df, df_sub)
  
  cat(paste0("\r==== Progress : ", n, "/", length(file_list), " (", round(n/length(file_list) * 100, 1), "%) ===="))
  Sys.sleep(0.2)
}

head(df)
tail(df)
nrow(df)
summary(df)

#### ____ ● Markdown ####
# 굵게: **word** 또는 __word__
# 기울임: *word* 또는 _word_

# rmd_sample.Rmd 스크립트 창의 상단 메뉴에서 
# "Knit > Knit to HTML" 메뉴로 실행 




#### 3. 실력 Jump up! ####
#### __ [01] 시간 데이터 처리 ####



#### ____ ● 시간 데이터 생성 ####
# as.POSIXct() 함수 활용
as.POSIXct("2018-10-30")
as.POSIXct("2018-10-30 13:12")
as.POSIXct("2018-10-30 13:12:45")
as.POSIXct("2018-10-30", tz = "UTC")
as.POSIXct("2018-10-30") + 1 # 1초 후 
as.POSIXct("2018-10-30") + 100 # 100초 후 

# 시스템 시간 호출
Sys.Date() # 시스템 날짜 
Sys.time() # 시스템 시간 

# seq() 함수 활용
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2018-05-12"), by = "year")
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-05-12"), by = "month")
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-03-12"), by = "day")
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-03-10 02:00:00"), by = "hour")
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-03-10 00:02:00"), by = "min")
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-03-10 00:00:02"), by = "sec")

# Q. 격일로 출력하려면?
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-03-16"), by = "2 day")
seq( from = as.POSIXct("2016-03-10"), to = as.POSIXct("2016-03-10 00:01:00"), by = 20) # 초 (seconds)

#### ____ ● 시간 데이터 추출 ####
# 내장함수 활용 
time_1 = as.POSIXct("2016-03-10 13:12:45")
months(time_1, abbreviate = TRUE) # abbreviate : 줄여쓰다 
months(time_1, abbreviate = FALSE) # abbreviate 
weekdays(time_1, abbreviate = TRUE)
weekdays(time_1, abbreviate = FALSE)
quarters(time_1, abbreviate = TRUE)
as.Date(time_1)

# strptime : Date-time Conversion Functions to and from Character 
strptime("#$#2018-_-10@@30", format = "#$#%Y-_-%m@@%d")
strptime("#$#2018-aaa-10@@30", format = "#$#%Y-aaa-%m@@%d")
strptime("#$#18-aaa-10@@30", format = "#$#%y-aaa-%m@@%d")
strptime("2018-_-10@@30", format = "%Y-_-%m@@%d")
strptime("18/10/30", format = "%y/%m/%d")

# 패키지(lubridate) 활용
# 직관적이고 처리속도가 내장함수보다 빠르다.
library("lubridate")
time_1 = as.POSIXct("2016-03-10 13:12:45")
year(time_1)
month(time_1)
day(time_1)
hour(time_1)
second(time_1)

year(time_1) = 2015 # 뽑을 수 있으면 넣을 수 있다.
time_1

#### __ [02] 속성 확인 ####
#### ____ ● 용례 ####

#### ____ ● 예제 - 원소 ####
aa = 1234
bb = "test"
cc = TRUE
dd = NA 

class(aa)
class(bb)
class(cc)
class(dd) 

is.numeric(aa)
is.character(bb)
is.logical(cc)
is.na(dd)
is.na(cc)



#### ____ ● 예제 - 객체
aaa = 1:5 
bbb = letters[1:5] 
# letters : a ~ z (소문자), LETTERS : A ~ Z (대문자)
ccc = data.frame(a = aaa, b = bbb)
ddd = list(asdf = aaa, qwer = 1:10)

class(aaa) # vector : integer 
class(bbb) # vector : character
class(ccc)
class(ddd)

is.numeric(aaa)
is.character(bbb)
is.data.frame(ccc)
is.list(ddd)

is.vector(aaa)

ddd
ddd$asdf
ddd[1]

#### __ [03] 속성 변환 ####
#### ____ ● 용례 ####

#### ____ ● 예제 - 원소 ####
aa = 1234
bb = "test"
cc = TRUE
dd = NA 

as.character(aa)
as.numeric(bb)
as.numeric("123")

as.character(cc)
as.numeric(cc) # TRUE = 1, FALSE = 0  
as.character(dd)
as.numeric(dd)

#### ____ ● 예제 - 객체 ####
aaa = 1:5 
bbb = letters[1:5] # letters : a ~ z (소문자), LETTERS : A ~ Z (대문자)
ccc = data.frame(a = aaa, b = bbb)
ddd = list(asdf = aaa, qwer = 1:10)

as.character(aaa)
as.numeric(bbb)
as.numeric(c("123", "23", "3", "9"))

as.matrix(ccc) # 동일한 속성 
as.data.frame(ddd) # 배수 관계면 자동으로 큰 배수로 처리 

#### ____ ● 예제 - table ####
df = data.frame(var_a = rep(letters[1:2], 3),
                var_b = rep(1:3, 2))
df
df = rbind(df, df[c(1, 2, 4), ]) # row index 조건 적용 
df

table(df)
as.data.frame(table(df)) # table -> data.frame 변환 

#### __ [04] Pivoting ####
#### ____ ● 준비 ####
# 데이터 & 패키지 준비 
library("reshape2")
set.seed(123)
df = data.frame(Obs = 1:4, 
                A = sample(10:99, size = 4),
                B = sample(10:99, size = 4),
                C = sample(10:99, size = 4)
)
df 

#### ____ ● melt() ####
# ggplot 등 사용 시 전처리 작업으로 많이 사용한다. 
df_melt = melt(data = df, 
               id.vars = "Obs",
               variable.name = "Group",
               value.name = "Count")
head(df_melt)
df_melt

df_melt2 = melt(data = df, 
                id.vars = "Obs")
head(df_melt2)

df_melt3 = melt(data = df, 
                id.vars = "A")
head(df_melt3)


score = read.csv("class_scores.csv", stringsAsFactors = FALSE)
head(score)

df_melt4 = melt(data = score[, c(1, 5:9)],
                id.vars = "Stu_ID",
                variable.name = "Subject",
                value.name = "Score")
head(df_melt4)
table(df_melt4$Subject)

#### ____ ● cast() ####
dcast(data = df_melt, formula = Obs ~ Group, value.var = "Count") # Obs 별도 칼럼 
acast(data = df_melt, formula = Obs ~ Group, value.var = "Count") # Obs 인덱스로 처리 

# 데이터 형태 변경 : dcast <-> melt  
dcast(data = df_melt4, formula = Stu_ID ~ Subject, value.var = "Score")


#### ____ ● 행렬관련 함수의 활용 ####
data("iris")
colnames(iris)
t(colnames(iris))
t(t(colnames(iris)))

#### __ [05] 반복문 대체 ####
#### ____ ● 개요 ####

#### ____ ● ifelse() ####
df = data.frame(aa = 1:2,
                bb = c("a", "b"))
df

df = data.frame(aa = 1:100,
                bb = rep(c("a", "b"), 50))

#### ____ ● ifelse() 예제 ####
start_time = Sys.time()
df[, "new"] = ifelse(test = df$aa != 1,
                     yes = "oh!",
                     no = "no!")
print(Sys.time() - start_time) # for ~ if 문 보다 더 빠름. 
df

start_time = Sys.time()
for (n in 1:nrow(df)) {
  if (df[n, "aa"] != 1) {
    df[n, "new2"] = "ohoh!"
  } else {
    df[n, "new2"] = "nono!"
  }
}
print(Sys.time() - start_time)
df


df = read.csv("rating_ramyun.csv", stringsAsFactors = FALSE)
head(df)

start_time = Sys.time()
df[, "kr"] = ifelse(test = df[, "Country"] == "South Korea", 
                    yes = 1, 
                    no = 0)
print(Sys.time() - start_time)
head(df) 

for(n in 1:nrow(df)){
  if (df[n, "Country"] == "South Korea") {
    df[n, "kr2"] = 1
  } else {
    df[n, "kr2"] = 0
  }
}
head(df) 

table(df$Country, df$Style)
max(table(df$Country, df$Style))

#### ____ ● apply() ####
# 데이터 준비
data("iris")
df = head(iris[, 1:4]) # 문자열 칼럼 제외 

#### ____ ● apply() ####
df = iris[, 1:4]
head(df)
df

# X : 대문자 
apply(X = df, MARGIN = 1, FUN = "sum") # row 기준 합산 
apply(df, 1, sum) # row 기준 합산 
apply(X = df, MARGIN = 2, FUN = "sum") # column 기준 합산 
apply(df, 2, sum) # column 기준 합산 

for(n in 1:nrow(df)){
  print(paste0(rownames(df)[n], " : ", sum(df[n, ])))
}

for(n in 1:ncol(df)){
  print(paste0(colnames(df)[n], " : ", sum(df[, n])))
}

#### ____ ● apply() 예제 ####
score = read.csv("class_scores.csv", stringsAsFactors = FALSE)
head(score)
score = score[,5:9] # 문자열 데이터 제외 
head(score)
apply(score, 2, sum)
apply(score, 2, mean)
apply(score, 2, max)
apply(score, 2, min)

df = data.frame(subject = colnames(score),
                mean = apply(score, 2, mean),
                max = apply(score, 2, max), 
                min = apply(score, 2, min)
)
df

#### ____ ● sapply() ####
#apply() 함수의 MARGIN 파라미터 값을 2로 한 것과 동일 (Column 기준)
sapply(score, sum)

head(score)
score[, "Total"] = apply(score, 1, sum) # 과목 합계 

head(score)

score[, "MaxScore"] = apply(score[,-c(4,6)], 1, max)
head(score)

apply(score[,c(1, 2, 3, 5)], 2, median) # 과목별 중앙값 
sapply(score[,c(1, 2, 3, 5)], median) # 과목별 중앙값 


#### __ [06] 데이터 병합 ####
#### ____ ● join ####
# left join

# inner join

#### ____ ● 데이터 준비 ####
source("data_generator_join.R", encoding = "UTF-8")
head(df_room)
head(df_list)

#### ____ ● SQL 문법 ####
library("sqldf")

# Left join
sqldf("SELECT * 
      FROM df_list LEFT JOIN df_room 
      ON df_list.member = df_room.name")

sqldf("SELECT * 
      FROM df_list LEFT OUTER JOIN df_room 
      ON df_list.member = df_room.name")

# Inner join

sqldf("SELECT * 
      FROM df_list JOIN df_room 
      ON df_list.member = df_room.name")

sqldf("SELECT * 
      FROM df_list INNER JOIN df_room 
      ON df_list.member = df_room.name")


#### ____ ● dplyr 패키지 ####
library("dplyr")

# Left join
left_join(x = df_list, y = df_room,
          by = c("member" = "name"))

# Inner join
inner_join(x = df_list, y = df_room,
           by = c("member" = "name"))


#### __ [07] 효율적인 코드 작성 ####
#### ____ ● 가독성 ####

#### ____ ● Dirty Code ####

library("ggplot2")
for(n in 1:10){
gg=ggplot()+
geom_point(aes(x = sample(1:10,size=10,replace=TRUE)
,y=sample(1:10,size=10,replace=TRUE)))
ggsave(filename = paste0("sample_ggplot_",n,".png"),plot=gg)}


#### ____ ● 다양한 Style Guide ####

# general GNU coding standard 
# https://cran.r-project.org/web/packages/rockchalk/vignettes/Rstyle.pdf

# Google's R Style Guide 
# https://google.github.io/styleguide/Rguide.xml

#### ____ ● 욱킴의 Style Guide ####
# 연산자 좌우로 띄우기
# 쉼표 다음에 띄어쓰기 또는 줄바꿈
# 코드 성격에 따른 줄간격 등 

library("ggplot2")

for(n in 1:10){
  gg = ggplot() + 
    geom_point(aes(x = sample(1:10, 
                              size = 10,
                              replace = TRUE),
                   y = sample(1:10,
                              size = 10,
                              replace = TRUE)))
  ggsave(filename = paste0("sample_ggplot_", n, ".png"),
         plot = gg)
} # end of for - ggplot 

#### ____ ● Script file 관리 ####
server = function(input, output){
  library("dplyr")
  library("kableExtra")
  library("knitr")
  output$mtcars_kable = function(){
    # req(input$mpg)
    mtcars %>% 
      mutate(car = rownames(.)) %>%
      select(car, everything()) %>%
      # filter(mpg <= input$mpg) %>%
      filter(mpg <= 15) %>%
      kable("html") %>%
      kable_styling("striped", full_width = F) %>%
      add_header_above(c(" ", "Group 1" = 5, "Group 2" = 6))
  }
}

# Run the application 

# R dplyr Chain operations (Chaining) : Operator %>% (단축키 shift+ctrl+M)
# How to use dplyr's chain operations %>%
# : dataframe %>% group_by() %>% select() %>% summarise() %>% filter()

Cars93 %>%  # dataframe name
  group_by(Origin, Type, Cylinders) %>%  # group_by()
  select(Price, MPG.highway) %>%  # select() columns
  summarise(
    Price_m = mean(Price, na.rm = TRUE),
    MPG.highway_m = mean(MPG.highway, na.rm = TRUE)  # summarise()
  ) %>%
  filter(Price_m > 10 | MPG.highway_m > 25)  # filter() condition

#### ____ ● 캡슐화 ####

#### ____ ● RStudio 기능 활용 ####

#### ____ ● 사용자 정의 함수 활용 ####
# 별도의 스크립트 파일에 저장하여 필요할 때 불러온다. -> source()

#### ____ ● Script file의 분할 ####
# 용도, 성질, 요구사항에 따른 구분 

#### ____ ● 예시 ####

#### ____ ● Project 생성 ####
# 스크립트 파일과 작업 폴더를 한번에 관리 (console 이외 정보는 보관됨)  
# 데이터 및 코드 뒤섞임 방지 
# Github 연동 가능 
# 메뉴 : File > New Project 

#### __ [08] 사용자 정의 함수 ####
#### ____ ● 사용자 정의 함수 ####
# 기본 제공 함수가 아닌 사용자가 직접 만든 함수 
# 사용자 정의 함수를 모아서 포장한 것이 패키지 
# apply() 관련 함수와 같이 사용 시 연산 소요시간 단축 가능 

#### ____ ● 예제 - 기본 ####
#### ____ ● 예제 01 ####
# 입력값을 받지 않는 함수
aaa = function() {}

aaa()

bbb = function() {
  print("Rloha")
}

bbb()

#### ____ ● 예제 02 ####
# 입력값을 그대로 출력하는 함수
ccc = function(x) {
  print(x)
}

ccc("abc")

#### ____ ● 예제 03 ####
# 입력값 단순 계산 함수
ddd = function(x) {
  x + 3 
}

ddd(x = 2)

#### ____ ● 예제 04 ####
# 기본값이 지정 되어있는 함수
eee = function(x = 4) {
  x * 5
}

eee()
eee(x = 10)

#### ____ ● 예제 05 ####
# 입력값이 두 개인 함수
fff = function(aa, bb){
  aa * bb
}
fff(aa = 1) 
fff(aa = 1, bb =2)


#### ____ ● 예제 06 ####
# print() 함수를 활용한 함수
ggg = function(aa, bb){
  print(aa)
  print(bb)
  print(aa * bb)
}

ggg(aa = 10, bb = 5)
ggg(4, 6)

#### ____ ● 활용 실습 ####
# 필요한 함수들을 다 만들어 놓을 수 있다. 
# new_fun = function(x) {
#   print(x)
# }
# 
# mysum = function(aa, bb){
#   aa + bb
# }
# 
# mymulti = function(aa, bb){
#   aa * bb 
# }
source("new_fun_src.R")
new_fun(3)
mysum(1, 5)
mymulti(4, 8)


#### ____ ● 시간 + 공간 복잡도 줄이기 ####
# ▶ 다음의 데이터에서 ‘result’ 라는 새로운 column을 생성하시오.
# ▶ apply() 함수를 활용하여 해당 column을 생성하시오.
# ▶ apply() 함수에서 연산을 담당하는 함수는 ‘cal_fun()’ 이라는 새로운 사용자정의 함수를 활용하시오.
# ▶ ‘cal_fun’ 함수는 입력된 모든 숫자를 제곱하고 그 값을 합한 이후에 지정된 자릿수에서 반올림 하도록 작성하시오.
library("data.table")
df = fread("news_ecommerce_lda_k10.csv", stringsAsFactors = FALSE,
           select = 1:10, data.table = FALSE)
head(df)
str(df)

cal_fun = function(x){
  round(sum(x^2), 4)
}

cal_fun(df[1, ])

df[, "result"] = apply(X = df, MARGIN = 1, FUN = "cal_fun")
head(df)


#### 4. R려줘! 보여줘! 데이터 시각화 ####
#### __ [01] 고급 그래프 ####
library("ggplot2")
library("plotly")

gg = ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 10)
ggplotly(gg)

#### ____ ● 반응형 3D 그래프 ####
library("reshape2")
library("plotly")

x = seq(from = -4 * pi, to = 4 * pi, length.out = 100)
df = expand.grid(x = x, y = x)
head(df)
df$r = sqrt(df$x^2 + df$y^2)
df$z = cos(df$r^2) * exp(-df$r/6)
head(df)

data_z = acast(df, x ~ y, value.var = "z")
head(data_z)
plot_ly(z = data_z, type = "surface")

#### ____ ● 반응형 네트워크 그래프 ####
library("networkD3")
# library("d3Network")

src = c(rep("A",4), rep("B", 2), rep("C", 2), "D")
target = c("B", "C", "D", "J", "E", "F", "G", "H", "I")
networkData = data.frame(src, target)

simpleNetwork(networkData)

#### ____ ● 제품 및 브랜드 평가 ####
# http://rstudio-pubs-static.s3.amazonaws.com/225516_35d03c8e153242cba01b723f1e3bcfff.html


#### ____ ● Nebraska 지역 기온 시각화  ####
# https://cran.r-project.org/web/packages/ggridges/vignettes/gallery.html


#### __ [02] 유용한 사이트 ####
# http://ggplot2.tidyverse.org/reference
# https://www.rstudio.com/resources/cheatsheets
# https://color.adobe.com
# http://www.color-hex.com/

#### __ [03] ggplot 시작하기 ####
#### ____ ● 산점도 ####
# 데이터 & 패키지 준비
data_point = data.frame(xx = 1:10,
                        yy = sample(1:10, 10))
library("ggplot2")

# 그래프
# 결과물 동일 
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_point()
ggplot(data_point, aes(xx, yy)) + geom_point()
ggplot() + geom_point(data = data_point, aes(x = xx, y = yy)) 
ggplot() + geom_point(data = data_point, aes(xx, yy)) 
ggplot() + geom_point(data_point, aes(xx, yy)) # 오류 (geom_point 파라미터는 "data = " 필요)


#### ____ ● 기초 문법 ####
# 스타일 1
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_point()
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_line()
# 스타일 2
ggplot() + geom_point(data = data_point, aes(x = xx, y = yy))
ggplot() + geom_line(data = data_point, aes(x = xx, y = yy))

#### __ [04] 기본 그래프 ####
#### ____ ● 선 그래프 ####
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_line()
ggplot() + geom_line(data = data_point, aes(x = xx, y = yy))


#### ____ ● 막대 그래프 ####
data_bar = data.frame(xx = 1:10,
                      yy = sample(1:3, 10, replace = TRUE))
data_bar

table(data_bar$yy)
ggplot(data = data_bar, aes(x = yy)) + geom_bar()

ggplot(data = data_bar, aes(x = xx, y = yy)) + geom_bar() # 오류 
ggplot(data = data_bar, aes(x = xx, y = yy)) + 
  geom_bar(stat = "identity") # bar 차트에 값 2개 표시할 경우 

data_point = data_bar

ggplot(data = data_point, aes(x = xx, y = yy)) + geom_col()
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_bar(stat = "identity")

#### ____ ● 추가 기능####
data_point

ggplot() + geom_point(data = data_point, 
                      aes(x = xx, y = yy), 
                      color = "red")

ggplot() + geom_point(data = data_point, 
                      aes(x = xx, y = yy), 
                      color = "#E86B0C",
                      size = 5,
                      alpha = 0.5) # 투명도 

#### __ [05] 다중 그래프 ####
#### ____ ● 선 그래프 ####
# 데이터 준비
line_df = data.frame(obs = 1:30,
                     var_1 = rep(c("A", "B", "C"), 10),
                     value = sample(1:100, size = 10),
                     stringsAsFactors = FALSE)

head(line_df) # melt 사용해서 이런 모양으로 데이터를 만들어야 한다.

library("ggplot2")

# 그래프 1
ggplot(data = line_df, aes(x = obs, y = value)) + geom_line()

# 그래프 2
ggplot(data = line_df, aes(x = obs, 
                           y = value, 
                           group = var_1)) + # Group 
  geom_line()

ggplot(data = line_df, aes(x = obs, 
                           y = value, 
                           group = var_1,
                           color = var_1)) + 
  geom_line()

# 그래프 3
ggplot(data = line_df, aes(x = obs, 
                           y = value, 
                           group = var_1,
                           color = var_1)) + 
  geom_line(size = 2) # 선 굵기 

ggplot(data = line_df, aes(x = obs, 
                           y = value, 
                           group = var_1,
                           color = var_1)) + 
  geom_line() + 
  geom_point() # 점 표시 

# 그래프 4
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) + 
  geom_line() +
  geom_point(data = line_df, aes(x = obs,
                                 y = value,
                                 group = var_1,
                                 color = var_1))

# 그래프 5
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) + 
  geom_line(size = 1.3) +
  geom_point(data = line_df, aes(x = obs,
                                 y = value,
                                 group = var_1,
                                 color = var_1), 
             size = 4)


# 그래프 5 - 퀴즈: 코드를 조금 더 간결하게 바꾸시오.
# style 1

# style 2


#### __ [06] 색상 설정 Ⅰ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)
bar_df 

# 그래프 1
ggplot(bar_df, aes(obs, value)) + 
  geom_bar(stat = "identity") 

ggplot(bar_df, aes(x = obs, 
                   y = value, 
                   color = var, # color : 선색, fill : 막대색 
                   fill = var)) + # var 문자열 -> 그룹 색상 구분 
  geom_bar(stat = "identity")

ggplot(bar_df, aes(x = obs, 
                   y = value, 
                   fill = value)) + # value 숫자 -> 값으로 색상 표시 
  geom_bar(stat = "identity")

# 그래프 2
ggplot(data = bar_df, aes(x = obs, 
                          y = value, 
                          color = value)) + 
  geom_bar(stat = "identity")

# 그래프 3
ggplot(data = bar_df, aes(x = obs, 
                          y = value, 
                          fill = value)) +  
  geom_bar(stat = "identity")

# 그래프 4
ggplot(bar_df, aes(x = obs, # x축 연속형 
                   y = value, 
                   fill = as.factor(value))) + # 숫자를 factor로 처리 
  geom_bar(stat = "identity")

# 그래프 5
ggplot(bar_df, aes(x = as.factor(obs), # x축 명목형 
                   y = value, 
                   fill = as.factor(value))) + # 숫자를 factor로 처리 
  geom_bar(stat = "identity")

# 그래프 5 - 퀴즈: 그래프 4와 5의 차이점은?
# x축 obs 데이터가 연속형이나 명목형이냐.. 

# 그래프 6
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "stack") # 누적막대그래프 

# 그래프 7
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "dodge")

ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "fill") # 100% 누적막댁그래프 


#### __ [07] 색상 설정 Ⅱ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var = rep(c("A", "B", "C"), length.out = 10),
                      value = sample(1:100, size = 10),
                      stringsAsFactors = FALSE)
head(color_df)

# 그래프 1
ggplot(data = color_df, aes(x = var,
                            y = value,
                            fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "stack")

# 그래프 2  
ggplot(data = color_df, aes(x = var,
                            y = value,
                            fill = "blue")) + # fill 색깔지정은 ggplot 함수에 지정시 적용되지 않음 
  geom_bar(stat = "identity", position = "stack")

# 그래프 3  
ggplot(data = color_df, aes(x = var,
                            y = value),  
         fill = "blue") + # fill 색깔지정은 ggplot 함수에 지정시 적용되지 않음 
  geom_bar(stat = "identity", position = "stack")

# 그래프 4
# fill 색깔지정은 ggplot 함수에 지정시 적용되지 않고, geom_bar 함수에 지정시 적용됨
ggplot(data = color_df, aes(x = var,
                            y = value)) +
  geom_bar(stat = "identity", position = "stack", fill = "blue")

# 그래프 5
ggplot(data = color_df, aes(x = var,
                            y = value)) +
  geom_bar(stat = "identity", 
           position = "stack", 
           fill = "blue",
           alpha = 0.3) # 투명도 

#### __ [08] 색상 설정 Ⅲ ####
#### ____ ● 선 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var = rep(c("A", "B", "C"), length.out = 10),
                      value = sample(1:100, size = 10),
                      stringsAsFactors = FALSE)
head(color_df)

# 그래프 1
ggplot(data = color_df, 
       aes(x = obs,
           y = value)) + 
  geom_line(size = 2)

# 그래프 2
ggplot(data = color_df, 
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2)

# 그래프 3
ggplot(data = color_df, 
       aes(x = obs,
           y = value,
           color = "blue")) + # 색깔 적용 안됨 
  geom_line(size = 2)

# 그래프 4
ggplot(data = color_df, 
       aes(x = obs,
           y = value),
           color = "blue") + # 색깔 적용 안됨 
  geom_line(size = 2)

# 그래프 5
ggplot(data = color_df, 
       aes(x = obs,
           y = value)) + 
  geom_line(size = 2,
            color = "blue")  # 색깔 적용됨 

# 그래프 6
ggplot(data = color_df, 
       aes(x = obs,
           y = value)) + 
  geom_line(size = 2,
            color = "blue",
            alpha = 0.3)  # 색깔 적용됨 

#### ____ ● 선 그래프 - 색상함수 활용####
# 그래프 1
ggplot(data = color_df, 
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_grey(start = 0.2,
                   end = 0.8) # 회색톤으로 색깔 표시 

# 그래프 2
ggplot(data = color_df, 
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_brewer(palette = 1) # 사전 지정된 색상조합 사용 

# 그래프 3
ggplot(data = color_df, 
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_brewer(palette = 2) # 사전 지정된 색상조합 사용

# 그래프 4
ggplot(data = color_df, 
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_brewer(palette = 3) # 사전 지정된 색상조합 사용

# 그래프 5 - 중요!
head(color_df)

ggplot(data = color_df, aes(x = obs,
                            y = value,
                            group = var,
                            colour = var)) +
  geom_line(size = 2) +
  scale_color_manual(values = c("A" = "red", "B" = "blue", "C" = "green")) # 색상 별도 지정 가능 


