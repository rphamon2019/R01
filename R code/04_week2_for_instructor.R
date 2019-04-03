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

#### 2. 업무 자동화의 첫 걸음 ####
#### __ [01] 반복문에 살붙이기 ####
#### ____ ● 진행상황을 보여주는 반복문 ####
# 기본
for(n in 1:65){
  cat(paste0("\r==== Progress: ", n, "/65 ===="))
  Sys.sleep(0.2)
}

# 응용
for(n in 1:65){
  cat(paste0("\r==== Progress: ", n, "/65 ",
             "(", round((n/65) * 100, 1), "%)", " ===="))
  Sys.sleep(0.2)
}

#### __ [02] 다수 파일 관리 ####
#### ____ ● 폴더 100개, 파일 300개 ####
# 폴더 + 파일 생성
source("data_generator_folders_files.R")

file_list = list.files(path = "Item_19274_DB/",
                       recursive = TRUE,
                       full.names = TRUE)
file_list[1:5]

file_list = list.files(path = "Item_19274_DB/",
                       pattern = "promo",
                       recursive = TRUE,
                       full.names = TRUE)
file_list[1:5]

df = read.csv(file_list[1])
head(df)


df = data.frame()
for(n in 1:length(file_list)){
  df_sub = read.csv(file_list[n],
                    stringsAsFactors = FALSE)
  df = rbind(df, df_sub)
}
dim(df)
head(df)

df = data.frame()
for(n in 1:length(file_list)){
  cat(paste0("\r=== ", n, "/", length(file_list), " ==="))
  df_sub = read.csv(file_list[n], stringsAsFactors = FALSE)
  df = rbind(df, df_sub)
}
dim(df)

df = data.frame()
for(n in 1:length(file_list)){
  print(nrow(df))
  df_sub = read.csv(file_list[n], stringsAsFactors = FALSE)
  df = rbind(df, df_sub)
}
dim(df)



#### ____ ● Markdown ####
# 굵게: **word** 또는 __word__
# 기울임: *word* 또는 _word_


#### 3. 실력 Jump up! ####
#### __ [01] 시간 데이터 처리 ####

#### ____ ● 시간 데이터 생성 ####
# as.POSIXct() 함수 사용
as.POSIXct("2016-03-10")
as.POSIXct("2016-03-10 13:12")
as.POSIXct("2016-03-10 13:12:45")
as.POSIXct("2016-03-10", tz="UTC")
as.POSIXct("2016-03-10") + 1
as.POSIXct("2016-03-10") + 100

# 시스템 시간 호출
Sys.Date()
Sys.time()

time = Sys.time()
1 + 1
Sys.time() - time

# seq() 함수 활용
seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "year")

seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "month")

seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "day")

seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "hour")

seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "min")

seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "sec")


# Q. 격일로 출력하려면?
seq(from = as.POSIXct("2018-03-10"), 
    to   = as.POSIXct("2018-03-20"),
    by   = "2 day")


#### ____ ● 시간 데이터 추출 ####
time_1 = as.POSIXct("2016-03-10 13:12:45")

# 내장함수 활용
months(time_1, abbreviate = TRUE) 
weekdays(time_1, abbreviate = TRUE)
quarters(time_1, abbreviate = TRUE)
as.Date(time_1)

strptime("#$#2018-_-10@@30", format = "#$#%Y-_-%m@@%d")

# 패키지(lubridate) 활용
library("lubridate")

year(time_1)
month(time_1)
day(time_1)
hour(time_1)
second(time_1)

year(time_1) = 2015
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
is.numeric(bb)
is.numeric(cc)
is.na(dd)
is.na(cc)

#### ____ ● 예제 - 객체 ####
aaa = 1:5
bbb = letters[1:5] # c("a", "b", "c", "d", "e")
ccc = data.frame(a = aaa, b = bbb)
ddd = list(asdf = aaa, qwer = 1:10)
letters
LETTERS

class(aaa)
class(bbb) 
class(ccc)
class(ddd)

is.numeric(aaa)
is.character(bbb)
is.data.frame(ccc)
is.list(ddd)

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
as.numeric(cc)
as.character(dd)
as.numeric(dd)

as.numeric("asdf")


#### ____ ● 예제 - 객체 ####
aaa = 1:5
bbb = letters[1:5]
ccc = data.frame(a = aaa, b = bbb)
ddd = list(asdf = aaa, qwer = 1:10)

as.character(aaa)
as.numeric(bbb) 
as.numeric(c("123","23","3","9"))
as.matrix(ccc)
as.data.frame(ddd)

#### ____ ● 예제 - table ####
df = data.frame(var_a = rep(letters[1:2], 3),
                var_b = rep(1:3, 2))
df = rbind(df, df[c(1, 2, 4), ])
table(df)
as.data.frame(table(df))

data(diamonds, package = "ggplot2")
tab = table(diamonds$cut, diamonds$clarity)
df_tab = as.data.frame(tab)
df_tab[df_tab$Freq >= 1000, ]
df_tab[df_tab$Freq == max(df_tab$Freq), ]
df_tab[which(df_tab$Freq == max(df_tab$Freq)), ]
df_tab[which.max(df_tab$Freq), ]

#### __ [04] Pivoting ####
#### ____ ● 준비 ####
# 데이터 & 패키지 준비
library("reshape2")

set.seed(123)
df = data.frame(Obs = 1:4,
                A = sample(10:99, size = 4),
                B = sample(10:99, size = 4),
                C = sample(10:99, size = 4))
df

#### ____ ● melt() ####
df_melt = melt(data = df, id.vars = "Obs",
               variable.name = "Group",
               value.name = "Count")
head(df_melt)

#### ____ ● cast() ####
dcast(data = df_melt, 
      formula = Obs ~ Group,
      value.var = "Count")

dcast(data = df_melt, 
      formula = Obs ~ Group,
      value.var = "Count")[, -1]


acast(data = df_melt, 
      formula = Obs ~ Group,
      value.var = "Count")

df_melt[-(3:7), ]
dcast(data = df_melt[-(3:7), ], 
      formula = Obs ~ Group,
      value.var = "Count")

dd = dcast(data = df_melt[-(3:7), ], 
           formula = Obs ~ Group,
           value.var = "Count")
melt(data = dd, id.vars = "Obs")


df = read.csv("titanic_train.csv")
colnames(df)
t(colnames(df))
t(t(colnames(df)))

dcast(data = df_melt[-(3:7), ], 
      formula = Obs ~ Group,
      value.var = "Count",
      fill = "fill it!")

dd = dcast(data = df_melt[-(3:7), ], 
           formula = Obs ~ Group,
           value.var = "Count",
           fill = "fill it!")
melt(dd, id.vars = "Obs")


dcast(data = df_melt[-(3:7), ], 
      formula = Obs ~ Group,
      fun.aggregate = length)

#### ____ ● 행렬관련 함수의 활용 ####
# t(): Matrix Transpose
head(iris)
colnames(iris)
t(colnames(iris))
t(t(colnames(iris)))

dd = cbind(iris, iris,iris,iris,iris)
t(colnames(dd))
t(t(colnames(dd)))


#### __ [05] 반복문 대체 ####
#### ____ ● 개요 ####

#### ____ ● ifelse() ####
df = data.frame(aa = 1:2,
                bb = c("a", "b"))
df

df[, "new"] = ifelse(test = df$aa != 1,
                     yes  = "oh!",
                     no   = "no!")
df


#### ____ ● ifelse() 예제 ####
df = read.csv("rating_ramyun.csv", stringsAsFactors = FALSE)
df[, "kr"] = ifelse(test = df$Country == "South Korea", 
                    yes = 1,
                    no = 0)
head(df)

#### ____ ● apply() ####
# 데이터 준비
data("iris")
df = head(iris[, 1:4])
df

#### ____ ● apply() ####
apply(X = df, MARGIN = 1, FUN = "sum")
apply(X = df, MARGIN = 2, FUN = "sum")

apply(x = df, MARGIN = 1, FUN = "mean")
apply(x = df, MARGIN = 2, FUN = "mean")


#### ____ ● apply() 예제 ####
score = read.csv("class_scores.csv", stringsAsFactors = FALSE)
df_subject = data.frame(subject = colnames(score)[5:9],
                        mean = apply(score[, 5:9], 2, "mean"),
                        max = apply(score[, 5:9], 2, "max"),
                        min = apply(score[, 5:9], 2, "min"))
df_subject

#### ____ ● sapply() ####
sapply(df, "sum")
sapply(df, "class")
apply(df, MARGIN = 2, "class")

str(df)

t(t(sapply(df, "class")))



#### __ [06] 데이터 병합 ####
#### ____ ● join ####
# left join

# inner join

#### ____ ● 데이터 준비 ####
source("data_generator_join.R", encoding = "UTF-8")
head(df_room)
head(df_list)

colnames(df_room)
colnames(df_list)


#### ____ ● SQL 문법 ####
library("sqldf")

# Left join
sqldf("SELECT *
       FROM df_list LEFT JOIN df_room 
      ON df_list.member = df_room.name")

# Inner join
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

#### ____ ● 다양한 Style Guide ####

#### ____ ● 욱킴의 Style Guide ####

#### ____ ● Script file 관리 ####

#### ____ ● 캡슐화 ####

#### ____ ● RStudio 기능 활용 ####

#### ____ ● 사용자 정의 함수 활용 ####

#### ____ ● Script file의 분할 ####

#### ____ ● 예시 ####

#### ____ ● Project 생성 ####

#### __ [08] 사용자 정의 함수 ####
#### ____ ● 사용자 정의 함수 ####

#### ____ ● 예제 - 기본 ####
aaa = function(x){}
aaa()

#### ____ ● 예제 01 ####
# 입력값을 받지 않는 함수
bbb = function(){
  print("Rloha")
}
bbb

#### ____ ● 예제 02 ####
# 입력값을 그대로 출력하는 함수
ccc = function(x){
  print(x)
}
ccc()
ccc(x = 123)

#### ____ ● 예제 03 ####
# 입력값 단순 계산 함수
ddd = function(x){
  x + 3
}
ddd(x = 2)
#### ____ ● 예제 04 ####
# 기본값이 지정 되어있는 함수
eee = function(x = 4){
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
fff(aa = 1, bb = 2)

#### ____ ● 예제 06 ####
# print() 함수를 활용한 함수
ggg = function(aa, bb){
  print(aa)
  print(bb)
  print(aa*bb)
}

ggg(aa = 10, bb = 5)

#### ____ ● 활용 실습 ####

#### ____ ● 시간 + 공간 복잡도 줄이기 ####
# ▶ 다음의 데이터에서 ‘result’ 라는 새로운 column을 생성하시오.
# ▶ apply() 함수를 활용하여 해당 column을 생성하시오.
# ▶ apply() 함수에서 연산을 담당하는 함수는 ‘cal_fun()’ 이라는 새로운 사용자정의 함수를 활용하시오.
# ▶ ‘cal_fun’ 함수는 입력된 모든 숫자를 제곱하고 그 값을 합한 이후에 지정된 자릿수에서 반올림 하도록 작성하시오.
library("data.table")
df = fread("news_ecommerce_lda_k10.csv", stringsAsFactors = FALSE,
           select = 1:10, data.table = FALSE)
head(df)

cal_fun = function(x, digit = 2){
  round(sum(x^2), 2)
}

df[, "result"] = apply(df, 1, FUN = "cal_fun")
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
df$r = sqrt(df$x^2 + df$y^2)
df$z = cos(df$r^2) * exp(-df$r/6)

data_z = acast(df, x ~ y, value.var = "z")
plot_ly(z = data_z, type = "surface")

#### ____ ● 반응형 네트워크 그래프 ####
library("networkD3")

src = c(rep("A",4), rep("B", 2), rep("C", 2), "D")
target = c("B", "C", "D", "J", "E", "F", "G", "H", "I")
networkData = data.frame(src, target)

simpleNetwork(networkData)

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
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_point()
ggplot(data = data_point, aes(xx, yy)) + geom_point()
ggplot() + geom_point(data = data_point, aes(x = xx, y = yy))
ggplot() + geom_point(data = data_point, aes(xx, yy))
ggplot() + geom_point(data_point, aes(xx, yy))
ggplot() + geom_point(aes(xx, yy), data_point)


#### ____ ● 기초 문법 ####
# 스타일 1

# 스타일 2

#### __ [04] 기본 그래프 ####
#### ____ ● 선 그래프 ####
ggplot(data = data_point, 
       aes(x = xx, y = yy)) + 
  geom_line()

#### ____ ● 막대 그래프 ####
data_bar = data.frame(xx = 1:10,
                      yy = sample(1:3, 10, replace = TRUE))
data_bar

ggplot(data = data_bar, aes(x=yy)) + geom_bar()
table(data_bar$yy)

ggplot(data = data_bar, aes(x=xx, y=yy)) + 
  geom_bar()

ggplot(data = data_bar, aes(x = yy)) + 
  geom_bar()
ggplot(data = data_bar, aes(x = yy)) + 
  geom_bar(stat = "count")

ggplot(data = data_bar, aes(x=xx, y=yy)) + 
  geom_bar(stat = "identity")
ggplot(data = data_bar, aes(x = xx, y = yy)) + 
  geom_col()

#### ____ ● 추가 기능####
ggplot(data = data_point, aes(x=xx, y=yy)) +
  geom_point(color = "#FFA500")

#### ____ ● 크기 변경####
ggplot(data = data_point, aes(x = xx, y = yy)) + 
  geom_point(size = 5)

ggplot(data = data_point, aes(x = xx, y = yy)) + 
  geom_point(color = "#FFA500",
             size = 10)

ggplot(data = data_point, aes(x = xx, y = yy)) + 
  geom_point(color = "wheat4",
             size = 10)

colors()

#### __ [05] 다중 그래프 ####
#### ____ ● 선 그래프 ####
# 데이터 준비
line_df = data.frame(obs = 1:30,
                     var_1 = rep(c("A", "B", "C"), 10),
                     value = sample(1:100, size = 10),
                     stringsAsFactors = FALSE)
head(line_df)

library("ggplot2")

# 그래프 1
ggplot(data = line_df, aes(x = obs,
                           y = value)) +
  geom_line()

# 그래프 2
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1)) +
  geom_line()

# 그래프 3
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) +
  geom_line()

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
                                 color = var_1))
# 그래프 5 - 퀴즈: 코드를 조금 더 간결하게 바꾸시오.
# style 1
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) +
  geom_line(size = 1.3) +
  geom_point(size = 4)

# style 2
ggplot() +
  geom_line(data = line_df, aes(x = obs,
                                y = value,
                                group = var_1,
                                color = var_1),
            size = 1.3) +
  geom_point(data = line_df, aes(x = obs,
                                 y = value,
                                 group = var_1,
                                 color = var_1),
             size = 4)


#### __ [06] 색상 설정 Ⅰ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value)) +
  geom_bar(stat = "identity")

# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_bar(stat = "identity")

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_bar(stat = "identity", size = 4)

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          fill = value)) +
  geom_bar(stat = "identity")

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity")

# 그래프 5
ggplot(data = bar_df, aes(x = as.factor(obs),
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity")

# 그래프 5 - 퀴즈: 그래프 4와 5의 차이점은?

# 그래프 6
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "stack")

# 그래프 7
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "dodge")

ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) +
  geom_bar(stat = "identity", position = "fill")


#### __ [07] 색상 설정 Ⅱ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var_1 = rep(c("A", "B", "C"), length.out = 10),
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
                            fill = "blue")) +
  geom_bar(stat = "identity", position = "stack")

# 그래프 3
ggplot(data = color_df, aes(x = var,
                            y = value),
       fill = "blue")
geom_bar(stat = "identity", position = "stack")

# 그래프 4
ggplot(data = color_df, aes(x = var,
                            y = value)) +
  geom_bar(stat = "identity",
           position = "stack",
           fill = "blue")

# 그래프 5
ggplot(data = color_df, aes(x = var,
                            y = value)) +
  geom_bar(stat = "identity",
           position = "stack",
           fill = "blue",
           alpha = 0.3)

#### __ [08] 색상 설정 Ⅲ ####
#### ____ ● 선 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var_1 = rep(c("A", "B", "C"), length.out = 10),
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
           color = "blue")) +
  geom_line(size = 2)

# 그래프 4
ggplot(data = color_df,
       aes(x = obs,
           y = value),
       color = "blue") +
  geom_line(size = 2)

# 그래프 5
ggplot(data = color_df,
       aes(x = obs,
           y = value)) +
  geom_line(size = 2,
            color = "blue")

# 그래프 6
ggplot(data = color_df,
       aes(x = obs,
           y = value)) +
  geom_line(size = 2,
            color = "blue",
            alpha = 0.3)

#### ____ ● 선 그래프 - 색상함수 활용####
# 그래프 1
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var_1,
           color = var_1)) +
  geom_line(size = 2) +
  scale_color_grey(start = 0.2,
                   end = 0.8)

# 그래프 2
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var_1,
           color = var_1)) +
  geom_line(size = 2) +
  scale_color_brewer(palette = 1)

# 그래프 3
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var_1,
           color = var_1)) +
  geom_line(size = 2) +
  scale_color_brewer(palette = 2)

# 그래프 4
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var_1,
           color = var_1)) +
  geom_line(size = 2) +
  scale_color_brewer(palette = 3)

# 그래프 5 - 중요!
head(color_df)
ggplot(data = color_df, aes(x = obs,
                            y = value,
                            group = var_1,
                            colour = var_1)) +
  geom_line(size = 2) +
  scale_color_manual(values = c("A" = "red", 
                                "B" = "blue",
                                "C" = "green"))

c("red", "blue", "green")
