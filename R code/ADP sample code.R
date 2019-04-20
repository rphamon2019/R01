① 벡터
x = c( 1, 10, 24, 40)
y = c("사과","바나나","오렌지")
z = c(TRUE , FALSE , TRUE )

x <- c( 1, 10, 24, 40)
y <- c("사과","바나나","오렌지")
z <- c(TRUE , FALSE , TRUE )

xy <- c( x , y)
xy
[1] "1" "10" "24" "40" "사과" "바나나" "오렌지" 


② 행렬 
mx = matrix(c(1 , 2, 3, 4 , 5, 6) , ncol=2)
mx
[,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

r1=c(10 , 10)
c1=c(20 , 20 , 20)
rbind(mx , r1) 
[,1] [,2]
1    4
2    5
3    6
r1   10   10

cbind(mx , c1) 
c1
[1,] 1 4 20
[2,] 2 5 20
[3,] 3 6 20


③ 데이터 프레임
income = c( 100 , 200 , 150 , 300 , 900)
car = c("kia","hyundai","kia","toyota","lexus" )
marriage = c( FALSE, FALSE, FALSE , TRUE , TRUE)
mydat = data.frame(income, car, marriage )
mydat 
income     car marriage
1    100     kia    FALSE
2    200 hyundai    FALSE
3    150     kia    FALSE
4    300  toyota     TRUE
5    900   lexus     TRUE


data1 <- read.table("C:\\Users\\juno2\\Documents\\회사업무\\ADP\\example.csv", header=T, sep=",") # header=T : csv파일의 첫 줄을 변수명으로 지정할
data2 <- read.csv("C:\\Users\\juno2\\Documents\\회사업무\\ADP\\example.csv", header=T) 

install.packages("RODBC") # 패키지 설치 
library(RODBC) # 패키지 열기
new <- odbcConnectExcel( "C:\\Users\\juno2\\Documents\\회사업무\\ADP\\mydata") # 엑셀파일의 경로입력, mydata.xls 확장자 생략 
yourdata <- sqlFetch(new, "Sheet1")
yourdata
번호 income     car marriage
1    1    100     kia        0
2    2    200 hyundai        0
3    3    150     kia        0
4    4    300  toyota        1
5    5    900   lexus        1
close(new)

수열 생성 
rep (1 , 3)
[1] 1 1 1
seq (1 , 3)
[1] 1 2 3
1:3
[1] 1 2 3
seq (1 , 11 , by=2)
[1]  1  3  5  7  9 11
seq (1 , 11 , length=6) # 1 ~ 11 중 6개 
[1]  1  3  5  7  9 11
seq (1 , 11, length=8) # 1 ~ 11 중 8개 
[1]  1.000000  2.428571  3.857143  5.285714  6.714286  8.142857  9.571429
[8] 11.000000

rep(2:5, 3) # 2 ~ 5 를 3번 반복 
[1] 2 3 4 5 2 3 4 5 2 3 4 5

a=1:10
a
[1]  1  2  3  4  5  6  7  8  9 10
a+a
[1]  2  4  6  8 10 12 14 16 18 20
a-a
[1] 0 0 0 0 0 0 0 0 0 0
a*a
[1]   1   4   9  16  25  36  49  64  81 100
a/a
[1] 1 1 1 1 1 1 1 1 1 1

a=c(2,7,3) # 벡터를 생성할 때는 기본적으로 열벡터가 만들어진다.
a
[1] 2 7 3
t(a) # 전치행렬 t(a) : 1 행 3 열의 행벡터 행렬을 생성 
[,1] [,2] [,3]
[1,]    2    7    3
A=a%*%t(a) # 두 행렬에 대해 서로 행렬곱을 실시해 3행 3 열의 행렬 생성 
A
[,1] [,2] [,3]
[1,]    4   14    6
[2,]   14   49   21
[3,]    6   21    9 

mx=matrix(c(23, 41 , 12 , 35 , 67 , 1, 24, 7, 53) , nrow=3 ) 
mx
[,1] [,2] [,3]
[1,]   23   35   24
[2,]   41   67    7
[3,]   12    1   53
5*mx # 단순한 스칼라 곱 
[,1] [,2] [,3]
[1,]  115  175  120
[2,]  205  335   35
[3,]   60    5  265
solve(mx) # 역행렬 (inverse matrix) 생성 
[,1]        [,2]        [,3]
[1,] -0.35743822  0.18466969  0.13746848
[2,]  0.21069087 -0.09389813 -0.08300555
[3,]  0.07695411 -0.04004034 -0.01069087

a = 1:10
a
[1]  1  2  3  4  5  6  7  8  9 10
mean(a) # 평균 
[1] 5.5
var(a) # 분산 
[1] 9.166667
sd(a) # 표준편차 
[1] 3.02765
sum(a) # 합계 
[1] 55
median(a) # 중앙값 
[1] 5.5
log(a) # 자연로그 
[1] 0.0000000 0.6931472 1.0986123 1.3862944 1.6094379 1.7917595 1.9459101
[8] 2.0794415 2.1972246 2.3025851
b = log(a) # 자연로그  
b
[1] 0.0000000 0.6931472 1.0986123 1.3862944 1.6094379 1.7917595 1.9459101
[8] 2.0794415 2.1972246 2.3025851
cov(a,b) # 공분산 
[1] 2.112062
cor(a,b) # 상관관계 
[1] 0.9516624
summary(a) # 최소값, 1사분위수, 중앙값, 평균, 3사분위수, 최대값   
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
1.00    3.25    5.50    5.50    7.75   10.00 

b = c("a","b","c","d","e")
b
[1] "a" "b" "c" "d" "e"
b[2] # b 벡터 내에서 n 번째 원소에 해당하는 값 
[1] "b"
b[-4] # n번째 원소에 해당하는 값만을 제외 
[1] "a" "b" "c" "e"
b[c(2,3)]
[1] "b" "c"

income = c( 100 , 200 , 150 , 300 , 900)
car = c("kia","hyundai","kia","toyota","lexus" )
marriage = c( FALSE, FALSE, FALSE , TRUE , TRUE)
mydat = data.frame(income, car, marriage )
mydat 
income     car marriage
1    100     kia    FALSE
2    200 hyundai    FALSE
3    150     kia    FALSE
4    300  toyota     TRUE
5    900   lexus     TRUE
mydat [3 , 2] # Data Frame의 3행 2 열의 값을 불러온다
[1] kia
Levels: hyundai kia lexus toyota
mydat [ , 2] # Data Frame의 2 열의 값을 모두 불러온다
[1] kia     hyundai kia     toyota  lexus  
Levels: hyundai kia lexus toyota
mydat [3 , 2] 
[1] kia
Levels: hyundai kia lexus toyota
mydat [4, ] # Data Frame의 4행의 값을 모두 불러온다
income    car marriage
4    300 toyota     TRUE

a = c() # 아무런 값도 포함되지 않는 a 벡터 선언
a
NULL
for (i in 1:9) {
  + a[i] = i*i
  + }
a
[1]  1  4  9 16 25 36 49 64 81

isum = 0
for (i in 1:100) {
  + isum = isum + i
  + }
isum
[1] 5050
cat("1 부터 100까지의 합=",isum,"입니다.","\n")
1 부터 100까지의 합= 5050 

x=1
while (x<5) {
  + x=x+1
  + print(x)
  + }
[1] 2
[1] 3
[1] 4
[1] 5

StatScore = c(88 , 90 , 78 , 84, 76, 68, 50 , 48, 33, 70 , 48, 66 , 88, 96, 79 , 65 , 27 , 88, 96,
              33, 64 , 48, 77 , 18, 26 , 44, 48, 68, 77 , 64, 88, 95 , 79, 88, 49, 30 , 29, 10, 49 , 88)
over70 = rep(0, 40)
over70
[1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[40] 0
for(i in 1:40) {
  + if (StatScore[i] >= 70) over70[i] = 1 
  + else over70[i] = 0 }
over70
[1] 1 1 1 1 1 0 0 0 0 1 0 0 1 1 1 0 0 1 1 0 0 0 1 0 0 0 0 0 1 0 1 1 1 1 0 0 0 0 0
[40] 1
sum(over70)
[1] 18

addto = function(a) {
  + isum=0
  + for(i in 1:a) {
    + isum=isum+i
    + }
  + print(isum)
  + }
addto(100)
[1] 5050
addto(50)
[1] 1275

number=1:10
alphabet=c("a","b","c")
paste(number, alphabet)
[1] "1 a"  "2 b"  "3 c"  "4 a"  "5 b"  "6 c"  "7 a"  "8 b"  "9 c"  "10 a"
paste(number, alphabet, sep=" to the ")
[1] "1 to the a"  "2 to the b"  "3 to the c"  "4 to the a"  "5 to the b" 
[6] "6 to the c"  "7 to the a"  "8 to the b"  "9 to the c"  "10 to the a"

substr("BigDataAnalysis", 1, 4) # 1번째 글자부터 4번째 글자까지 추출 
[1] "BigD"
substr("BigDataAnalysis", 2, 4) # 2번째 글자부터 4번째 글자까지 추출 
[1] "igD"
substr("BigDataAnalysis", 3, 7) # 3번째 글자부터 7번째 글자까지 추출 
[1] "gData"
country=c("Korea" , "Japan" , "China" , "Singapore" , "Russia")
substr(country , 1, 3)
[1] "Kor" "Jap" "Chi" "Sin" "Rus"

as.integer(3.14)
[1] 3
as.numeric("foo")
[1] NA
경고메시지(들): 
  강제형변환에 의해 생성된 NA 입니다 
as.character(101)
[1] "101"
as.numeric(FALSE)
[1] 0
as.logical(0.45)
[1] TRUE

mydat
income     car marriage
1    100     kia    FALSE
2    200 hyundai    FALSE
3    150     kia    FALSE
4    300  toyota     TRUE
5    900   lexus     TRUE
as.matrix(mydat) #as.matrix 함수를 이용해 행렬로 변환된 이후에는 income 열과 marriage 열의 데이터들도 모두 문자형 데이터로 변환되었다
income car       marriage
[1,] "100"  "kia"     "FALSE" 
[2,] "200"  "hyundai" "FALSE" 
[3,] "150"  "kia"     "FALSE" 
[4,] "300"  "toyota"  " TRUE" 
[5,] "900"  "lexus"   " TRUE" 

as.Date("2015-01-13")
[1] "2015-01-13"
as.Date("01/13/2015")
Error in charToDate(x) : 문자열이 표준서식을 따르지 않습니다
as.Date("01/13/2015",format="%m/%d/%Y")
[1] "2015-01-13"

as.Date("01/13/2015", format="%m/%d/%Y")
[1) "2015-01-13"
format(Sys.Date())
[1] "2018-05-15"
as.character(Sys.Date())
[1] "2018-05-15"
format(Sys.Date(), format="%m/%d/%Y")
[1] "05/15/2018"

format(Sys.Date(), '%a') # '%a' 는 요일을 출력한다
[1) "화"
format(Sys.Date(), '%b') # '%b' 는 월을 출력한다.
[1) "1"
format(Sys.Date(), '%m') # '%m' 은 두자리 숫자로 월을 출력한다
[1] "01"
format (Sys.Date(), '%d') # '%d' 는 두자리 숫자로 일을 출력한 다 .
[1) "13"
format (Sys.Date(), '%y') # '%y' 는 두자리 숫자로 연도를 출력한다.
[1] "15"
format (Sys.Date(), '%Y') # '%Y' 는 네자리 숫자로 연도를 출력한다 .
[1] "2015"



height = c(170 , 168 , 174, 175, 188, 165 , 165 , 190, 173 , 168, 159 , 170 , 184, 155 , 165)
weight = c(68, 65 , 74, 77 , 92 , 63 , 67 , 95 , 72 , 69 , 60 , 69 , 73 , 56, 55)
plot(height , weight) # 산점도 : x 축 height, y 축 weight 

# 'maln=' 옵션은 그래프의 최상단에 제목을 표기 
# 'pch=' 옵션은 그래프상에 찍히는 점의 모양을 변경
# 'bg=' 옵션을 이용해 iris 데이터의 Species에 따라 서로 다른 색상을 부여
pairs(iris[1:4], main = "Anderson's Iris Data -- 3 species", pch=21, bg=c("red", "green3", "blue") [unclass(iris$Species)]) # 산점도 행렬 

StatScore = c(88 , 90 , 78, 84, 76 , 68 , 50 , 48 , 33, 70 , 48 , 66 , 88 , 96 , 79 , 65 , 27 , 88 , 96 ,
                + 33, 64, 48 , 77 , 18, 26 , 44 , 48 , 68 , 77 , 64 , 88, 95 , 79 , 88, 49 , 30 , 29 , 10 , 49 , 88)
hist( StatScore , prob=T ) # 히스토그램, prob=T 옵션을 통해 상대도수를 표시 
boxplot ( StatScore ) # 상자그림 

p.325

install.packages("reshape")
library(reshape)
data(airquality)
head(airquality)
Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
5    NA      NA 14.3   56     5   5
6    28      NA 14.9   66     5   6
head(airquality,10)
Ozone Solar.R Wind Temp Month Day
1     41     190  7.4   67     5   1
2     36     118  8.0   72     5   2
3     12     149 12.6   74     5   3
4     18     313 11.5   62     5   4
5     NA      NA 14.3   56     5   5
6     28      NA 14.9   66     5   6
7     23     299  8.6   65     5   7
8     19      99 13.8   59     5   8
9      8      19 20.1   61     5   9
10    NA     194  8.6   69     5  10
names(airquality)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"   
names(airquality) = tolower(names(airquality))
names(airquality)
[1] "ozone"   "solar.r" "wind"    "temp"    "month"   "day"  

# id에 있는 변수를 기준으로 하여 나머지 각 변수를 variable이란 이름의 데이터로 만든다 원래 변수들의 값을 이 value 에 저장해 모든 데이터를 표준형식으로 변환한다. 
# 이후 연산할 것이므로 결측값(missing data)을 제거하는 옵션인 na.rm을 'TRUE'로 설정한다
aqm = melt(airquality, id=c("month","day"), na.rm=TRUE) 
head(aqm)
month day variable value
1     5   1    ozone    41
2     5   2    ozone    36
3     5   3    ozone    12
4     5   4    ozone    18
5     5   6    ozone    28
6     5   7    ozone    23

a <- cast(aqm, day ~ month ~ variable) # cast를 이용해 엑셀의 피벗팅을 하듯이 자료를 변환한다. (y축 ~ x축 ~ 변수)
a
, , variable = ozone

month
day    5  6   7   8  9
1   41 NA 135  39 96
2   36 NA  49   9 78
3   12 NA  32  16 73
4   18 NA  NA  78 91
5   NA NA  64  35 47
6   28 NA  40  66 32
7   23 29  77 122 20
8   19 NA  97  89 23
9    8 71  97 110 21
.....

# y축은 month, X축은 variable 인데 ","로 구분한 다음, mean 함수 적용 
# 월별 각 변수들의 평균값을 산출
b <- cast(aqm, month ~ variable, mean) 
b
month    ozone  solar.r      wind     temp
1     5 23.61538 181.2963 11.622581 65.54839
2     6 29.44444 190.1667 10.266667 79.10000
3     7 59.11538 216.4839  8.941935 83.90323
4     8 59.96154 171.8571  8.793548 83.96774
5     9 31.44828 167.4333 10.180000 76.90000

c <- cast(aqm, month ~ . |variable, mean) # y축은 month이지만 모든 변수에 대해 평균을 구하고 "|"를 이용해서 산출물을 분리해 표시한다
c
$`ozone`
month    (all)
1     5 23.61538
2     6 29.44444
3     7 59.11538
4     8 59.96154
5     9 31.44828
.......

d <- cast(aqm, month ~ variable, mean, margins=c("grand_row", "grand_col")) # margm 관련 옵션으로, 행과 열에 대해 소계를 산출
d
month    ozone  solar.r      wind     temp    (all)
1     5 23.61538 181.2963 11.622581 65.54839 68.70696
2     6 29.44444 190.1667 10.266667 79.10000 87.38384
3     7 59.11538 216.4839  8.941935 83.90323 93.49748
4     8 59.96154 171.8571  8.793548 83.96774 79.71207
5     9 31.44828 167.4333 10.180000 76.90000 71.82689
6 (all) 42.12931 185.9315  9.957516 77.88235 80.05722

e <- cast(aqm, day ~ month, mean, subset=variable=="ozone") # 특정 변수만 처리하고자 하는 경우 서브세트 기능을 이용 
e
day   5   6   7   8   9
1    1  41 NaN 135  39  96
2    2  36 NaN  49   9  78
3    3  12 NaN  32  16  73
4    4  18 NaN NaN  78  91
5    5 NaN NaN  64  35  47
6    6  28 NaN  40  66  32
7    7  23  29  77 122  20
8    8  19 NaN  97  89  23
9    9   8  71  97 110  21
10  10 NaN  39  85 NaN  24
11  11   7 NaN NaN NaN  44
12  12  16 NaN  10  44  21
13  13  11  23  27  28  28
14  14  14 NaN NaN  65   9
15  15  18 NaN   7 NaN  13
16  16  14  21  48  22  46
17  17  34  37  35  59  18
18  18   6  20  61  23  13
19  19  30  12  79  31  24
20  20  11  13  63  44  16
21  21   1 NaN  16  21  13
22  22  11 NaN NaN   9  23
23  23   4 NaN NaN NaN  36
24  24  32 NaN  80  45   7
25  25 NaN NaN 108 168  14
26  26 NaN NaN  20  73  30
27  27 NaN NaN  52 NaN NaN
28  28  23 NaN  82  76  14
29  29  45 NaN  50 118  18
30  30 115 NaN  64  84  20
31  31  37 NaN  59  85 NaN

f <- cast(aqm, month ~ variable, range) # mln, max를 동시에 표시해주는 range는 min은 "_X1"이라는 변수명으로， max는 "_X2"라는 suffix를 붙여준다.
f
month ozone_X1 ozone_X2 solar.r_X1 solar.r_X2 wind_X1 wind_X2 temp_X1 temp_X2
1     5        1      115          8        334     5.7    20.1      56      81
2     6       12       71         31        332     1.7    20.7      65      93
3     7        7      135          7        314     4.1    14.9      73      92
4     8        9      168         24        273     2.3    15.5      72      97
5     9        7       96         14        259     2.8    16.6      63      93

install.packages("sqldf")
library(sqldf)
필요한 패키지를 로딩중입니다: gsubfn
필요한 패키지를 로딩중입니다: proto
필요한 패키지를 로딩중입니다: RSQLite
data(iris)
sqldf("select * from iris")
Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
1            5.1         3.5          1.4         0.2     setosa
2            4.9         3.0          1.4         0.2     setosa
3            4.7         3.2          1.3         0.2     setosa
4            4.6         3.1          1.5         0.2     setosa
5            5.0         3.6          1.4         0.2     setosa
........

sqldf("select * from iris limit 10") # 특정 행 (row)수만 조회, Oracle의 numrows 
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1           5.1         3.5          1.4         0.2  setosa
2           4.9         3.0          1.4         0.2  setosa
3           4.7         3.2          1.3         0.2  setosa
4           4.6         3.1          1.5         0.2  setosa
5           5.0         3.6          1.4         0.2  setosa
6           5.4         3.9          1.7         0.4  setosa
7           4.6         3.4          1.4         0.3  setosa
8           5.0         3.4          1.5         0.2  setosa
9           4.4         2.9          1.4         0.2  setosa
10          4.9         3.1          1.5         0.1  setosa

sqldf("select count(*) from iris where Species like 'se%'")
count(*)
1       50

# set.seed함수는 난수를 생성할 때 같은 난수가 나오도록 고정시키는 역할을 한다. 
# 이 함수는 정수 인자를 하나 받는다. 어떠한 양수라도 상관은 없으나 동일한 난수를 발생시키려연 같은 숫자를 사용한다.
# set.seed(1) 
# year라는 변수에 2012부터 2014년까지의 데이터 를 각각 6 개씩 
# runif(생성할 난수의 개수， 최소값， 최대값) : 최소값, 최대값 미입력 시 0 ~ 1 사이에서 난수 생성  
# 반올림을 통해 정수화 시켜주는 round함수를 이용해 0에서 20사이 의 정수 중 9 개를 저장
set.seed(1) 
d = data.frame(year = rep(2012:2014, each=6), count = round(runif(9,0,20)))
print(d) 
year count
1  2012     1
2  2012     4
3  2012     4
4  2012    14
5  2012     8
6  2012    15
7  2013    10
8  2013    14
9  2013    20
10 2013     1
11 2013     4
12 2013     4
13 2014    14
14 2014     8
15 2014    15
16 2014    10
17 2014    14
18 2014    20

# sd와 mean 의 비율인 cv(coefficient of variation, 변동계수) 
ddply(d, "year", function(x) {
  + mean.count = mean(x$count)
  + sd.count = sd(x$count)
  + cv = sd.count/mean.count
  + data.frame(cv.count = cv)
  + })
year  cv.count
1 2012 0.7500473
2 2013 0.8176584
3 2014 0.3098741

# summanse 옵션을 이용하는 경우 count 변수에 명령된 평균이나 합 등을 계산해주고, 새로 생긴 변수만 보여 준다
ddply(d, "year", summarise, mean.count = mean(count))
year mean.count
1 2012   7.666667
2 2013   8.833333
3 2014  13.500000
# transform 옵션은 summanse 옵션과는 달리 계산에 사용된 변수(count)도 출력해 준다.
ddply(d, "year", transform, total.count = sum(count))
year count total.count
1  2012     1          46
2  2012     4          46
3  2012     4          46
4  2012    14          46
5  2012     8          46
6  2012    15          46
7  2013    10          53
8  2013    14          53
9  2013    20          53
10 2013     1          53
11 2013     4          53
12 2013     4          53
13 2014    14          81
14 2014     8          81
15 2014    15          81
16 2014    10          81
17 2014    14          81
18 2014    20          81

# rnorm(5)는 정규분포에서 5 개의 난수를 생성
DT = data.table(x=c("b","b","b","a","a"),v=rnorm(5))
DT
x          v
1: b -0.3053884
2: b  1.5117812
3: b  0.3898432
4: a -0.6212406
5: a -2.2146999

data(cars)
head(cars)
speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
# 데이터 프레임으로 된 데이터를 데이터 테이블 형식으로 불러온다 - 행변호가 콜론(:)
CARS <- data.table(cars)
head(CARS)
speed dist
1:     4    2
2:     4   10
3:     7    4
4:     7   22
5:     8   16
6:     9   10

tables()
NAME NROW NCOL MB       COLS KEY
1: CARS   50    2  0 speed,dist    
2:   DT    5    2  0        x,v    
Total: 0MB
sapply(CARS,class)
speed      dist 
"numeric" "numeric" 
DT
x          v
1: b -0.3053884
2: b  1.5117812
3: b  0.3898432
4: a -0.6212406
5: a -2.2146999
DT[2,] # 2 번째행 조회
x        v
1: b 1.511781
DT[DT$x=="b",] # x 값이 b 인 데이터 조회 
x          v
1: b -0.3053884
2: b  1.5117812
3: b  0.3898432

setkey(DT,x) # key 지정, x에 의해 ordering
DT
x          v
1: a -0.6212406
2: a -2.2146999
3: b -0.3053884
4: b  1.5117812
5: b  0.3898432
tables()
NAME NROW NCOL MB       COLS KEY
1: CARS   50    2  0 speed,dist    
2:   DT    5    2  0        x,v   x
Total: 0MB

DT["b",] # "b"가 들어간 모든 데이터를 표시, ","는 선택사항, DT["b"]와 동일  
x          v
1: b -0.3053884
2: b  1.5117812
3: b  0.3898432
DT["b",mult="first"] # "b"가 들어간 첫번째 데이터를 표시 
x          v
1: b -0.3053884
DT["b",mult="last"] # "b"가 들어간 마지막 데이터를 표시 
x         v
1: b 0.3898432

grpsize <- ceiling(1e7/26^2) # 1천만 / 676 
grpsize
[1] 14793
# LETTERS : 영문대문자 (A-Z), letters : 영문소문자 (a-z)
# runif(n) : 0 ~ 1 사이의 난수 n개 생성 
tt <- system.time(DF <- data.frame(
  + x=rep(LETTERS, each=26*grpsize),
  + y=rep(letters, each=grpsize),
  + v=runif(grpsize*26^2),  
  + stringAsFactors=FALSE)
  + )
tt # 10000068건 생성에 1.00초 소요 
사용자  시스템 elapsed 
0.95    0.05    1.00 
head(DF,3) #앞 3줄조회 
x y         v stringAsFactors
1 A a 0.8696908           FALSE
2 A a 0.3403490           FALSE
3 A a 0.4820801           FALSE
tail(DF,3) #뒤 3줄 조회 
x y         v stringAsFactors
10000066 Z z 0.8673441           FALSE
10000067 Z z 0.1660335           FALSE
10000068 Z z 0.9534948           FALSE

dim(DF) # 행/열 개수 조회 
[1] 10000068        4
10000068/1.00 # 10,000,068 rows per seconds
[1] 10000068
# x는 R. y는 h를 갖는 데이터 프레임 DF에서 자료를 찾는데 0.18초
tt <- system.time(ans1 <- DF[DF$x=="R" & DF$y=="h",])
tt
사용자  시스템 elapsed 
0.19    0.00    0.18    
head(ans1,3)
x y         v stringAsFactors
6642058 R h 0.8851283           FALSE
6642059 R h 0.8510119           FALSE
6642060 R h 0.8133172           FALSE
dim(ans1)
[1] 14793     4   

DT <- data.table(DF) # 데이터 테이블로 변환 
setkey(DT,x,y) # x, y 칼럼 key 설정 
ss <- system.time(ans2 <- DT[J("R","h")])  # index를 이용한 바이너리 검색 (binary search)
head(ans2,3)
x y         v stringAsFactors
1: R h 0.8851283           FALSE
2: R h 0.8510119           FALSE
3: R h 0.8133172           FALSE
dim(ans2)
[1] 14793     4
identical(ans1$v,ans2$v) # ans1$v와 ans2$v의 데이터 일치 여부 확인 
[1] TRUE
ss
사용자  시스템 elapsed 
0       0       0 

# 데이터 테이블을 데이터 프레임처럼 사용하면 성능은 비슷해진다.
# bad case for using data.table 
system.time(ans2 <- DF[DF$x=="R" & DF$y=="h",])
사용자  시스템 elapsed 
0.13    0.00    0.12 
mapply(identical,ans1,ans2)
x               y               v stringAsFactors 
TRUE            TRUE            TRUE            TRUE 

# 데이터 테이블에서 summary 
DT[,sum(v)]
[1] 5000553

# x를 기준으로 summary 
DT[,sum(v), by=x]
1: A 191914.7
2: B 192291.2
3: C 192435.3
.....

# 데이터 테이블에서의 by는 빠르다. 
ttt <- system.time(tt <- tapply(DT$v,DT$x,sum));ttt
user system elapsed
3.194 0.267 3.469
sss <- system.time(ss <- DT[,sum(v), by=x]);sss # 18.5x faster
user system elapsed
0.157 0.029 0. 187

head(tt)
A        B        C        D        E        F 
192275.8 192250.4 192257.1 192237.5 192103.1 192399.6 
head(ss)
x       V1
1: A 192275.8
2: B 192250.4
3: C 192257.1
4: D 192237.5
5: E 192103.1
6: F 192399.6
identical(as.vector(tt),ss$V1) # tt를 array에서 numerci vertor로 변경  
[1] TRUE



tables()
NAME       NROW NCOL  MB                  COLS KEY
1: CARS         50    2   0            speed,dist    
2:   DT 10,000,068    4 191 x,y,v,stringAsFactors x,y
Total: 191MB
DT[,sum(v)] # summary 
[1] 4999773
DT[,sum(v), by=x] # x를 기준으로 summary
x       V1
1: A 192272.8
2: B 192260.5
3: C 192293.1
4: D 191922.6
5: E 192458.7
6: F 192239.2
7: G 192409.3
8: H 191989.5
9: I 192349.3
10: J 192435.9
11: K 192249.4
12: L 192271.8
13: M 192278.6
14: N 192305.0
15: O 192497.9
16: P 192340.2
17: Q 192384.3
18: R 192320.3
19: S 192282.8
20: T 192228.3
21: U 192100.9
22: V 192604.5
23: W 192468.9
24: X 192298.3
25: Y 192262.9
26: Z 192247.8
x       V1

# 데이터 테이블에서의 0.187초는 tapply를 적용했을 때의 3.469초보다 19배나 빠르다.
# 그런데, 나는 왜 똑같이 나왔을까?? 
ttt <- system.time(tt <- tapply(DT$v,DT$x,sum));ttt
사용자  시스템 elapsed 
0.18    0.00    0.17 
sss <- system.time(ss <- DT[,sum(v),by=x]);sss
사용자  시스템 elapsed 
0.16    0.02    0.17 
head(tt)
A        B        C        D        E        F 
192272.8 192260.5 192293.1 191922.6 192458.7 192239.2 
head(ss)
x       V1
1: A 192272.8
2: B 192260.5
3: C 192293.1
4: D 191922.6
5: E 192458.7
6: F 192239.2
identical(as.vector(tt),ss$V1)
[1] TRUE

# summary 또는 grouping을 x와 y변수를 이용하고자 하는 경우 by="x.y"와 같은 표현방식으로 처리
sss <- system.time(ss <- DT[,sum(v),by="x,y"]);sss;ss
사용자  시스템 elapsed 
0.29    0.00    0.29 
x y       V1
1: A a 7394.340
2: A b 7363.532
3: A c 7431.009
4: A d 7418.329
5: A e 7408.723
---             
  672: Z v 7349.167
673: Z w 7438.825
674: Z x 7376.569
675: Z y 7397.925
676: Z z 7426.085
sss
사용자  시스템 elapsed 
0.29    0.00    0.29 
ss
x y       V1
1: A a 7394.340
2: A b 7363.532
3: A c 7431.009
4: A d 7418.329
5: A e 7408.723
---             
  672: Z v 7349.167
673: Z w 7438.825
674: Z x 7376.569
675: Z y 7397.925
676: Z z 7426.085


제3절 결측값 처리와 이상값 검색

data("iris")
head(iris) # 앞 6줄 표시 
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
head(iris,10) # 숫자만큼 표시 
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1           5.1         3.5          1.4         0.2  setosa
2           4.9         3.0          1.4         0.2  setosa
3           4.7         3.2          1.3         0.2  setosa
4           4.6         3.1          1.5         0.2  setosa
5           5.0         3.6          1.4         0.2  setosa
6           5.4         3.9          1.7         0.4  setosa
7           4.6         3.4          1.4         0.3  setosa
8           5.0         3.4          1.5         0.2  setosa
9           4.4         2.9          1.4         0.2  setosa
10          4.9         3.1          1.5         0.1  setosa

str(iris) # 데이터의 구조 
'data.frame': 150 obs. of 5 variables:
  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
$ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
$ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
$ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
$ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

summary(iris) #데이터의 기초통계량 
Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500 

# summary 함수
# 연속형 변수 : 4분위수， 최소값， 최대값， 중앙값， 명균 등을 출력
# 범주형 변수 : 각 범주에 대한 빈도수를 출력
# 연속형 변수의 경우 cov와 cor함수를 통해 공분산행렬과 상관계수행렬을 출력 하여 변수 간의 선형 상관관계의 강도를 확인

cov(iris[,1:4]) # 공분산 
Sepal.Length Sepal.Width Petal.Length Petal.Width
Sepal.Length    0.6856935  -0.0424340    1.2743154   0.5162707
Sepal.Width    -0.0424340   0.1899794   -0.3296564  -0.1216394
Petal.Length    1.2743154  -0.3296564    3.1162779   1.2956094
Petal.Width     0.5162707  -0.1216394    1.2956094   0.5810063
cor(iris[,1:4]) # 상관계수 
Sepal.Length Sepal.Width Petal.Length Petal.Width
Sepal.Length    1.0000000  -0.1175698    0.8717538   0.8179411
Sepal.Width    -0.1175698   1.0000000   -0.4284401  -0.3661259
Petal.Length    0.8717538  -0.4284401    1.0000000   0.9628654
Petal.Width     0.8179411  -0.3661259    0.9628654   1.0000000

y <- c(1,2,3,NA)
is.na(y)
[1] FALSE FALSE FALSE  TRUE
# '99'를 결측값으로 처리하려면 해당 값이 있는 위치에 NA를 입력 
mydata[mydata$v1==99,"v1"] <- NA
x <- c(1,2,NA,3)
mean(x)
[1] NA
mean(x,na.rm = T)
# 결측값이 포함된 관측치 를 complete.cases() 함수를 이용해 삭제 
mydata[!complete.cases(mydata),]

install.packages("Amelia")
Installing package into ‘C:/Users/juno2/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/Amelia_1.7.5.zip'
Content type 'application/zip' length 1830052 bytes (1.7 MB)
downloaded 1.7 MB

package ‘Amelia’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\juno2\AppData\Local\Temp\RtmpoxgTyz\downloaded_packages
library(Amelia)
data(freetrade)
head(freetrade)
year  country tariff polity      pop   gdp.pc intresmi signed fiveop     usheg
1 1981 SriLanka     NA      6 14988000 461.0236 1.937347      0   12.4 0.2593112
2 1982 SriLanka     NA      5 15189000 473.7634 1.964430      0   12.5 0.2558008
3 1983 SriLanka   41.3      5 15417000 489.2266 1.663936      1   12.3 0.2655022
4 1984 SriLanka     NA      5 15599000 508.1739 2.797462      0   12.3 0.2988009
5 1985 SriLanka   31.0      5 15837000 525.5609 2.259116      0   12.3 0.2952431
6 1986 SriLanka     NA      5 16117000 538.9237 1.832549      0   12.5 0.2886563
str(freetrade)
'data.frame':	171 obs. of  10 variables:
  $ year    : int  1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 ...
$ country : chr  "SriLanka" "SriLanka" "SriLanka" "SriLanka" ...
$ tariff  : num  NA NA 41.3 NA 31 ...
$ polity  : int  6 5 5 5 5 5 5 5 5 5 ...
$ pop     : num  14988000 15189000 15417000 15599000 15837000 ...
$ gdp.pc  : num  461 474 489 508 526 ...
$ intresmi: num  1.94 1.96 1.66 2.8 2.26 ...
$ signed  : int  0 0 1 0 0 0 0 1 0 0 ...
$ fiveop  : num  12.4 12.5 12.3 12.3 12.3 ...
$ usheg   : num  0.259 0.256 0.266 0.299 0.295 ...
help(amelia)
# 일반적인 결측값 처리 방식은 해당 레코드를 모두 삭제하는 것이다. 
# 결측값이 많은 레코드에 걸쳐 분포하면, 너무 많은 자료가 삭제돼 정보를 획득하기 어려워 질 수 있다. 
# 결측값을 해당 변수의 대표값으로 대체히는 경우가 있는데 이 방식 또한 많은 문제점이 있다. 
# 그 대신 변수들간의 관계를 이용해 imputation을 하는 효율적인 방법이 있다. 
# m : 몇 개의 imputation 데이터세트를 만들지를 결정
# ts : 시계열에 대한 정보, cs : cross-sectional 분석에 포함될 정보
# 따라서 아래 모델에서는 연도와 국가를 고려해 모든 freetrade 정보를 활용한 결측값에 대한 imputation이 이뤄진다.
# a.out은 결측값들이 lmputation 방법에 의해 대체된 5 개의 데이터셋을 포함
a.out <- amelia(freetrade, m = 5, ts = "year", cs = "country")
-- Imputation 1 --
  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18
-- Imputation 2 --
  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
-- Imputation 3 --
  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16
-- Imputation 4 --
  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
-- Imputation 5 --
  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21

hist(a.out$imputations[[3]]$tariff, col="grey", border = "white") # 3번째 imputation 데이터셋의 tariff의 히스토그램  
save(a.out, file = "imputations.Rdata") # imputations.Rdata 파일로 저장 
write.amelia(obj=a.out, file.stem = "outdata") # 
missmap(a.out) # Amelia 패키지에 포함된 결측값 차트, 결측율 5%  
head(a.out)
freetrade$tariff <- a.out$imputations[[5]]$tariff # 5번째 imputation 데이터셋의 tariff 데이터를 대입   
missmap(freetrade) # 결측율 2%로 감소 

x=rnorm (100) #표준정규분포를 따르는 난수 100개 생성
boxplot(x) #여기에서는 이상값이 없음을 알 수 있다.
x=c(x, 19 , 28 , 30) # 19, 28, 30은 이상값 고의 입력
outwith=boxplot (x) #여기에서는 이상값이 있음을 알 수 있다.
outwith$out # 이상값을 프린트 
[1] 19 28 30

install.packages("outliers")
library(outliers}
set.seed(1234)
y=rnorm (100) #표준정규분포를 따르는 난수 100개 생성
str(y) 
num [1:100] -1.207 0.277 1.084 -2.346 0.429 ...
class(y) # y는 numeric vector 
[1] "numeric" 
dim(y) # 행/열 없음 
NULL
summary(y)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-2.3457 -0.8953 -0.3846 -0.1568  0.4712  2.5490 
outlier(y) # 평균과 가장 차이가 많이 나는 값 출력
[1] 2.548991
outlier(y, opposite=TRUE) # 반대 방향으로 가장 차이가 많이 나는 값 출력
[1] -2.345698
dim (y) = c(20 , 5) # numeric vector를 행 20 열 5의 행렬로 변경 
str(y)
num [1:20, 1:5] -1.207 0.277 1.084 -2.346 0.429 ...
summary(y)
V1                V2                V3                V4                  V5         
Min.   :-2.3457   Min.   :-2.1800   Min.   :-1.8060   Min.   :-1.390701   Min.   :-1.3723  
1st Qu.:-0.8504   1st Qu.:-1.0596   1st Qu.:-1.0783   1st Qu.:-0.388760   1st Qu.:-0.2444  
Median :-0.5288   Median :-0.4960   Median :-0.8144   Median :-0.000356   Median : 0.1010  
Mean   :-0.2507   Mean   :-0.5771   Mean   :-0.4443   Mean   : 0.287145   Mean   : 0.2011  
3rd Qu.: 0.3154   3rd Qu.:-0.2245   3rd Qu.:-0.2510   3rd Qu.: 0.824832   3rd Qu.: 0.8572  
Max.   : 2.4158   Max.   : 1.1023   Max.   : 1.6478   Max.   : 2.548991   Max.   : 2.1211
outlier(y) # 각 열의 평균과 가장 차이가 많은 값을 각 열별로 출력
[1] 2.415835 1.102298 1.647817 2.548991 2.121117
outlier(y, opposite=TRUE) # 각 열별로 반대 방향으로 열 평균과 가장 차이가 많은 값 출력
[1] -2 .345698 -2.180040 -1 .806031 - 1.390701 - 1.372302
boxplot(y)

a=c(10,20,30)
a
[1] 10 20 30
b=c(40,30,20)
b
[1] 40 30 20
t(b)
[,1] [,2] [,3]
[1,]   40   30   20
x=a%*%t(b)
x
[,1] [,2] [,3]
[1,]  400  300  200
[2,]  800  600  400
[3,] 1200  900  600
y=a*b
y
[1] 400 600 600
z=cbind(x,y)
z
y
[1,]  400 300 200 400
[2,]  800 600 400 600
[3,] 1200 900 600 600



제2장 통계 분석 

제2절 기초 통계 분석

data(iris) # 내장된 데이터 프레임을 워크스페이스안에 로드
head(iris) # 데이터 프레임은 R에서 행렬 형태의 자료를 담아두는 자료의 구조
summary(iris) # 각 컬럼 최소값(Min), 최대값(Max), 25% 백분위수(1st Qu.), 75% 백분위수(3rd Qu.), 중앙값(Median), 평균(Mean)
mean(iris$Sepal.Length) #평균
[1] 5.843333
median(iris$Sepal.Length) #중앙값
[1) 5.8
sd(iris$Sepal.Length) #표준편 차
[1) 0.8280661
var(iris$Sepal.Length ) #분 산
[1] 0.6856935
quantile (iris$Sepal.Length, 1/4) # 1사분위수
25%
5.1
quantile(iris$Sepal.Length, 3/4) # 3사분위수
75%
6.4
max(iris$Sepal.Length) #최대값
[ 1) 7.9
min(iris$Sepal.Length) #최소값
[1) 4.3

install.packages("MASS")
Installing package into ‘C:/Users/juno2/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)

There is a binary version available but the source version is later:
  binary source needs_compilation
MASS 7.3-49 7.3-50              TRUE

Binaries will be installed
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/MASS_7.3-49.zip'
Content type 'application/zip' length 1171437 bytes (1.1 MB)
downloaded 1.1 MB

package ‘MASS’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\juno2\AppData\Local\Temp\RtmpoxgTyz\downloaded_packages
library(MASS)
data(Animals)
head(Animals)
body brain
Mountain beaver     1.35   8.1
Cow               465.00 423.0
Grey wolf          36.33 119.5
Goat               27.66 115.0
Guinea pig          1.04   5.5
Dipliodocus     11700.00  50.0
summary(Animals)
body              brain        
Min.   :    0.02   Min.   :   0.40  
1st Qu.:    3.10   1st Qu.:  22.23  
Median :   53.83   Median : 137.00  
Mean   : 4278.44   Mean   : 574.52  
3rd Qu.:  479.00   3rd Qu.: 420.00  
Max.   :87000.00   Max.   :5712.00  
mean(Animals$body)
[1] 4278.439
mean(Animals$brain)
[1] 574.5214
median(Animals$body)
[1] 53.83
median(Animals$brain)
[1] 137
sd(Animals$body)
[1] 16480.49
sd(Animals$brain)
[1] 1334.929
var(Animals$body)
[1] 271606563
var(Animals$brain)
[1] 1782036
quantile(Animals$body)
0%       25%       50%       75%      100% 
0.023     3.100    53.830   479.000 87000.000 
quantile(Animals$brain)
0%      25%      50%      75%     100% 
0.400   22.225  137.000  420.000 5712.000 

2. 회귀 분석(Regression Analysis)
set.seed(2)
x=runif(10,0,11)
x
[1]  2.033705  7.726114  6.306590  1.848571 10.382233 10.378225  1.420749  9.167937  5.148204  6.049821
y = 2 + 3*x +rnorm(10,0,0.2)
dfrm = data.frame(x,y)
dfrm
x         y
1   2.033705  8.127599
2   7.726114 25.319934
3   6.306590 20.871829
4   1.848571  7.942608
5  10.382233 33.118941
6  10.378225 33.218204
7   1.420749  6.458597
8   9.167937 29.425272
9   5.148204 17.236677
10  6.049821 20.505909
lm(y~x, data=dfrm)

Call:
  lm(formula = y ~ x, data = dfrm)

Coefficients:
  (Intercept)            x  
2.213        2.979  

dfrm 에서 단순회귀분석을 했다. 이 경우 회귀방정식은 y = 2.213 + 2.979x 로 추정된다.

set.seed(2)
u = runif(10,0,11)
u
[1]  2.033705  7.726114  6.306590  1.848571 10.382233 10.378225  1.420749  9.167937  5.148204  6.049821
v = runif(10,11,20)
v
[1] 15.97407 13.15005 17.84462 12.62738 14.64754 18.68194 19.78759 13.03243 15.00328 11.67481
w = runif(10,1,30)
w
[1] 20.195064 12.238937 25.269786  5.364542 11.070895 15.174424  5.328159 11.354815 28.916677  4.838788
y = 3 + 0.1*u + 2*v -3*w + rnorm(10,0,0.1)
y
[1] -25.6647952  -6.5562326 -36.4858791  12.4472764   0.1638434  -3.9124946  26.6127780  -3.9238295 -53.0331805
[10]  12.4387413
dfrm = data.frame(y,u,v,w)
dfrm
y         u        v         w
1  -25.6647952  2.033705 15.97407 20.195064
2   -6.5562326  7.726114 13.15005 12.238937
3  -36.4858791  6.306590 17.84462 25.269786
4   12.4472764  1.848571 12.62738  5.364542
5    0.1638434 10.382233 14.64754 11.070895
6   -3.9124946 10.378225 18.68194 15.174424
7   26.6127780  1.420749 19.78759  5.328159
8   -3.9238295  9.167937 13.03243 11.354815
9  -53.0331805  5.148204 15.00328 28.916677
10  12.4387413  6.049821 11.67481  4.838788
n <- lm(y~u+v+w)
n

Call:
  lm(formula = y ~ u + v + w)

Coefficients:
  (Intercept)            u            v            w  
3.0417       0.1232       1.9890      -2.9978  

회귀식은 ν= 3.0417 + 0.12321u + 1.9890v - 2.9978w 로 추정

summary(n)

Call:
  lm(formula = y ~ u + v + w)

Residuals:
  Min        1Q    Median        3Q       Max 
-0.188562 -0.058632 -0.002013  0.080024  0.143757 

Coefficients:
  Estimate Std. Error  t value Pr(>|t|)    
(Intercept)  3.041653   0.264808   11.486 2.62e-05 ***
  u            0.123173   0.012841    9.592 7.34e-05 ***
  v            1.989017   0.016586  119.923 2.27e-11 ***
  w           -2.997816   0.005421 -552.981 2.36e-15 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1303 on 6 degrees of freedom
Multiple R-squared:      1,	Adjusted R-squared:      1 
F-statistic: 1.038e+05 on 3 and 6 DF,  p-value: 1.564e-14

F통계량= 1.038e+05 이 며 p-값이 1.564e-14로 유의 수준 5% 하에서 추정된 회귀 모형이 통계적으로 매우유의함을 볼 수 있다.
결정 계수와 수정된 결정계수 모두 1로 이 회귀식이 데이터를 매우 잘 설명하고 있음을 알 수 있다. 
또한 회귀계수 u, v, w들의 p-값들도 0.01보다 작으므로 회귀계수의 추정치들이 통계적으로 유의하다.

install.packages("MASS")
library(MASS)
head(ChickWeight)
weight Time Chick Diet
1     42    0     1    1
2     51    2     1    1
3     59    4     1    1
4     64    6     1    1
5     76    8     1    1
6     93   10     1    1
tail(ChickWeight)
weight Time Chick Diet
573    155   12    50    4
574    175   14    50    4
575    205   16    50    4
576    234   18    50    4
577    264   20    50    4
578    264   21    50    4
Chick <- ChickWeight[ChickWeight$Diet==1,]
head(Chick)
weight Time Chick Diet
1     42    0     1    1
2     51    2     1    1
3     59    4     1    1
4     64    6     1    1
5     76    8     1    1
6     93   10     1    1
tail(Chick)
weight Time Chick Diet
215     77   12    20    1
216     89   14    20    1
217     98   16    20    1
218    107   18    20    1
219    115   20    20    1
220    117   21    20    1
Chick <- ChickWeight[ChickWeight$Chick==1,]
head(Chick)
weight Time Chick Diet
1     42    0     1    1
2     51    2     1    1
3     59    4     1    1
4     64    6     1    1
5     76    8     1    1
6     93   10     1    1
tail(Chick)
weight Time Chick Diet
7     106   12     1    1
8     125   14     1    1
9     149   16     1    1
10    171   18     1    1
11    199   20     1    1
12    205   21     1    1
lm(weight~Time, data=Chick)

Call:
  lm(formula = weight ~ Time, data = Chick)

Coefficients:
  (Intercept)         Time  
24.465        7.988  
회귀식은 weight = 7.988Time + 24.465 으로 추정

summary(lm(weight~Time, data=Chick))

Call:
  lm(formula = weight ~ Time, data = Chick)

Residuals:
  Min       1Q   Median       3Q      Max 
-14.3202 -11.3081  -0.3444  11.1162  17.5346 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  24.4654     6.7279   3.636  0.00456 ** 
  Time          7.9879     0.5236  15.255 2.97e-08 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 12.29 on 10 degrees of freedom
Multiple R-squared:  0.9588,	Adjusted R-squared:  0.9547 
F-statistic: 232.7 on 1 and 10 DF,  p-value: 2.974e-08

F통계량= 232.7 이며 p-값이 2.974e-08로 유의수준 5% 하에서 추정된 회귀 모형이 통계적으로 매우 유의함을 볼 수 있다. 
결정계수 또한 0.9588로 매우 높은 값을 보이므로 이 회귀식이 데이터를 96% 정도로 설명하고 있음을 알 수 있다. 
또한 회귀계수들의 p-값들도 0.05보다 매우 작으므로 회귀계수의 추정치들이 통계적으로 매우 유의하다. 
Time에 대한 회귀계수가 7.99 이므로 Time이 1 증가할 때 weight가 7.99 만큼 증가한다고 해석할 수 있다.

# cars 데이터를 이용해 다항회귀분석
# dist = ßo + β1 speed + ß2speed^2 + t 회귀모형을 적합하고 분석하시오
data(cars)
head(cars)
speed dist
1     4    2
2     4   10
3     7    4
4     7   22
5     8   16
6     9   10
speed2 <- cars$speed^2
cars <- cbind(cars, speed2)
head(cars)
speed dist speed2
1     4    2     16
2     4   10     16
3     7    4     49
4     7   22     49
5     8   16     64
6     9   10     81
lm(dist~speed+speed2, data=cars)

Call:
  lm(formula = dist ~ speed + speed2, data = cars)

Coefficients:
  (Intercept)        speed       speed2  
2.47014      0.91329      0.09996  

# 다중회귀식은 dist = 2.47014 + 0.91329speed + 0 .09996spee d2 로 추정

summary(lm(dist~speed+speed2, data=cars))

Call:
  lm(formula = dist ~ speed + speed2, data = cars)

Residuals:
  Min      1Q  Median      3Q     Max 
-28.720  -9.184  -3.188   4.628  45.152 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept)  2.47014   14.81716   0.167    0.868
speed        0.91329    2.03422   0.449    0.656
speed2       0.09996    0.06597   1.515    0.136

Residual standard error: 15.18 on 47 degrees of freedom
Multiple R-squared:  0.6673,	Adjusted R-squared:  0.6532 
F-statistic: 47.14 on 2 and 47 DF,  p-value: 5.852e-12

x <- c(1,2,3,4,5,6,7,8,9)
y <- c(5,3,2,3,4,6,10,12,18)
df1 <- data.frame(x,y)

  df1
x  y
1 1  5
2 2  3
3 3  2
4 4  3
5 5  4
6 6  6
7 7 10
8 8 12
9 9 18
plot(df1) 
# 산점도를 봤을 때 2차식이 펼요한 것처럼 보인다. 
# 즉 모형은 y =bO+blx+b2x2+e 다항회귀분석을 이용
x2 <- x^2
df2 <- cbind(x2,df1)
df2
x2 x  y
1  1 1  5
2  4 2  3
3  9 3  2
4 16 4  3
5 25 5  4
6 36 6  6
7 49 7 10
8 64 8 12
9 81 9 18
lm(y~x, data=df1)

Call:
  lm(formula = y ~ x, data = df1)

Coefficients:
  (Intercept)            x  
-1.167        1.633  

summary(lm(y~x, data=df1))

Call:
  lm(formula = y ~ x, data = df1)

Residuals:
  Min      1Q  Median      3Q     Max 
-3.0000 -2.3667 -0.2667  0.9000  4.5333 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)   
(Intercept)  -1.1667     2.2296  -0.523  0.61694   
x             1.6333     0.3962   4.122  0.00445 **
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.069 on 7 degrees of freedom
Multiple R-squared:  0.7083,	Adjusted R-squared:  0.6666 
F-statistic: 16.99 on 1 and 7 DF,  p-value: 0.004446

df1에서의 F통계량= 16.99 이며 p-값이 0.004446으로 유의수준 5% 하에서 추정된 회귀 모형이 통계적으로 유의함을 볼 수 있다. 
결정계수는 0.7083으로 추정된 회귀식이 약 71%만큼 데이터를 설명

plot(lm(y~x, data=df1))
# df1을 λF용한 회귀식의 잔차도가 뚜렷한 곡선 패턴을 가지기 때문에 
# 오차항은 평균이 0이고 분산이 일정하다는 가정을 만족하지 않는다 
# x2 항을 모형에 추가해야 한다는 증거를 보여준다

lm(y~x+x2, data=df2)

Call:
  lm(formula = y ~ x + x2, data = df2)

Coefficients:
  (Intercept)            x           x2  
7.1667      -2.9121       0.4545  

summary(lm(y~x+x2, data=df2))

Call:
  lm(formula = y ~ x + x2, data = df2)

Residuals:
  Min      1Q  Median      3Q     Max 
-0.9606 -0.1606  0.0303  0.2242  0.9455 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  7.16667    0.78728   9.103 9.87e-05 ***
  x           -2.91212    0.36149  -8.056 0.000196 ***
  x2           0.45455    0.03526  12.893 1.34e-05 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.6187 on 6 degrees of freedom
Multiple R-squared:  0.9898,	Adjusted R-squared:  0.9864 
F-statistic: 292.2 on 2 and 6 DF,  p-value: 1.05e-06

df2에서의 F통계량= 292.2 이며 p 값이 0.0000105으로 유의수준 5%하에서 추정 된 회귀 모형이 통계적으로 매우 유의하다.
수정된 결정계수는 0.9864로 추정된 회귀식이 약 98.6%만큼 데이터 를 설명함을 알 수 있다.
이로써 x2을추가했을 때가 그렇지 않을 때보다 훨씬 회귀식의 추정이 잘됐음을 확인할 수 있다.
최종 회귀식은 y= 7.16667 - 2.91212X +0 .4 5455X2 으로 추정 된다.

plot(lm(y-x+x2, data=df2)) # df1을 사용한 회귀식의 잔차도에 비해 다소 안정된 형태의 잔차도 

# y를 반응변수로 하고 Xl, X2, X3, X4를 설명변수로 하는 선형회귀모형을 고려하고
# 후진제거법을 이용하여 변수를 선택하시오
X1 <- c(7,1,11,11,7,11,3,1,2,21,1,11,10)
X2 <- c(26,29,56,31,52,55,71,31,54,47,40,66,68)
X3 <- c(6,15,8,8,6,9,17,22,18,4,23,9,8)
X4 <- c(60,52,20,47,33,22,6,44,22,26,34,12,12)
Y <- c(78.5,74.3,104.3,87.6,95.9,109.2,102.7,72.5,93.1,115.9,83.8,113.3,109.4)
df <- data.frame(X1,X2,X3,X4,Y)
head(df)
X1 X2 X3 X4     Y
1  7 26  6 60  78.5
2  1 29 15 52  74.3
3 11 56  8 20 104.3
4 11 31  8 47  87.6
5  7 52  6 33  95.9
6 11 55  9 22 109.2
a <- lm(Y~X1+X2+X3+X4, data=df)
a

Call:
  lm(formula = Y ~ X1 + X2 + X3 + X4, data = df)

Coefficients:
  (Intercept)           X1           X2           X3           X4  
62.4054       1.5511       0.5102       0.1019      -0.1441  

summary(a)

Call:
  lm(formula = Y ~ X1 + X2 + X3 + X4, data = df)

Residuals:
  Min      1Q  Median      3Q     Max 
-3.1750 -1.6709  0.2508  1.3783  3.9254 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)  
(Intercept)  62.4054    70.0710   0.891   0.3991  
X1            1.5511     0.7448   2.083   0.0708 .
X2            0.5102     0.7238   0.705   0.5009  
X3            0.1019     0.7547   0.135   0.8959  
X4           -0.1441     0.7091  -0.203   0.8441  
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.446 on 8 degrees of freedom
Multiple R-squared:  0.9824,	Adjusted R-squared:  0.9736 
F-statistic: 111.5 on 4 and 8 DF,  p-value: 4.756e-07

F통계량=111.5 이며 p-값이 0.00000047564로 유의수준 5% 하에서 추정된 회귀 모형이 통계적으로 매우 유의함을 볼 수 었다. 
수정된 결정계수 또한 0 .9736으로 매우 높은 값을 보이므로 추정된 회귀식이 데이터를 97%로 적절하게 설명하고 있음을 알 수 있다. 
설명변수 X1, X2, X3, X4 의 p-value를 보면 X3 의 유의 확률이 가장 높아 이들 중 가장 유의하지 않음을 볼 수 있다. 
설명변수 X3을 제거하고 다시 회귀분석을 한다.

b <- lm(Y~X1+X2+X4,data=df)
b

Call:
  lm(formula = Y ~ X1 + X2 + X4, data = df)

Coefficients:
  (Intercept)           X1           X2           X4  
71.6483       1.4519       0.4161      -0.2365  

summary(b)

Call:
  lm(formula = Y ~ X1 + X2 + X4, data = df)

Residuals:
  Min      1Q  Median      3Q     Max 
-3.0919 -1.8016  0.2562  1.2818  3.8982 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  71.6483    14.1424   5.066 0.000675 ***
  X1            1.4519     0.1170  12.410 5.78e-07 ***
  X2            0.4161     0.1856   2.242 0.051687 .  
X4           -0.2365     0.1733  -1.365 0.205395    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.309 on 9 degrees of freedom
Multiple R-squared:  0.9823,	Adjusted R-squared:  0.9764 
F-statistic: 166.8 on 3 and 9 DF,  p-value: 3.323e-08

여기서 F통계량= 166.8 이며 p-값이 0.00000003323로 유의수준 5% 하에서 추정된 회귀 모형이 통계적으로 매우 유의함을 볼 수 있다. 
X3 변수를 제거하기 전보다 수정된 결정계수가 0.9764으로 높아졌음을 알 수 있다.
이어서 설명변수 X1, X2 , X4 들 중 p-값이 가장 높은 X4를 제거하고 회귀분석을 한다.

c <- lm(Y~X1+X2, data=df)
c

Call:
  lm(formula = Y ~ X1 + X2, data = df)

Coefficients:
  (Intercept)           X1           X2  
52.5773       1.4683       0.6623  

summary(c)

Call:
  lm(formula = Y ~ X1 + X2, data = df)

Residuals:
  Min     1Q Median     3Q    Max 
-2.893 -1.574 -1.302  1.363  4.048 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 52.57735    2.28617   23.00 5.46e-10 ***
  X1           1.46831    0.12130   12.11 2.69e-07 ***
  X2           0.66225    0.04585   14.44 5.03e-08 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.406 on 10 degrees of freedom
Multiple R-squared:  0.9787,	Adjusted R-squared:  0.9744 
F-statistic: 229.5 on 2 and 10 DF,  p-value: 4.407e-09

F통계량= 229.5 이며 p-값이 0.000000004407로 유의수준 5% 하에서 추정된 회귀 모형이 통계적으로 매우 유의함을 볼 수 있다. 
설명변수 X1, X2 의 p-값이 모두 유의하므로 여기에서 변수제거를 멈춘다. 
즉, 최종 회귀식은 y= 52.57735 + 1.46831X1 +0.66225X2 로 추정된다.

# [예제] 위의 예에서 주어진 자료와 선형회귀모형에 대해 전진선택법을 적용하여 모형을 선택하시오.
step(lm(Y~1,df), scope=list(lower=~1,upper=~X1+X2+X3+X4), direction="forward")
Start:  AIC=71.44
Y ~ 1

Df Sum of Sq     RSS    AIC
+ X4    1   1831.90  883.87 58.852
+ X2    1   1809.43  906.34 59.178
+ X1    1   1450.08 1265.69 63.519
+ X3    1    776.36 1939.40 69.067
<none             2715.76 71.444

Step:  AIC=58.85
Y ~ X4

Df Sum of Sq    RSS    AIC
+ X1    1    809.10  74.76 28.742
+ X3    1    708.13 175.74 39.853
<none             883.87 58.852
+ X2    1     14.99 868.88 60.629

Step:  AIC=28.74
Y ~ X4 + X1

Df Sum of Sq    RSS    AIC
+ X2    1    26.789 47.973 24.974
+ X3    1    23.926 50.836 25.728
<none             74.762 28.742

Step:  AIC=24.97
Y ~ X4 + X1 + X2

Df Sum of Sq    RSS    AIC
<none             47.973 24.974
+ X3    1   0.10909 47.864 26.944

Call:
  lm(formula = Y ~ X4 + X1 + X2, data = df)

Coefficients:
  (Intercept)           X4           X1           X2  
71.6483      -0.2365       1.4519       0.4161  

# 최종회귀식은 y= 71.6483-0.2365X4+1.4519X1+0.4161X2 로 추정된다. 
# 앞의 후진선택법의 결과와 다른 모형이 선택되었다. 
# 보통 변수선택의 기준에 따라 선택된 모형은 차이를 보일 수 있다.

[예제] 위의 자료와 모형에 대해 단계적 방법을 적용하여 모형을 선택하시오.
step(lm(Y~1,df), scope=list(lower=~1,upper=~X1+X2+X3+X4), direction="both")
Start:  AIC=71.44
Y ~ 1

Df Sum of Sq     RSS    AIC
+ X4    1   1831.90  883.87 58.852
+ X2    1   1809.43  906.34 59.178
+ X1    1   1450.08 1265.69 63.519
+ X3    1    776.36 1939.40 69.067
<none             2715.76 71.444

Step:  AIC=58.85
Y ~ X4

Df Sum of Sq     RSS    AIC
+ X1    1    809.10   74.76 28.742
+ X3    1    708.13  175.74 39.853
<none              883.87 58.852
+ X2    1     14.99  868.88 60.629
- X4    1   1831.90 2715.76 71.444

Step:  AIC=28.74
Y ~ X4 + X1

Df Sum of Sq     RSS    AIC
+ X2    1     26.79   47.97 24.974
+ X3    1     23.93   50.84 25.728
<none               74.76 28.742
- X1    1    809.10  883.87 58.852
- X4    1   1190.92 1265.69 63.519

Step:  AIC=24.97
Y ~ X4 + X1 + X2

Df Sum of Sq    RSS    AIC
<none              47.97 24.974
- X4    1      9.93  57.90 25.420
+ X3    1      0.11  47.86 26.944
- X2    1     26.79  74.76 28.742
- X1    1    820.91 868.88 60.629

Call:
  lm(formula = Y ~ X4 + X1 + X2, data = df)

Coefficients:
  (Intercept)           X4           X1           X2  
71.6483      -0.2365       1.4519       0.4161 

최종 회귀모형은 y=71.6483-0.2365X4+1.4519X1+0.4161X2로 추정된다.

# step 합수를 이용해 전진선택법을 적용하시오. 이때 time은 종속변수다
library(MASS) 
data(hills)
head(hills)
dist climb   time
Greenmantle   2.5   650 16.083
Carnethy      6.0  2500 48.350
Craig Dunain  6.0   900 33.650
Ben Rha       7.5   800 45.600
Ben Lomond    8.0  3070 62.267
Goatfell      8.0  2866 73.217

step(lm(time~1,hills), scope=list(lower=~1,upper=~dist+climb), direction="forward")
Start:  AIC=274.88
time ~ 1

Df Sum of Sq   RSS    AIC
+ dist   1     71997 13142 211.49
+ climb  1     55205 29934 240.30
<none              85138 274.88

Step:  AIC=211.49
time ~ dist

Df Sum of Sq     RSS    AIC
+ climb  1    6249.7  6891.9 190.90
<none              13141.6 211.49

Step:  AIC=190.9
time ~ dist + climb


Call:
  lm(formula = time ~ dist + climb, data = hills)

Coefficients:
  (Intercept)         dist        climb  
-8.99204      6.21796      0.01105  

step 함수 결과 최종회귀식은 dist와 climb 모두 채택된 time = -8.99204 + 6.21796dist + 0.01105climb로 추정됐다.

# 다음 데이터세트로 step 함수를 이용해 후진제거법, 전진선택법, 단계적방법을 적용하시오. 
# 이때 Premax 변수를 종속변수로 지정한다
# R에서 구체적인 디렉터리를 설정해 외부 데이터세트를 읽을 때 ‘\’를 2번 해줘야 한다.
Bio <- read.csv("C:\\Users\\juno2\\Documents\\회사업무\\ADP\\Bio.csv", header=TRUE) 
Bio
나이  키 체중 BMP FEV  RV FRC TLC Pemax
1     7 109 13.1  68  32 258 183 137    95
2     7 112 12.9  65  19 449 245 134    85
3     8 124 14.1  64  22 441 268 147   100
4     8 125 16.2  67  41 234 146 124    85
5     8 127 21.5  93  52 202 131 104    95
6     9 130 17.5  68  44 308 155 118    80
7    11 139 30.7  89  28 305 179 119    65
8    12 150 28.4  69  18 369 198 103   110
9    12 146 25.1  67  24 312 194 128    70
10   13 155 31.5  68  23 413 225 136    95
11   13 156 39.9  89  39 206 142  95   110
12   14 153 42.1  90  26 253 191 121    90
13   14 160 45.6  93  45 174 139 108   100
14   15 158 51.2  93  45 158 124  90    80
15   16 160 35.9  66  31 302 133 101   134
16   17 153 34.8  70  29 204 118 120   134
17   17 174 44.7  70  49 187 104 103   165
18   17 176 60.1  92  29 188 129 130   120
19   17 171 42.6  69  38 172 130 103   130
20   19 156 37.2  72  21 216 119  81    85
21   19 174 54.6  86  37 184 118 101    85
22   20 178 64.0  86  34 225 148 135   160
23   23 180 73.8  97  57 171 108  98   165
24   23 175 51.1  71  33 224 131 113    95
25   23 179 71.5  95  52 225 127 101   195
step(lm(Pemax~1,Bio), scope=list(lower=~1,upper=~나이+키+체중+BMP+FEV+RV+FRC+TLC), direction="forward")
Start:  AIC=176.46
Pemax ~ 1

Df Sum of Sq   RSS    AIC
+ 체중  1   10827.2 16006 165.54
+ 나이  1   10098.5 16734 166.66
+ 키    1    9634.6 17198 167.34
+ FEV   1    5515.4 21317 172.71
+ FRC   1    4670.6 22162 173.68
+ RV    1    2671.8 24161 175.84
<none             26833 176.46
+ BMP   1    1413.5 25419 177.11
+ TLC   1     885.1 25948 177.62

Step:  AIC=165.55
Pemax ~ 체중

Df Sum of Sq   RSS    AIC
+ BMP   1   1914.94 14090 164.36
<none             16006 165.54
+ FEV   1    951.36 15054 166.01
+ RV    1    274.55 15731 167.11
+ TLC   1    230.64 15775 167.18
+ 나이  1    216.51 15789 167.21
+ 키    1     36.39 15969 167.49
+ FRC   1     27.34 15978 167.50

Step:  AIC=164.36
Pemax ~ 체중 + BMP

Df Sum of Sq   RSS    AIC
+ FEV   1   2552.35 11538 161.36
<none             14090 164.36
+ 키    1    713.50 13377 165.06
+ 나이  1    681.28 13409 165.12
+ TLC   1     96.61 13994 166.19
+ FRC   1     44.62 14046 166.28
+ RV    1     18.84 14072 166.33

Step:  AIC=161.36
Pemax ~ 체중 + BMP + FEV

Df Sum of Sq   RSS    AIC
+ RV    1   1183.59 10355 160.66
<none             11538 161.36
+ FRC   1    775.76 10762 161.62
+ TLC   1    658.14 10880 161.90
+ 나이  1    584.53 10954 162.06
+ 키    1    545.58 10993 162.15

Step:  AIC=160.66
Pemax ~ 체중 + BMP + FEV + RV

Df Sum of Sq   RSS    AIC
<none             10355 160.66
+ TLC   1   197.087 10158 162.18
+ 키    1   191.013 10164 162.19
+ 나이  1   178.147 10176 162.22
+ FRC   1     3.417 10351 162.65

Call:
  lm(formula = Pemax ~ 체중 + BMP + FEV + RV, data = Bio)

Coefficients:
  (Intercept)         체중          BMP          FEV           RV  
63.9467       1.7489      -1.3772       1.5477       0.1257  

step(lm(Pemax~나이+키+체중+BMP+RV+FRC+TLC,data=Bio), direction="backward")
Start:  AIC=169.37
Pemax ~ 나이 + 키 + 체중 + BMP + RV + FRC + TLC

Df Sum of Sq   RSS    AIC
- TLC   1      72.9 11612 167.52
- 키    1     549.2 12089 168.53
- RV    1     827.3 12367 169.10
- 나이  1     833.8 12373 169.11
<none             11540 169.37
- FRC   1    1251.2 12791 169.94
- BMP   1    1769.5 13309 170.93
- 체중  1    3278.8 14818 173.62

Step:  AIC=167.52
Pemax ~ 나이 + 키 + 체중 + BMP + RV + FRC

Df Sum of Sq   RSS    AIC
- 키    1     697.8 12310 166.98
- RV    1     756.6 12369 167.10
<none             11612 167.52
- 나이  1    1074.8 12687 167.74
- FRC   1    1257.0 12870 168.09
- BMP   1    2643.2 14256 170.65
- 체중  1    4431.4 16044 173.60

Step:  AIC=166.98
Pemax ~ 나이 + 체중 + BMP + RV + FRC

Df Sum of Sq   RSS    AIC
- RV    1     759.2 13070 166.48
<none             12310 166.98
- FRC   1    1090.7 13401 167.10
- 나이  1    1263.1 13573 167.43
- BMP   1    1984.6 14295 168.72
- 체중  1    3967.1 16277 171.97

Step:  AIC=166.48
Pemax ~ 나이 + 체중 + BMP + FRC

Df Sum of Sq   RSS    AIC
- FRC   1     339.8 13409 165.12
- 나이  1     976.4 14046 166.28
<none             13070 166.48
- BMP   1    2716.5 15786 169.20
- 체중  1    3632.7 16702 170.61

Step:  AIC=165.12
Pemax ~ 나이 + 체중 + BMP

Df Sum of Sq   RSS    AIC
- 나이  1     681.3 14090 164.36
<none             13409 165.12
- BMP   1    2379.7 15789 167.21
- 체중  1    3324.7 16734 168.66

Step:  AIC=164.36
Pemax ~ 체중 + BMP

Df Sum of Sq   RSS    AIC
<none             14090 164.36
- BMP   1    1914.9 16006 165.54
- 체중  1   11328.6 25419 177.11

Call:
  lm(formula = Pemax ~ 체중 + BMP, data = Bio)

Coefficients:
  (Intercept)         체중          BMP  
124.830        1.640       -1.005  

step(lm(Pemax~1,Bio), scope=list(lower=~1,upper=~나이+키+체중+BMP+RV+FRC+TLC), direction="both")
Start:  AIC=176.46
Pemax ~ 1

Df Sum of Sq   RSS    AIC
+ 체중  1   10827.2 16006 165.54
+ 나이  1   10098.5 16734 166.66
+ 키    1    9634.6 17198 167.34
+ FRC   1    4670.6 22162 173.68
+ RV    1    2671.8 24161 175.84
<none             26833 176.46
+ BMP   1    1413.5 25419 177.11
+ TLC   1     885.1 25948 177.62

Step:  AIC=165.55
Pemax ~ 체중

Df Sum of Sq   RSS    AIC
+ BMP   1    1914.9 14090 164.36
<none             16006 165.54
+ RV    1     274.5 15731 167.11
+ TLC   1     230.6 15775 167.18
+ 나이  1     216.5 15789 167.21
+ 키    1      36.4 15969 167.49
+ FRC   1      27.3 15978 167.50
- 체중  1   10827.2 26833 176.46

Step:  AIC=164.36
Pemax ~ 체중 + BMP

Df Sum of Sq   RSS    AIC
<none             14090 164.36
+ 키    1     713.5 13377 165.06
+ 나이  1     681.3 13409 165.12
- BMP   1    1914.9 16006 165.54
+ TLC   1      96.6 13994 166.19
+ FRC   1      44.6 14046 166.28
+ RV    1      18.8 14072 166.33
- 체중  1   11328.6 25419 177.11

Call:
  lm(formula = Pemax ~ 체중 + BMP, data = Bio)

Coefficients:
  (Intercept)         체중          BMP  
124.830        1.640       -1.005  


# 제3절 다변량 분석

install.packages("Hmisc")
library(Hmisc)
data(mtcars)
head(mtcars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
drat <- mtcars$drat
disp <- mtcars$disp
plot(drat,disp)
cor(drat,disp) # disp와 drat은 서로 강한 편의 음의 상관성을 가지고 있음
[1] -0.7102139

# Hmisc 패키지의 rcorr합수를 이용하여 mtcars 데이터세트를 상관분석한 내용이다. 
# rcorr함수는 모든 변수들 사이의 상관계수와 함께 가설 H0 : ρ=0 에 대한 p-값을 출력한다.
# 앞부분 표시된 상관계수 행렬, 아래 부분 표시된 P 행렬은 각 상관계수의 유의확률
rcorr(as.matrix(mtcars), type="pearson")
      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
mpg   1.00 -0.85 -0.85 -0.78  0.68 -0.87  0.42  0.66  0.60  0.48 -0.55
cyl  -0.85  1.00  0.90  0.83 -0.70  0.78 -0.59 -0.81 -0.52 -0.49  0.53
disp -0.85  0.90  1.00  0.79 -0.71  0.89 -0.43 -0.71 -0.59 -0.56  0.39
hp   -0.78  0.83  0.79  1.00 -0.45  0.66 -0.71 -0.72 -0.24 -0.13  0.75
drat  0.68 -0.70 -0.71 -0.45  1.00 -0.71  0.09  0.44  0.71  0.70 -0.09
wt   -0.87  0.78  0.89  0.66 -0.71  1.00 -0.17 -0.55 -0.69 -0.58  0.43
qsec  0.42 -0.59 -0.43 -0.71  0.09 -0.17  1.00  0.74 -0.23 -0.21 -0.66
vs    0.66 -0.81 -0.71 -0.72  0.44 -0.55  0.74  1.00  0.17  0.21 -0.57
am    0.60 -0.52 -0.59 -0.24  0.71 -0.69 -0.23  0.17  1.00  0.79  0.06
gear  0.48 -0.49 -0.56 -0.13  0.70 -0.58 -0.21  0.21  0.79  1.00  0.27
carb -0.55  0.53  0.39  0.75 -0.09  0.43 -0.66 -0.57  0.06  0.27  1.00

n= 32 


P
     mpg    cyl    disp   hp     drat   wt     qsec   vs     am     gear   carb  
mpg         0.0000 0.0000 0.0000 0.0000 0.0000 0.0171 0.0000 0.0003 0.0054 0.0011
cyl  0.0000        0.0000 0.0000 0.0000 0.0000 0.0004 0.0000 0.0022 0.0042 0.0019
disp 0.0000 0.0000        0.0000 0.0000 0.0000 0.0131 0.0000 0.0004 0.0010 0.0253
hp   0.0000 0.0000 0.0000        0.0100 0.0000 0.0000 0.0000 0.1798 0.4930 0.0000
drat 0.0000 0.0000 0.0000 0.0100        0.0000 0.6196 0.0117 0.0000 0.0000 0.6212
wt   0.0000 0.0000 0.0000 0.0000 0.0000        0.3389 0.0010 0.0000 0.0005 0.0146
qsec 0.0171 0.0004 0.0131 0.0000 0.6196 0.3389        0.0000 0.2057 0.2425 0.0000
vs   0.0000 0.0000 0.0000 0.0000 0.0117 0.0010 0.0000        0.3570 0.2579 0.0007
am   0.0003 0.0022 0.0004 0.1798 0.0000 0.0000 0.2057 0.3570        0.0000 0.7545
gear 0.0054 0.0042 0.0010 0.4930 0.0000 0.0005 0.2425 0.2579 0.0000        0.1290
carb 0.0011 0.0019 0.0253 0.0000 0.6212 0.0146 0.0000 0.0007 0.7545 0.1290       
# carb와 am의 p-값이 0.7545로 두 변수 사이의 상관계수가 유의하지 않음

cov(mtcars) # 매트릭스 형식으로 공분산
      mpg         cyl        disp          hp         drat          wt         qsec           vs           am        gear        carb
mpg    36.324103  -9.1723790  -633.09721 -320.732056   2.19506351  -5.1166847   4.50914919   2.01713710   1.80393145   2.1356855 -5.36310484
cyl    -9.172379   3.1895161   199.66028  101.931452  -0.66836694   1.3673710  -1.88685484  -0.72983871  -0.46572581  -0.6491935  1.52016129
disp -633.097208 199.6602823 15360.79983 6721.158669 -47.06401915 107.6842040 -96.05168145 -44.37762097 -36.56401210 -50.8026210 79.06875000
hp   -320.732056 101.9314516  6721.15867 4700.866935 -16.45110887  44.1926613 -86.77008065 -24.98790323  -8.32056452  -6.3588710 83.03629032
drat    2.195064  -0.6683669   -47.06402  -16.451109   0.28588135  -0.3727207   0.08714073   0.11864919   0.19015121   0.2759879 -0.07840726
wt     -5.116685   1.3673710   107.68420   44.192661  -0.37272073   0.9573790  -0.30548161  -0.27366129  -0.33810484  -0.4210806  0.67579032
qsec    4.509149  -1.8868548   -96.05168  -86.770081   0.08714073  -0.3054816   3.19316613   0.67056452  -0.20495968  -0.2804032 -1.89411290
vs      2.017137  -0.7298387   -44.37762  -24.987903   0.11864919  -0.2736613   0.67056452   0.25403226   0.04233871   0.0766129 -0.46370968
am      1.803931  -0.4657258   -36.56401   -8.320565   0.19015121  -0.3381048  -0.20495968   0.04233871   0.24899194   0.2923387  0.04637097
gear    2.135685  -0.6491935   -50.80262   -6.358871   0.27598790  -0.4210806  -0.28040323   0.07661290   0.29233871   0.5443548  0.32661290
carb   -5.363105   1.5201613    79.06875   83.036290  -0.07840726   0.6757903  -1.89411290  -0.46370968   0.04637097   0.3266129  2.60887097

# 피어슨의 상관계수는 두 변수 간의 선형관계의 크기를 측정하는 값으로 비선형적인 상관관계는 나타내지 못한다. 
# 스피어만 상관계수는 두 변수 간의 비선형적인 관계도 나타낼 수 있는 값으로, 
# 한 변수를 단조 증가 합수로 변환하여 다른 변수를 나타낼 수 있는 정도를 나타낸다. 
# 스피어만의 상관계수는 두 변수를 모두 순위로 변환시킨 후, 두 순위 사이의 피어슨 상관계수로 정의가 된다.
rcorr(as.matrix(mtcars), type="spearman")
      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
mpg   1.00 -0.91 -0.91 -0.89  0.65 -0.89  0.47  0.71  0.56  0.54 -0.66
cyl  -0.91  1.00  0.93  0.90 -0.68  0.86 -0.57 -0.81 -0.52 -0.56  0.58
disp -0.91  0.93  1.00  0.85 -0.68  0.90 -0.46 -0.72 -0.62 -0.59  0.54
hp   -0.89  0.90  0.85  1.00 -0.52  0.77 -0.67 -0.75 -0.36 -0.33  0.73
drat  0.65 -0.68 -0.68 -0.52  1.00 -0.75  0.09  0.45  0.69  0.74 -0.13
wt   -0.89  0.86  0.90  0.77 -0.75  1.00 -0.23 -0.59 -0.74 -0.68  0.50
qsec  0.47 -0.57 -0.46 -0.67  0.09 -0.23  1.00  0.79 -0.20 -0.15 -0.66
vs    0.71 -0.81 -0.72 -0.75  0.45 -0.59  0.79  1.00  0.17  0.28 -0.63
am    0.56 -0.52 -0.62 -0.36  0.69 -0.74 -0.20  0.17  1.00  0.81 -0.06
gear  0.54 -0.56 -0.59 -0.33  0.74 -0.68 -0.15  0.28  0.81  1.00  0.11
carb -0.66  0.58  0.54  0.73 -0.13  0.50 -0.66 -0.63 -0.06  0.11  1.00

n= 32 


P
     mpg    cyl    disp   hp     drat   wt     qsec   vs     am     gear   carb  
mpg         0.0000 0.0000 0.0000 0.0000 0.0000 0.0071 0.0000 0.0008 0.0013 0.0000
cyl  0.0000        0.0000 0.0000 0.0000 0.0000 0.0006 0.0000 0.0022 0.0008 0.0005
disp 0.0000 0.0000        0.0000 0.0000 0.0000 0.0081 0.0000 0.0001 0.0003 0.0014
hp   0.0000 0.0000 0.0000        0.0023 0.0000 0.0000 0.0000 0.0416 0.0639 0.0000
drat 0.0000 0.0000 0.0000 0.0023        0.0000 0.6170 0.0102 0.0000 0.0000 0.4947
wt   0.0000 0.0000 0.0000 0.0000 0.0000        0.2148 0.0004 0.0000 0.0000 0.0036
qsec 0.0071 0.0006 0.0081 0.0000 0.6170 0.2148        0.0000 0.2644 0.4182 0.0000
vs   0.0000 0.0000 0.0000 0.0000 0.0102 0.0004 0.0000        0.3570 0.1170 0.0000
am   0.0008 0.0022 0.0001 0.0416 0.0000 0.0000 0.2644 0.3570        0.0000 0.7264
gear 0.0013 0.0008 0.0003 0.0639 0.0000 0.0000 0.4182 0.1170 0.0000        0.5312
carb 0.0000 0.0005 0.0014 0.0000 0.4947 0.0036 0.0000 0.0000 0.7264 0.5312       

korean <- c(85,75,65,78,59,60,90,100,99,91,70)
math <- c(80,60,75,40,50,64,70,78,90,98,50)
english <- c(80,70,69,79,80,95,98,97,67,80,59)
science <- c(90,100,50,80,67,89,60,79,89,80,100)
test <- data.frame(korean,math,english,science)
head(test)
korean math english science
1     85   80      80      90
2     75   60      70     100
3     65   75      69      50
4     78   40      79      80
5     59   50      80      67
6     60   64      95      89
rcorr(as.matrix(test), type="spearman")
        korean  math english science
korean    1.00  0.65    0.20    0.00
math      0.65  1.00    0.16   -0.09
english   0.20  0.16    1.00   -0.42
science   0.00 -0.09   -0.42    1.00

n= 11 


P
        korean math   english science
korean         0.0299 0.5517  1.0000 
math    0.0299        0.6462  0.7937 
english 0.5517 0.6462         0.1926 
science 1.0000 0.7937 0.1926         

# 2. 다차원 척도법
data(eurodist) # eurodist는 각 도시 사이의 거리를 포함하는 행렬형태의 자료 
eurodist
                Athens Barcelona Brussels Calais Cherbourg Cologne Copenhagen Geneva Gibraltar Hamburg Hook of Holland Lisbon Lyons Madrid
Barcelona         3313                                                 
Brussels          2963      1318                                       
Calais            3175      1326      204                              
Cherbourg         3339      1294      583    460                       
Cologne           2762      1498      206    409       785             
Copenhagen        3276      2218      966   1136      1545     760     
Geneva            2610       803      677    747       853    1662       1418                                                             
Gibraltar         4485      1172     2256   2224      2047    2436       3196   1975                                                      
Hamburg           2977      2018      597    714      1115     460        460   1118      2897                                            
Hook of Holland   3030      1490      172    330       731     269        269    895      2428     550                                    
Lisbon            4532      1305     2084   2052      1827    2290       2971   1936       676    2671            2280                    
Lyons             2753       645      690    739       789     714       1458    158      1817    1159             863   1178             
Madrid            3949       636     1558   1550      1347    1764       2498   1439       698    2198            1730    668  1281       
Marseilles        2865       521     1011   1059      1101    1035       1778    425      1693    1479            1183   1762   320   1157
Milan             2282      1014      925   1077      1209     911       1537    328      2185    1238            1098   2250   328   1724
Munich            2179      1365      747    977      1160     583       1104    591      2565     805             851   2507   724   2010
Paris             3000      1033      285    280       340     465       1176    513      1971     877             457   1799   471   1273
Rome               817      1460     1511   1662      1794    1497       2050    995      2631    1751            1683   2700  1048   2097
Stockholm         3927      2868     1616   1786      2196    1403        650   2068      3886     949            1500   3231  2108   3188
Vienna            1991      1802     1175   1381      1588     937       1455   1019      2974    1155            1205   2937  1157   2409
# cmdscale 함수를 사용하여 각 도시의 상대적 위치를 도식화 할 수 있는 X, Y좌표를 계산하고 그래프로 표현 
# 각 개체에 대한 특정 변수들의 관측치는 없더라도 개체 간의 유사성에 대한 자료를 사용하여 산점도를 그릴 수 있다.
loc <- cmdscale(eurodist)
loc
                        [,1]        [,2]
Athens           2290.274680  1798.80293
Barcelona        -825.382790   546.81148
Brussels           59.183341  -367.08135
Calais            -82.845973  -429.91466
Cherbourg        -352.499435  -290.90843
Cologne           293.689633  -405.31194
Copenhagen        681.931545 -1108.64478
Geneva             -9.423364   240.40600
Gibraltar       -2048.449113   642.45854
Hamburg           561.108970  -773.36929
Hook of Holland   164.921799  -549.36704
Lisbon          -1935.040811    49.12514
Lyons            -226.423236   187.08779
Madrid          -1423.353697   305.87513
Marseilles       -299.498710   388.80726
Milan             260.878046   416.67381
Munich            587.675679    81.18224
Paris            -156.836257  -211.13911
Rome              709.413282  1109.36665
Stockholm         839.445911 -1836.79055
Vienna            911.230500   205.93020
x <- loc[,1]
y <- loc[,2]
plot(x,y,type="n", main="eurodist")
text(x,y,rownames(loc),cex=0.8)
abline(v=0,h=0)

# 3. 주성분 분석
# 주성분 분석 (Principal Component Analysis, PCA)은 상관관계가 있는 고차원 자료를 자료의 변동을
# 최대한 보존하는 저차원 자료로 변환시키는 방법으로, 자료의 차원을 축약시키는데 주로 사용된다.
# 주성분들은 서로 상관관계가 없고, 주성분들의 분산의 합은 Xi 들의 분산의 합과 같다.
# 주성분들은 차원을 줄여 예측모댈을 만들 때도 사용한다. 희생되는 정보가 가장 적은 방향을 결정한다.

library(datasets)
# 미국의 50개 주의 인구 10만명 당 살인, 폭행, 강간으로 인한 체포의 수와 도시 인구의 비율을 포함
data(USArrests) 
head(USArrests)
Murder Assault UrbanPop Rape
Alabama      13.2     236       58 21.2
Alaska       10.0     263       48 44.5
Arizona       8.1     294       80 31.0
Arkansas      8.8     190       50 19.5
California    9.0     276       91 40.6
Colorado      7.9     204       78 38.7
summary(USArrests)
Murder          Assault         UrbanPop          Rape      
Min.   : 0.800   Min.   : 45.0   Min.   :32.00   Min.   : 7.30  
1st Qu.: 4.075   1st Qu.:109.0   1st Qu.:54.50   1st Qu.:15.07  
Median : 7.250   Median :159.0   Median :66.00   Median :20.10  
Mean   : 7.788   Mean   :170.8   Mean   :65.54   Mean   :21.23  
3rd Qu.:11.250   3rd Qu.:249.0   3rd Qu.:77.75   3rd Qu.:26.18  
Max.   :17.400   Max.   :337.0   Max.   :91.00   Max.   :46.00  
# 주성분분석은 R 함수 princomp를 이용하여 수행
# cor=TRUE 옵션은 주성분분석을 공분산행렬이 아닌 상관계수 행렬을 사용하여 수행 
fit <- princomp(USArrests, cor=TRUE)
summary(fit)
Importance of components:
                          Comp.1    Comp.2    Comp.3     Comp.4
Standard deviation     1.5748783 0.9948694 0.5971291 0.41644938
Proportion of Variance 0.6200604 0.2474413 0.0891408 0.04335752 # 첫 번째 주성분 하나가 전체 분산의 약 62%를 설명하고 있다. 두 번째와 세 번째 주성분의 분산은 전체 분산 중 각각 25%와 9%를 설명하고
Cumulative Proportion  0.6200604 0.8675017 0.9566425 1.00000000
loadings(fit) # 주성분들의 로딩 벡터들을 보여준다

Loadings:
          Comp.1 Comp.2 Comp.3 Comp.4
Murder    0.536  0.418  0.341  0.649
Assault   0.583  0.188  0.268 -0.743
UrbanPop  0.278 -0.873  0.378  0.134
Rape      0.543 -0.167 -0.818       

                Comp.1 Comp.2 Comp.3 Comp.4
SS loadings      1.00   1.00   1.00   1.00
Proportion Var   0.25   0.25   0.25   0.25
Cumulative Var   0.25   0.50   0.75   1.00
# 첫 번째와 두 번째 주성분이
Y1 = 0.536Mrder+0.583Assault+0.278UbanPop+0.543Rape
Y2 = 0.418Mrderr+0.188Assault-0.873UrbanPop-0.167Rape

plot(fit, type="lines")
# plot(fit) 함수는 각 주성분의 분산의 크기를 그림으로 그려준다. 이 그림을 스크리 그림 (Scree plot) 이라고 한다.

fit$scores # 각 관측치를 주성분들로 표현한 값
Comp.1      Comp.2      Comp.3       Comp.4
Alabama         0.98556588  1.13339238  0.44426879  0.156267145
Alaska          1.95013775  1.07321326 -2.04000333 -0.438583440
Arizona         1.76316354 -0.74595678 -0.05478082 -0.834652924
Arkansas       -0.14142029  1.11979678 -0.11457369 -0.182810896
California      2.52398013 -1.54293399 -0.59855680 -0.341996478
Colorado        1.51456286 -0.98755509 -1.09500699  0.001464887
Connecticut    -1.35864746 -1.08892789  0.64325757 -0.118469414
Delaware        0.04770931 -0.32535892  0.71863294 -0.881977637
Florida         3.01304227  0.03922851  0.57682949 -0.096284752
Georgia         1.63928304  1.27894240  0.34246008  1.076796812
Hawaii         -0.91265715 -1.57046001 -0.05078189  0.902806864
Idaho          -1.63979985  0.21097292 -0.25980134 -0.499104101
Illinois        1.37891072 -0.68184119  0.67749564 -0.122021292
Indiana        -0.50546136 -0.15156254 -0.22805484  0.424665700
Iowa           -2.25364607 -0.10405407 -0.16456432  0.017555916
Kansas         -0.79688112 -0.27016470 -0.02555331  0.206496428
Kentucky       -0.75085907  0.95844029  0.02836942  0.670556671
Louisiana       1.56481798  0.87105466  0.78348036  0.454728038
Maine          -2.39682949  0.37639158  0.06568239 -0.330459817
Maryland        1.76336939  0.42765519  0.15725013 -0.559069521
Massachusetts  -0.48616629 -1.47449650  0.60949748 -0.179598963
Michigan        2.10844115 -0.15539682 -0.38486858  0.102372019
Minnesota      -1.69268181 -0.63226125 -0.15307043  0.067316885
Mississippi     0.99649446  2.39379599  0.74080840  0.215508013
Missouri        0.69678733 -0.26335479 -0.37744383  0.225824461
Montana        -1.18545191  0.53687437 -0.24688932  0.123742227
Nebraska       -1.26563654 -0.19395373 -0.17557391  0.015892888
Nevada          2.87439454 -0.77560020 -1.16338049  0.314515476
New Hampshire  -2.38391541 -0.01808229 -0.03685539 -0.033137338
New Jersey      0.18156611 -1.44950571  0.76445355  0.243382700
New Mexico      1.98002375  0.14284878 -0.18369218 -0.339533597
New York        1.68257738 -0.82318414  0.64307509 -0.013484369
North Carolina  1.12337861  2.22800338  0.86357179 -0.954381667
North Dakota   -2.99222562  0.59911882 -0.30127728 -0.253987327
Ohio           -0.22596542 -0.74223824  0.03113912  0.473915911
Oklahoma       -0.31178286 -0.28785421  0.01530979  0.010332321
Oregon          0.05912208 -0.54141145 -0.93983298 -0.237780688
Pennsylvania   -0.88841582 -0.57110035  0.40062871  0.359061124
Rhode Island   -0.86377206 -1.49197842  1.36994570 -0.613569430
South Carolina  1.32072380  1.93340466  0.30053779 -0.131466685
South Dakota   -1.98777484  0.82334324 -0.38929333 -0.109571764
Tennessee       0.99974168  0.86025130 -0.18808295  0.652864291
Texas           1.35513821 -0.41248082  0.49206886  0.643195491
Utah           -0.55056526 -1.47150461 -0.29372804 -0.082314047
Vermont        -2.80141174  1.40228806 -0.84126309 -0.144889914
Virginia       -0.09633491  0.19973529 -0.01171254  0.211370813
Washington     -0.21690338 -0.97012418 -0.62487094 -0.220847793
West Virginia  -2.10858541  1.42484670 -0.10477467  0.131908831
Wisconsin      -2.07971417 -0.61126862  0.13886500  0.184103743
Wyoming        -0.62942666  0.32101297  0.24065923 -0.166651801

# biplot은 관측치들을 첫 번째와 두 번째 주성분의 좌표에 그린 그림이다.
biplot(fit)

# 컴퓨터 예제 
# 새로운 컴퓨터를 구입했을때 가격, 소프트웨어, 외형, 브랜드에 대한 만족도를 1~7까지의 척도로 점수를 부여한 분석
Price <- c(6,7,6,5,7,6,5,6,3,1,2,5,2,3,1,2)
Software <- c(5,3,4,7,7,4,7,5,5,3,6,7,4,5,6,3)
Aesthetics <- c(3,2,4,1,5,2,2,4,6,7,6,7,5,6,5,7)
Brand <- c(4,2,5,3,5,3,1,4,7,5,7,6,6,5,5,7)
data <- data.frame(Price,Software,Aesthetics,Brand)
head(data)
   Price Software Aesthetics Brand
1     6        5          3     4
2     7        3          2     2
3     6        4          4     5
4     5        7          1     3
5     7        7          5     5
6     6        4          2     3
pca <- princomp(data, cor=T)
summary(pca, loadings=T)
Importance of components:
                          Comp.1    Comp.2    Comp.3     Comp.4
Standard deviation     1.5589391 0.9804092 0.6816673 0.37925777
Proportion of Variance 0.6075727 0.2403006 0.1161676 0.03595911
Cumulative Proportion  0.6075727 0.8478733 0.9640409 1.00000000

Loadings:
           Comp.1 Comp.2 Comp.3 Comp.4
Price       0.523         0.848       
Software    0.177  0.977 -0.120       
Aesthetics -0.597  0.134  0.295  0.734
Brand      -0.583  0.167  0.423 -0.674

위 결과를 보면 Comp.1이 60%, Comp.2까지 하면 84%를 설명 해 줌을 알 수 있다. 
Comp.1은 Aesthetics와 Brand가 클수록 Price가 낮을수록 높은 값을 가지고 Software의 영향은 적게 받는다 
Comp.2는 Software의 영향만을 크게 받는다. 
Comp.1은 패션 추구형, Comp.2는 기능 추구형을 측정하는 변수로 해석할 수 있다.

biplot(pca)


# 제4절 시계열 예측

# 1871년도부터 1970년도까지 아스완 댐에서 측정한 나일강의 연간 유입량에 관한 시계열 데이터
# 데이터 자체가 시계열 자료 형식인 ‘ts’ 클래스를 갖기 때문에 따로 설정할 펼요는 없다. 
# 다만, 일반 데이터 셋을 시계열 자료 형식으로 변환하려면 ts 함수를 사용하면 된다.
Nile 
Time Series:
Start = 1871 
End = 1970 
Frequency = 1 
[1] 1120 1160  963 1210 1160 1160  813 1230 1370 1140  995  935 1110  994 1020  960 1180  799  958 1140 1100 1210 1150 1250 1260 1220 1030 1100
[29]  774  840  874  694  940  833  701  916  692 1020 1050  969  831  726  456  824  702 1120 1100  832  764  821  768  845  864  862  698  845
[57]  744  796 1040  759  781  865  845  944  984  897  822 1010  771  676  649  846  812  742  801 1040  860  874  848  890  744  749  838 1050
[85]  918  986  797  923  975  815 1020  906  901 1170  912  746  919  718  714  740

ldeaths # 1974년부터 1979년까지의 영국 내의 월별 폐질환 사망자에 관한 시계열 자료다
Jan  Feb  Mar  Apr  May  Jun  Jul  Aug  Sep  Oct  Nov  Dec
1974 3035 2552 2704 2554 2014 1655 1721 1524 1596 2074 2199 2512
1975 2933 2889 2938 2497 1870 1726 1607 1545 1396 1787 2076 2837
1976 2787 3891 3179 2011 1636 1580 1489 1300 1356 1653 2013 2823
1977 3102 2294 2385 2444 1748 1554 1498 1361 1346 1564 1640 2293
1978 2815 3137 2679 1969 1870 1633 1529 1366 1357 1570 1535 2491
1979 3084 2605 2573 2143 1693 1504 1461 1354 1333 1492 1781 1915

plot(Nile) # 비계절성을 띄는 데이터. 펑균이 변화하는 추세를 보이므로 정상성을 만족하지 못함
plot(ldeaths) # 년도 별로 계절성을 띄고 있음 

# 계절성을 띄는 시계열 자료는 추세요인, 계절요인, 불규칙요인으로 구성된다 
# decompose 함수를 사용하면 시계열 자료를 4 가지 요인으로 분해
ldeaths.decompose <- decompose(ldeaths) 
# 추세요인， 계절요인， 불규칙요인으로 분해된 시계열 자료 
ldeaths.decompose$seasonal
Jan       Feb       Mar       Apr       May       Jun       Jul       Aug       Sep       Oct       Nov       Dec
1974  873.7514  896.3347  687.5431  156.5847 -284.4819 -440.0236 -519.4236 -669.8736 -678.2236 -354.3069 -185.2069  517.3264
1975  873.7514  896.3347  687.5431  156.5847 -284.4819 -440.0236 -519.4236 -669.8736 -678.2236 -354.3069 -185.2069  517.3264
1976  873.7514  896.3347  687.5431  156.5847 -284.4819 -440.0236 -519.4236 -669.8736 -678.2236 -354.3069 -185.2069  517.3264
1977  873.7514  896.3347  687.5431  156.5847 -284.4819 -440.0236 -519.4236 -669.8736 -678.2236 -354.3069 -185.2069  517.3264
1978  873.7514  896.3347  687.5431  156.5847 -284.4819 -440.0236 -519.4236 -669.8736 -678.2236 -354.3069 -185.2069  517.3264
1979  873.7514  896.3347  687.5431  156.5847 -284.4819 -440.0236 -519.4236 -669.8736 -678.2236 -354.3069 -185.2069  517.3264
plot(ldeaths.decompose) # random, seasonal, trend, observed 4가지 그래프 표시 
# 계절성을 띄는 시계열 자료는 계절요인를 추정해 그 값을 원 시계열자료에서 빼면 적절하게 조정할 수 있다.
ldeaths.decompose.adj <- ldeaths - ldeaths.decompose$seasonal
plot(ldeaths.decompose.adj)

# 나일강 연간 유입량 데이터는 그림으로 고찰해보았을 때 시간에 따라 평균이 일정하지 않은 비정상 시계열 자료였다. 
# 따라서 diff 함수를 사용하여 차분을 한다.
Nile.diff1 <- diff(Nile,differences=1)
plot(Nile.diff1) # 1번 차분한 결과로는 아직 평균이 일정하지 않아 보인다. 

Nile.diff2 <- diff(Nile, differences=2)
plot(Nile.diff2)
# 2번 차분한 결과로 시간이 지남에 따라 평균과 분산이 어느 정도 일정한 정상성을 만족하는 것으로 보인다. ???

acf(Nile.diff2, lag.max=20) # 자기상관함수 
acf(Nile.diff2, lag.max=20, plot=FALSE)

Autocorrelations of series ‘Nile.diff2’, by lag

0      1      2      3      4      5      6      7      8      9     10     11     12     13     14     15     16     17     18     19     20 
1.000 -0.626  0.100  0.067 -0.072  0.017  0.074 -0.192  0.245 -0.079 -0.153  0.183 -0.106  0.062  0.010 -0.096  0.134 -0.134  0.091 -0.030  0.003 
# 자기상관함수가 lag=1, 8을 제외하고 모두 신뢰구간 안에 있는 것을 확인할 수 있다.

pacf(Nile.diff2, lag.max=20) # 부분자기상관함수 (Partial autocorrelations function) 
pacf(Nile.diff2, lag.max=20, plot=FALSE)

Partial autocorrelations of series ‘Nile.diff2’, by lag

1      2      3      4      5      6      7      8      9     10     11     12     13     14     15     16     17     18     19     20 
-0.626 -0.481 -0.302 -0.265 -0.273 -0.112 -0.353 -0.213  0.038 -0.120 -0.117 -0.197 -0.132 -0.055 -0.109  0.022 -0.184 -0.067 -0.037 -0.024 
# 부분자기상관함수가 lag =1~8 에서 신뢰구간을 넘어서 음의 값을 가지고， lag=9 에서 절단된 것을 볼 수 있다.

# forecast 패키지 에 있는 auto.arima 합수를 사용하여 적절한 ARlMA 모형을 결정
install.packages("forecast")
library(forecast)
auto.arima(Nile)
Series: Nile 
ARIMA(1,1,1) 

Coefficients:
  ar1      ma1
0.2544  -0.8741
s.e.  0.1194   0.0605

sigma^2 estimated as 20177:  log likelihood=-630.63
AIC=1267.25   AICc=1267.51   BIC=1275.04
# auto.arima 함수를 사용하여 나일강의 연간 유입량 시계열 자료에 적절한 모형은 ARlMA(1,1,1) 모형으로 결정

# 시계열 자료를 ARIMA(1,1,1) 모형에 적합한다
Nile.arima <- arima(Nile, order=c(1,1,1))
Nile.arima

Call:
  arima(x = Nile, order = c(1, 1, 1))

Coefficients:
  ar1      ma1
0.2544  -0.8741
s.e.  0.1194   0.0605

sigma^2 estimated as 19769:  log likelihood = -630.63,  aic = 1267.25
Nile.forecasts <- forecast(Nile.arima, h=10) # h=1O은 10개 년도만 예측
Nile.forecasts
Point Forecast    Lo 80     Hi 80    Lo 95    Hi 95
1971       816.1813 635.9909  996.3717 540.6039 1091.759
1972       835.5596 642.7830 1028.3363 540.7332 1130.386
1973       840.4889 643.5842 1037.3936 539.3492 1141.629
1974       841.7428 642.1115 1041.3741 536.4331 1147.053
1975       842.0617 640.0311 1044.0923 533.0826 1151.041
1976       842.1429 637.8116 1046.4741 529.6452 1154.641
1977       842.1635 635.5748 1048.7522 526.2134 1158.114
1978       842.1687 633.3514 1050.9861 522.8102 1161.527
1979       842.1701 631.1488 1053.1914 519.4408 1164.899
1980       842.1704 628.9682 1055.3727 516.1057 1168.235
plot(Nile.forecasts)

firm <- read.csv("C:\\Users\\juno2\\Documents\\회사업무\\ADP\\ceo_salary_p440.csv")
head(firm)
salary tenure age  sales profits assets
1   3030      7  61 161315    2956 257389
2   6050      0  51 144416   22071 237545
3   3571     11  63 139208    4430  49271
4   3300      6  60 100697    6370  92630
5      0     18  63 100469    9296 355935
6   9375      6  57  81667    6328  86100
summary(firm)
salary         tenure           age            sales           profits          assets       
Min.   :   0   Min.   : 0.00   Min.   :51.00   Min.   : 31707   Min.   :  568   Min.   :  14166  
1st Qu.:1970   1st Qu.: 3.00   1st Qu.:57.75   1st Qu.: 36829   1st Qu.: 1593   1st Qu.:  37424  
Median :3300   Median : 5.00   Median :60.00   Median : 52183   Median : 3781   Median :  73010  
Mean   :3817   Mean   : 7.55   Mean   :60.15   Mean   : 68133   Mean   : 4737   Mean   : 342990  
3rd Qu.:5427   3rd Qu.: 8.00   3rd Qu.:61.50   3rd Qu.: 86368   3rd Qu.: 5937   3rd Qu.: 267993  
Max.   :9525   Max.   :32.00   Max.   :74.00   Max.   :161315   Max.   :22071   Max.   :3665875  
var(firm$salary)
[1] 6844228
sd(firm$salary)
[1] 2616.148
var(firm$tenure)
[1] 58.57632
sd(firm$tenure)
[1] 7.653517
var(firm$age)
[1] 19.50263
sd(firm$age)
[1] 4.416178
var(firm$sales)
[1] 1645457074
sd(firm$sales)
[1] 40564.23
var(firm$profits)
[1] 22255537
sd(firm$profits)
[1] 4717.577
var(firm$assets)
[1] 648644675330
sd(firm$assets)
[1] 805384.8
# profits 에 따른 CEO의 salary에 대한 산점도, 상관계수
plot(firm$profits,firm$salary)
cor(firm$profits,firm$salary)
[1] 0.3019593
# profits에 따른 CEO 의 salary 에 대한 단순 선형 회귀식
lm(salary~profits,data=firm)

Call:
  lm(formula = salary ~ profits, data = firm)

Coefficients:
  (Intercept)      profits  
3024.1107       0.1675  

summary(lm(salary~profits,data=firm))

Call:
  lm(formula = salary ~ profits, data = firm)

Residuals:
  Min      1Q  Median      3Q     Max 
-4580.7 -1246.4  -730.4  1307.5  5528.5 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)   
(Intercept) 3024.1107   822.6289   3.676  0.00173 **
  profits        0.1675     0.1246   1.344  0.19570   
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2562 on 18 degrees of freedom
Multiple R-squared:  0.09118,	Adjusted R-squared:  0.04069 
F-statistic: 1.806 on 1 and 18 DF,  p-value: 0.1957
# 추정된 회귀식 salary = 3024.1107 + 0.1675profits
유의수준 0.05하에서 p-값=0.1957 0.05 이므로 추정된 회귀식이 통계적으로 유의하지 않다.

# profits과 age, sales 에 따른 CEO 의 salary의 회귀식 
lm(salary~profits+age+sales,data=firm)

Call:
  lm(formula = salary ~ profits + age + sales, data = firm)

Coefficients:
  (Intercept)      profits          age        sales  
-4.569e+03    2.340e-01    1.274e+02   -5.650e-03  

summary(lm(salary~profits+age+sales, data=firm))

Call:
  lm(formula = salary ~ profits + age + sales, data = firm)

Residuals:
  Min      1Q  Median      3Q     Max 
-5064.4 -1005.6  -762.7   553.4  5663.2 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept) -4.569e+03  9.034e+03  -0.506    0.620
profits      2.340e-01  1.629e-01   1.436    0.170
age          1.274e+02  1.454e+02   0.876    0.394
sales       -5.650e-03  1.823e-02  -0.310    0.761

Residual standard error: 2647 on 16 degrees of freedom
Multiple R-squared:  0.1377,	Adjusted R-squared:  -0.02403 
F-statistic: 0.8514 on 3 and 16 DF,  p-value: 0.4861
# 추정된 회귀식 salary = 0.004569 + 0.234pTOfits + 0.01274age - 0.0056sales 
유의수준 0.05하에서 p-값=0.4861 0.05 이므로 추정된 회귀식이 통계적으로 유의하지 않다.

# profit, age, sales, tenure, assets 에 따른 CEO의 salary 의 회귀식
lm(salary~profits+age+sales+tenure+assets,data=firm)

Call:
  lm(formula = salary ~ profits + age + sales + tenure + assets, 
     data = firm)

Coefficients:
  (Intercept)      profits          age        sales       tenure       assets  
6.295e+02    2.069e-01    3.887e+01   -6.346e-03    4.881e+01   -1.939e-04  

summary(lm(salary~profits+age+sales+tenure+assets,data=firm))

Call:
  lm(formula = salary ~ profits + age + sales + tenure + assets, 
     data = firm)

Residuals:
  Min      1Q  Median      3Q     Max 
-5173.6 -1006.6  -626.4   531.6  5462.7 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept)  6.295e+02  2.126e+04   0.030    0.977
profits      2.069e-01  1.989e-01   1.040    0.316
age          3.887e+01  3.611e+02   0.108    0.916
sales       -6.346e-03  1.961e-02  -0.324    0.751
tenure       4.881e+01  1.899e+02   0.257    0.801
assets      -1.939e-04  9.166e-04  -0.212    0.835

Residual standard error: 2822 on 14 degrees of freedom
Multiple R-squared:  0.1426,	Adjusted R-squared:  -0.1636 
F-statistic: 0.4658 on 5 and 14 DF,  p-value: 0.7954

# 후진선택법으로 최적의 회귀식을 찾으시오. 단, salary를 종속변수로 한다.
step(lm(salary~.,data=firm),dirction="backward")
Start:  AIC=322.67
salary ~ tenure + age + sales + profits + assets

Df Sum of Sq       RSS    AIC
- age      1     92281 111583466 320.69
- assets   1    356490 111847674 320.74
- tenure   1    526022 112017206 320.77
- sales    1    833628 112324812 320.82
- profits  1   8617106 120108290 322.16
<none                111491184 322.67

Step:  AIC=320.69
salary ~ tenure + sales + profits + assets

Df Sum of Sq       RSS    AIC
- assets   1    676425 112259890 318.81
- sales    1    892500 112475966 318.85
- tenure   1   4986238 116569704 319.57
- profits  1  10828227 122411692 320.54
<none                111583466 320.69

Step:  AIC=318.81
salary ~ tenure + sales + profits

Df Sum of Sq       RSS    AIC
- sales    1    754779 113014669 316.95
- tenure   1   5257207 117517097 317.73
- profits  1  11229913 123489803 318.72
<none                112259890 318.81

Step:  AIC=316.95
salary ~ tenure + profits

Df Sum of Sq       RSS    AIC
- tenure   1   5168658 118183328 315.84
<none                113014669 316.95
- profits  1  12091946 125106615 316.98

Step:  AIC=315.84
salary ~ profits

Df Sum of Sq       RSS    AIC
- profits  1  11857005 130040333 315.75
<none                118183328 315.84

Step:  AIC=315.75
salary ~ 1


Call:
  lm(formula = salary ~ 1, data = firm)

Coefficients:
  (Intercept)  
3817  
# 추정된 회귀식 : salary = -288 + 0.1798profits + 49.54age + 43.35tenure - 0.0001.56assets
유의수준 0.05하에서 p-값=0.6741 0.05 이므로 추정된 회귀식이 통계적으로 유의하지 않다.

# 전진선택법으로 최적의 회귀식을 찾으시오. 단, salary룰 종속변수로 한다.
step(lm(salary~1,firm), scope=list(lower~1,upper=~tenure+age+sales+profits+assets), direction="forward")
Start:  AIC=315.75
salary ~ 1

Df Sum of Sq       RSS    AIC
<none                130040333 315.75
+ profits  1  11857005 118183328 315.84
+ tenure   1   4933717 125106615 316.98
+ assets   1   1886771 128153561 317.46
+ sales    1   1675228 128365105 317.49
+ age      1   1146879 128893453 317.58

Call:
  lm(formula = salary ~ 1, data = firm)

Coefficients:
  (Intercept)  
3817  

# 단계적 방법으로 최적의 회귀식을 찾으시오. 단, salary를 종속변수로 한다.
step(lm(salary~1,firm), scope=list(lower=~1,upper=~tenure+age+sales+profits+assets), direction="both")
Start:  AIC=315.75
salary ~ 1

Df Sum of Sq       RSS    AIC
<none                130040333 315.75
+ profits  1  11857005 118183328 315.84
+ tenure   1   4933717 125106615 316.98
+ assets   1   1886771 128153561 317.46
+ sales    1   1675228 128365105 317.49
+ age      1   1146879 128893453 317.58

Call:
  lm(formula = salary ~ 1, data = firm)

Coefficients:
  (Intercept)  
3817  


제3장
정형 데이터 마이닝

# R에서 로지스틱회귀모형은 glmO 함수를 이용하여 수행한다.
data("iris")
head(iris)
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
a <- subset(iris, Species=="setosa" | Species=="versicolor") # Species가 setosa와 versicolor 인 100개의 자료만을 이용
head(a)
Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
a$Species <- factor(a$Species) # Species는 Factor형 변수(범주형 변수를 의미)로 setosa는 Y=1, versicolor는 Y=2로 인식 
str(a)
'data.frame':	100 obs. of  5 variables:
  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
$ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
$ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
$ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
$ Species     : Factor w/ 2 levels "setosa","versicolor": 1 1 1 1 1 1 1 1 1 1 ...

# glm() 합수를 이용하여 로지스틱 회귀모형을 수행
b <- glm(Species~Sepal.Length, data=a, family=binomial)
summary(b)

Call:
  glm(formula = Species ~ Sepal.Length, family = binomial, data = a)

Deviance Residuals: 
  Min        1Q    Median        3Q       Max  
-2.05501  -0.47395  -0.02829   0.39788   2.32915  

Coefficients:
  Estimate Std. Error z value Pr(>|z|)    
(Intercept)   -27.831      5.434  -5.122 3.02e-07 ***
  Sepal.Length    5.140      1.007   5.107 3.28e-07 ***
  ---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 138.629  on 99  degrees of freedom
Residual deviance:  64.211  on 98  degrees of freedom
AIC: 68.211

Number of Fisher Scoring iterations: 6

회귀계수의 검정에서 p-값이 거의 영 (0) 이므로 Sepal.Length가 매우 유의한 변수이며, 
Sepal.Length가 한 단위 증가함에 따라 Versicolor(Y=2) 일 오즈가 exp(5.140) = 170 배 증가함을 알 수 있다.
위 결과의 마지막 부분에 제시된 Null deviance는 절편만 포함하는 모형 (Ho : ß= 0 하의 모형)의 완전모형 (또는 포화모형)으로부터의 이탈도(deviance)를 나타내며 
p-값= p (x2 (99 ) 138.629) = 0.005 으로 통계적으로 유의하므로 적합결여를 나타낸다. 
Residual deviance는 예측변수 Sepal.Length가 추가된 적합모형의 이탈도를 나타낸다. 
Null deviance에 비해 자유도 1 기준에 이탈도의 감소가 74.4 정도의 큰 감소를 보이며.
p-값= P(X2 (9 8) 64.211) = 0.997 이 므로 귀무가설 (적합 모형)이 기각되지 않으며 
적합값이 관측된 자료를 잘 적합하고 있다고 말할 수 있다. ?????
  
  coef(b)
(Intercept) Sepal.Length 
-27.831451     5.140336 
exp(coef(b)["Sepal.Length"])
Sepal.Length 
170.7732 
# 회귀계수 β와 오즈의 증가량 exp(β) 에 대한 신뢰구간 
confint(b, parm="Sepal.Length")
Waiting for profiling to be done...
2.5 %   97.5 % 
  3.421613 7.415508 
exp(confint(b, parm="Sepal.Length"))
Waiting for profiling to be done...
2.5 %     97.5 % 
  30.61878 1661.55385 
# fitted() 함수를 통해 적합 결과를 확인 
fitted(b)[c(1:5,96:100)]
1          2          3          4          5         96         97         98         99        100 
0.16579367 0.06637193 0.02479825 0.01498061 0.10623680 0.81282396 0.81282396 0.98268360 0.16579367 0.81282396 
# predict() 함수를 이용하여 새로운 자료에 대한 예측을 수행한다. 
predict(b, newdata=a[c(1,50,51,100),], type="response")
1        50        51       100 
0.1657937 0.1062368 0.9997116 0.8128240 
# cdplot() 함수는 Sepal.Length (연속형 변수) 의 변화에 따른 범주형 변수의 조건부 분포를 보여준다. 
# 아래의 그림은 Sepal.Length가 커짐에 따라 versicolor 의 확률이 증가함을 보여준다
cdplot(Species~Sepal.Length,data=a)
# 적합된 로지스틱회귀모형의 그래프 
plot(a$Sepal.Length, a$Species, xlab="Sepal.Length")
x=seq(min(a$Sepal.Length), max(a$Sepal.Length), 0.1)
lines(x, 1+(1/(1+(1/exp(-27.831+5.140*x)))), type="l", col="red")

# 예측변수가 여러 개인 다중 로지스틱회귀모형을 사용하여 분석
attach(mtcars) 
The following objects are masked _by_ .GlobalEnv:
  
  disp, drat

The following object is masked from package:ggplot2:
  
  mpg

str(mtcars) # 1973~1974 년도에 생산된 32종류의 지동차에 대해 11개 변수값을 측정한 자료  
'data.frame':	32 obs. of  11 variables:
  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
$ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
$ disp: num  160 160 108 258 360 ...
$ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
$ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
$ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
$ qsec: num  16.5 17 18.6 19.4 17 ...
$ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
$ am  : num  1 1 1 0 0 0 0 0 0 0 ...
$ gear: num  4 4 4 3 3 3 3 4 4 4 ...
$ carb: num  4 4 1 1 2 1 4 2 2 4 ...

# 이항 변수 vs (O:flat engine, l:straight engine)를 반응변수로,
# mpg(miles/gallon)와 am(Transmission:O=automatic, 1: manual)을 예측변수로 하는 로지스틱회귀모형을 이용하면 다음과 같다. 
# 아래 glm() 함수의 적용시 family= binomial은 family= binomial (logit)과 동일하다.
glm.vs <- glm(vs~mpg+am,data=mtcars, family=binomial)
summary(glm.vs)

Call:
  glm(formula = vs ~ mpg + am, family = binomial, data = mtcars)

Deviance Residuals: 
  Min        1Q    Median        3Q       Max  
-2.05888  -0.44544  -0.08765   0.33335   1.68405  

Coefficients:
  Estimate Std. Error z value Pr(>|z|)   
(Intercept) -12.7051     4.6252  -2.747  0.00602 **
  mpg           0.6809     0.2524   2.698  0.00697 **
  am           -3.0073     1.5995  -1.880  0.06009 . 
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 43.860  on 31  degrees of freedom
Residual deviance: 20.646  on 29  degrees of freedom
AIC: 26.646

Number of Fisher Scoring iterations: 6
# 다중로지스틱에서 추정된 회귀계수 β1 에 대한 해석은 다음과 같다. 
# 다른 모든 변수들(여기서는 am)이 주어질 때， mpg 값이 한 단위 증가함에 따라 vs가 1일 오즈가 exp(0.6809) = 1.98 배(즉, 98%) 증가한다.
# 마찬가지로, mpg가 주어질 때, 오즈에 대한 am의 효과는 exp(-3.0073) = 0.05 배 
# 즉, 변속기가 수동인 경우 자동에 비해 vs=1의 오즈가 95%나 감소한다.

step.vs <- step(glm.vs, direction="backward")
Start:  AIC=26.65
vs ~ mpg + am

Df Deviance    AIC
<none     20.646 26.646
- am    1   25.533 29.533
- mpg   1   42.953 46.953
summary(step.vs) # summary(glm.vs)의 결과와 동일 

Call:
  glm(formula = vs ~ mpg + am, family = binomial, data = mtcars)

Deviance Residuals: 
  Min        1Q    Median        3Q       Max  
-2.05888  -0.44544  -0.08765   0.33335   1.68405  

Coefficients:
  Estimate Std. Error z value Pr(>|z|)   
(Intercept) -12.7051     4.6252  -2.747  0.00602 **
  mpg           0.6809     0.2524   2.698  0.00697 **
  am           -3.0073     1.5995  -1.880  0.06009 . 
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 43.860  on 31  degrees of freedom
Residual deviance: 20.646  on 29  degrees of freedom
AIC: 26.646

Number of Fisher Scoring iterations: 6

# glm() 함수의 수행 결과는 많은 유용한 결과를 제공한다.
# 예를 들어 glm.vs$coef, glm.vs$fitted, glm.vs$resid, glm.vs$effects 등
# Is() , str() 함수를 통해 확인
ls(glm.vs)
[1] "aic"               "boundary"          "call"              "coefficients"      "contrasts"         "control"           "converged"        
[8] "data"              "deviance"          "df.null"           "df.residual"       "effects"           "family"            "fitted.values"    
[15] "formula"           "iter"              "linear.predictors" "method"            "model"             "null.deviance"     "offset"           
[22] "prior.weights"     "qr"                "R"                 "rank"              "residuals"         "terms"             "weights"          
[29] "xlevels"           "y"                
str(glm.vs)
List of 30
$ coefficients     : Named num [1:3] -12.705 0.681 -3.007
..- attr(*, "names")= chr [1:3] "(Intercept)" "mpg" "am"
$ residuals        : Named num [1:32] -1.24 -1.24 2.21 1.15 -2.03 ...
..- attr(*, "names")= chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
$ fitted.values    : Named num [1:32] 0.196 0.196 0.453 0.866 0.507 ...
..- attr(*, "names")= chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
$ effects          : Named num [1:32] 0.726 -1.939 1.88 0.932 -0.658 ...
..- attr(*, "names")= chr [1:32] "(Intercept)" "mpg" "am" "" ...
$ R                : num [1:3, 1:3] -1.8 0 0 -35.07 -5.29 ...
..- attr(*, "dimnames")=List of 2
.. ..$ : chr [1:3] "(Intercept)" "mpg" "am"
.. ..$ : chr [1:3] "(Intercept)" "mpg" "am"
$ rank             : int 3
$ qr               :List of 5
..$ qr   : num [1:32, 1:3] -1.804 0.22 0.276 0.189 0.277 ...
.. ..- attr(*, "dimnames")=List of 2
.. .. ..$ : chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
.. .. ..$ : chr [1:3] "(Intercept)" "mpg" "am"
..$ rank : int 3
..$ qraux: num [1:3] 1.22 1.1 1.12
..$ pivot: int [1:3] 1 2 3
..$ tol  : num 1e-11
..- attr(*, "class")= chr "qr"
$ family           :List of 12
..$ family    : chr "binomial"
..$ link      : chr "logit"
..$ linkfun   :function (mu)  
  ..$ linkinv   :function (eta)  
    ..$ variance  :function (mu)  
      ..$ dev.resids:function (y, mu, wt)  
        ..$ aic       :function (y, n, mu, wt, dev)  
          ..$ mu.eta    :function (eta)  
            ..$ initialize:  expression({  if (NCOL(y) == 1) {  if (is.factor(y))  y <- y != levels(y)[1L]  n <- rep.int(1, nobs)  y[weights =| __truncated__
                                                                  ..$ validmu   :function (mu)  
 ..$ valideta  :function (eta)  
   ..$ simulate  :function (object, nsim)  
     ..- attr(*, "class")= chr "family"
                                                                  $ linear.predictors: Named num [1:32] -1.4131 -1.4131 -0.1874 1.8666 0.0281 ...
                                                                  ..- attr(*, "names")= chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
                                                                  $ deviance         : num 20.6
                                                                  $ aic              : num 26.6
                                                                  $ null.deviance    : num 43.9
                                                                  $ iter             : int 6
                                                                  $ weights          : Named num [1:32] 0.157 0.157 0.248 0.116 0.25 ...
                                                                  ..- attr(*, "names")= chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
                                                                  $ prior.weights    : Named num [1:32] 1 1 1 1 1 1 1 1 1 1 ...
                                                                  ..- attr(*, "names")= chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
                                                                  $ df.residual      : int 29
                                                                  $ df.null          : int 31
                                                                  $ y                : Named num [1:32] 0 0 1 1 0 1 0 1 1 1 ...
                                                                  ..- attr(*, "names")= chr [1:32] "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
                                                                  $ converged        : logi TRUE
                                                                  $ boundary         : logi FALSE
                                                                  $ model            :'data.frame':	32 obs. of  3 variables:
 ..$ vs : num [1:32] 0 0 1 1 0 1 0 1 1 1 ...
                                                                  ..$ mpg: num [1:32] 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
                                                                  ..$ am : num [1:32] 1 1 1 0 0 0 0 0 0 0 ...
                                                                  ..- attr(*, "terms")=Classes 'terms', 'formula'  language vs ~ mpg + am
                                                                  .. .. ..- attr(*, "variables")= language list(vs, mpg, am)
                                                                  .. .. ..- attr(*, "factors")= int [1:3, 1:2] 0 1 0 0 0 1
                                                                  .. .. .. ..- attr(*, "dimnames")=List of 2
                                                                  .. .. .. .. ..$ : chr [1:3] "vs" "mpg" "am"
                                                                  .. .. .. .. ..$ : chr [1:2] "mpg" "am"
                                                                  .. .. ..- attr(*, "term.labels")= chr [1:2] "mpg" "am"
                                                                  .. .. ..- attr(*, "order")= int [1:2] 1 1
                                                                  .. .. ..- attr(*, "intercept")= int 1
                                                                  .. .. ..- attr(*, "response")= int 1
                                                                  .. .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv
 .. .. ..- attr(*, "predvars")= language list(vs, mpg, am)
                                                                  .. .. ..- attr(*, "dataClasses")= Named chr [1:3] "numeric" "numeric" "numeric"
                                                                  .. .. .. ..- attr(*, "names")= chr [1:3] "vs" "mpg" "am"
                                                                  $ call             : language glm(formula = vs ~ mpg + am, family = binomial, data = mtcars)
                                                                  $ formula          :Class 'formula'  language vs ~ mpg + am
                                                                  .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv
 $ terms            :Classes 'terms', 'formula'  language vs ~ mpg + am
                                                                  .. ..- attr(*, "variables")= language list(vs, mpg, am)
                                                                  .. ..- attr(*, "factors")= int [1:3, 1:2] 0 1 0 0 0 1
                                                                  .. .. ..- attr(*, "dimnames")=List of 2
                                                                  .. .. .. ..$ : chr [1:3] "vs" "mpg" "am"
                                                                  .. .. .. ..$ : chr [1:2] "mpg" "am"
                                                                  .. ..- attr(*, "term.labels")= chr [1:2] "mpg" "am"
                                                                  .. ..- attr(*, "order")= int [1:2] 1 1
                                                                  .. ..- attr(*, "intercept")= int 1
                                                                  .. ..- attr(*, "response")= int 1
                                                                  .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv
 .. ..- attr(*, "predvars")= language list(vs, mpg, am)
                                                                  .. ..- attr(*, "dataClasses")= Named chr [1:3] "numeric" "numeric" "numeric"
                                                                  .. .. ..- attr(*, "names")= chr [1:3] "vs" "mpg" "am"
                                                                  $ data             :'data.frame':	32 obs. of  11 variables:
 ..$ mpg : num [1:32] 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
                                                                  ..$ cyl : num [1:32] 6 6 4 6 8 6 8 4 4 6 ...
                                                                  ..$ disp: num [1:32] 160 160 108 258 360 ...
                                                                  ..$ hp  : num [1:32] 110 110 93 110 175 105 245 62 95 123 ...
                                                                  ..$ drat: num [1:32] 3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
                                                                  ..$ wt  : num [1:32] 2.62 2.88 2.32 3.21 3.44 ...
                                                                  ..$ qsec: num [1:32] 16.5 17 18.6 19.4 17 ...
                                                                  ..$ vs  : num [1:32] 0 0 1 1 0 1 0 1 1 1 ...
                                                                  ..$ am  : num [1:32] 1 1 1 0 0 0 0 0 0 0 ...
                                                                  ..$ gear: num [1:32] 4 4 4 3 3 3 3 4 4 4 ...
                                                                  ..$ carb: num [1:32] 4 4 1 1 2 1 4 2 2 4 ...
                                                                  $ offset           : NULL
                                                                  $ control          :List of 3
                                                                  ..$ epsilon: num 1e-08
                                                                  ..$ maxit  : num 25
                                                                  ..$ trace  : logi FALSE
                                                                  $ method           : chr "glm.fit"
                                                                  $ contrasts        : NULL
                                                                  $ xlevels          : Named list()
                                                                  - attr(*, "class")= chr [1:2] "glm" "lm"
                                                                  
                                                                  # anova() 함수는 모형의 적 합(변수가 추가되는) 단계별로 이탈도의 감소량과 유의성 검정 결과를 제시
                                                                  anova(glm.vs, test="Chisq")
                                                                  Analysis of Deviance Table
                                                                  
                                                                  Model: binomial, link: logit
                                                                  
                                                                  Response: vs
                                                                  
                                                                  Terms added sequentially (first to last)
                                                                  
                                                                  
                                                                  Df Deviance Resid. Df Resid. Dev  Pr(>Chi)    
                                                                  NULL                    31     43.860              
                                                                  mpg   1   18.327        30     25.533 1.861e-05 ***
 am    1    4.887        29     20.646   0.02706 *  
 ---
 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                  # 절편항만 포함하는 영(null) 모형에서 mpg와 am 변수가 차례로 모형에 추가됨에 따라 발생하는 이탈도의 감소량을 제시하며 
                                                                  # p-값은 각각 p(x2 (1) 18.327) 과 p(x2 (1) 4.887) 을 계산한 값이다.
                                                                  # 그 결과 두 변수가 차례로 추가되면서 생겨나는 이탈도의 감소량이 모두 통계적으로 유의함을 나타낸다.
                                                                  1-pchisq(18.327,1)
                                                                  [1] 1.860515e-05
                                                                  1-pchisq(4.887,1)
                                                                  [1] 0.02705967
                                                                  
                                                                  
                                                                  # 2. 신경망 모형 
                                                                  # 인공신경망에서 입력(inputs)은 시냅스에 해당하며 개별신호의 강도에 따라 가중(weight) 되며, 
                                                                  # 활성 함수(activation function)는 인공신경망의 출력 (outputs)을 계산한다
                                                                  # iris : 자료의 수는 150개이며 입력변수의 차원은 4이며, 목표값은 3개의 범주로 출력된다. ??? 
                                                                  library(nnet)
                                                                  nn.iris <- nnet(Species~.,data=iris, size=2, rang=0.1, decay=5e-4, maxit=200)
                                                                  # weights:  19
                                                                  initial  value 164.777723 
                                                                  iter  10 value 21.844122
                                                                  iter  20 value 9.390303
                                                                  iter  30 value 8.746321
                                                                  iter  40 value 8.572956
                                                                  iter  50 value 8.506089
                                                                  iter  60 value 8.438906
                                                                  iter  70 value 8.409124
                                                                  iter  80 value 8.405577
                                                                  iter  90 value 7.958875
                                                                  iter 100 value 6.943049
                                                                  iter 110 value 6.673702
                                                                  iter 120 value 6.475792
                                                                  iter 130 value 6.464455
                                                                  iter 140 value 6.447116
                                                                  iter 150 value 6.444583
                                                                  final  value 6.443926 
                                                                  converged
                                                                  summary(nn.iris)
                                                                  a 4-2-3 network with 19 weights
                                                                  options were - softmax modelling  decay=5e-04
                                                                  b->h1 i1->h1 i2->h1 i3->h1 i4->h1 
                                                                  3.04   0.43  -0.09  -0.79  -1.89 
                                                                  b->h2 i1->h2 i2->h2 i3->h2 i4->h2 
                                                                  2.40   5.76  14.99 -13.86 -10.02 
                                                                  b->o1 h1->o1 h2->o1 
                                                                  -12.33  31.88  -0.90 
                                                                  b->o2 h1->o2 h2->o2 
                                                                  2.27   1.24   7.79 
                                                                  b->o3 h1->o3 h2->o3 
                                                                  10.06 -33.12  -6.89 
                                                                  library(devtools)
                                                                  source_url('https://gist.githubusercontent.com/Peque/41a9e20d6687f2f3108d/raw/85e14f3a292e126f1454864427e3a189c2fe33f3/nnet_plot_update.r')
                                                                  SHA-1 hash of file is bf3c7b8ac910823b729e3ce73bb6ab5e6955ad3d
                                                                  plot.nnet(nn.iris) # 선의 굵기는 연결선의 가중치 (weight) 에 비례한다
                                                                  Loading required package: scales
                                                                  Loading required package: reshape
                                                                  # 신경망 분석에 대한 시각화 결과는 다음 과정을 통해서도 가능하다(3개의 패키지 를 인스톨 후 plot() 함수를 이용). 
                                                                  # 이 방법은 url로부터 파일을 가져오지 않아도 되므로 위의 방법보다 편리하다.
                                                                  library(clusterGeneration)
                                                                  필요한 패키지를 로딩중입니다: MASS
                                                                  library(scales)
                                                                  library(reshape)
                                                                  plot(nn.iris)
                                                                  # 신경망 모형에 대한 정오분류표(confusion matrix) 
                                                                  table(iris$Species, predict(nn.iris, iris, type="class"))
                                                                  
                                                                  setosa versicolor virginica
                                                                  setosa         50          0         0
                                                                  versicolor      0         49         1
                                                                  virginica       0          0        50
                                                                  # setosa는 50개 모두, versicolor은 50 개 중 49개, virginica는 50개중 49개가 잘 분류되었다.
                                                                  
                                                                  data(infert, package="datasets")
                                                                  str(infert)
                                                                  'data.frame':	248 obs. of  8 variables:
 $ education     : Factor w/ 3 levels "0-5yrs","6-11yrs",..: 1 1 1 1 2 2 2 2 2 2 ...
                                                                  $ age           : num  26 42 39 34 35 36 23 32 21 28 ...
                                                                  $ parity        : num  6 1 6 4 3 4 1 2 1 2 ...
                                                                  $ induced       : num  1 1 2 2 1 2 0 0 0 0 ...
                                                                  $ case          : num  1 1 1 1 1 1 1 1 1 1 ...
                                                                  $ spontaneous   : num  2 0 0 0 1 1 0 0 1 0 ...
                                                                  $ stratum       : int  1 2 3 4 5 6 7 8 9 10 ...
                                                                  $ pooled.stratum: num  3 1 4 2 32 36 6 22 5 19 ...
                                                                  library(neuralnet)
                                                                  net.infert <- neuralnet(case~age+parity+induced+spontaneous, data=infert, hidden=2, err.fct="ce", linear.output=FALSE, likelihood=TRUE)
                                                                  Warning message:
 algorithm did not converge in 1 of 1 repetition(s) within the stepmax 
                                                                  net.infert # p.467 결과가 책과 다름. 일단 통과 (p.472까지)
                                                                  
                                                                  # 0과 100 사이의 난수를 50 개 발생시키고， 제곱근을 취한 값을 결과로 하는 자료를 구축한다
                                                                  library(neuralnet)
                                                                  train.out <- as.data.frame(runif(50,min=0,max=100))
                                                                  train.input <- as.data.frame(runif(50,min=0,max=100))
                                                                  train.output <- sqrt(train.input)
                                                                  train.data <- cbind(train.input, train.output)
                                                                  colnames(train.data) <- c("Input","Output")
                                                                  head(train.data)
                                                                  Input      Output
                                                                  1 60.23831414 7.761334559
                                                                  2 23.13909307 4.810311120
                                                                  3 35.02012538 5.917780444
                                                                  4 10.53790939 3.246214625
                                                                  5 90.50094713 9.513198575
                                                                  6 46.70735106 6.834277655
                                                                  
                                                                  # 1개의 은닉층과 1Q개의 은닉노드를 가지는 신경망모형을 적용한다
                                                                  net.sqrt <- neuralnet(Output~Input,train.data,hidden=10,threshold=0.01)
                                                                  print(net.sqrt)
                                                                  plot(net.sqrt)
                                                                  
                                                                  # 1 ~ 1O 정수값의 제곱을 취하여 검증용 자료(test.data)를 만든 후, 
                                                                  # 이 자료에 대해 compute() 함수를 통해 신경망 모형 (net.sqrt)을 적용하고, 그 결과를 출력한다.
                                                                  test.data <- as.data.frame((1:10)^2)
                                                                  test.out <- compute(net.sqrt, test.data)
                                                                  ls(test.out)
                                                                  [1] "net.result" "neurons"   
                                                                  print(test.out$net.result)
                                                                  [,1]
                                                                  [1,] 0.9053011126
                                                                  [2,] 2.0298476075
                                                                  [3,] 2.9993973702
                                                                  [4,] 3.9985522614
                                                                  [5,] 4.9972990921
                                                                  [6,] 6.0076170955
                                                                  [7,] 6.9938123018
                                                                  [8,] 8.0034570552
                                                                  [9,] 9.0147943179
                                                                  [10,] 9.9555461693
                                                                  net2.sqrt <- neuralnet(Output~Input,train.data,hidden=c(10,8),threshold=0.01)
                                                                  plot(net2.sqrt)
                                                                  
                                                                  
                                                                  p.476
                                                                  3. 의사결정나무 모형
                                                                  
                                                                  # R 패키지 {rpart} 의 rpart() 함수를 이용하여 의사결정 나무 분석을 수행한다. 
                                                                  # rpart는 recursive partitioning and regression tree 의 약어
                                                                  library(rpart)
                                                                  c <- rpart(Species~.,data=iris)
                                                                  c
                                                                  n= 150 
                                                                  
                                                                  node), split, n, loss, yval, (yprob)
* denotes terminal node

1) root 150 100 setosa (0.33333333 0.33333333 0.33333333)  
2) Petal.Length< 2.45 50   0 setosa (1.00000000 0.00000000 0.00000000) *
  3) Petal.Length>=2.45 100  50 versicolor (0.00000000 0.50000000 0.50000000)  
6) Petal.Width< 1.75 54   5 versicolor (0.00000000 0.90740741 0.09259259) *
  7) Petal.Width>=1.75 46   1 virginica (0.00000000 0.02173913 0.97826087) *
  plot(c, compress=T, margin=0.3)
text(c,cex=1.5)
# predict() 함수를 이용하여 새로운 자료에 대해 예측을 수행한다
head(predict(c, newdata=iris, type="class"))
1      2      3      4      5      6 
setosa setosa setosa setosa setosa setosa 
Levels: setosa versicolor virginica
tail(predict(c, newdata=iris, type="class"))
145       146       147       148       149       150 
virginica virginica virginica virginica virginica virginica 
Levels: setosa versicolor virginica

install.packages("rpart.plot")
library(rpart.plot)
prp(c, type=4, extra=2)

ls(c)
[1] "call"                "control"             "cptable"             "frame"               "functions"           "method"              "numresp"            
[8] "ordered"             "parms"               "splits"              "terms"               "variable.importance" "where"               "y"                  
# $cptable은 트리의 크기에 따른 비용-복잡도 모수(cost-complexity parameter)를 제공하며, 교차타당성오차(cross-validation error)를 함께 제공한다.
c$cptable
CP nsplit rel error xerror       xstd
1 0.50      0      1.00   1.17 0.05073460
2 0.44      1      0.50   0.78 0.06118823
3 0.01      2      0.06   0.08 0.02751969
opt <- which.min(c$cptable[,"xerror"])
opt
3 
3 
cp <- c$cptable[opt,"CP"]
cp
[1] 0.01
prune.c <- prune(c, cp = cp)
plot(prune.c)
text(prune.c, use.n=T)

install.packages("party")
library(party)
data(stagec)
str(stagec)
'data.frame':	146 obs. of  8 variables:
  $ pgtime : num  6.1 9.4 5.2 3.2 1.9 4.8 5.8 7.3 3.7 15.9 ...
$ pgstat : int  0 0 1 1 1 0 0 0 1 0 ...
$ age    : int  64 62 59 62 64 69 75 71 73 64 ...
$ eet    : int  2 1 2 2 2 1 2 2 2 2 ...
$ g2     : num  10.26 NA 9.99 3.57 22.56 ...
$ grade  : int  2 3 3 2 4 3 2 3 3 3 ...
$ gleason: int  4 8 7 4 8 7 NA 7 6 7 ...
$ ploidy : Factor w/ 3 levels "diploid","tetraploid",..: 1 3 1 1 2 1 2 3 1 2 ...
# 결측값을 제거 
stagec1 <- subset(stagec, !is.na(g2))
stagec2 <- subset(stagec1, !is.na(gleason))
stagec3 <- subset(stagec2, !is.na(eet))
str(stagec3)
'data.frame':	134 obs. of  8 variables:
  $ pgtime : num  6.1 5.2 3.2 1.9 4.8 3.7 15.9 6.3 2.9 1.5 ...
$ pgstat : int  0 1 1 1 0 1 0 0 1 1 ...
$ age    : int  64 59 62 64 69 73 64 65 58 70 ...
$ eet    : int  2 2 2 2 1 2 2 2 2 2 ...
$ g2     : num  10.26 9.99 3.57 22.56 6.14 ...
$ grade  : int  2 3 2 4 3 3 3 3 4 3 ...
$ gleason: int  4 7 4 8 7 6 7 7 8 8 ...
$ ploidy : Factor w/ 3 levels "diploid","tetraploid",..: 1 1 1 2 1 1 2 2 2 1 ... 
# 모형구축을 위한 훈련용 자료(training data)와 모형의 성능을 검증하기 위한 검증용 자료(test data) 를 70%와 30%로 구성한다
set.seed(1234)
ind <- sample(2, nrow(stagec3), replace=TRUE, prob=c(0.7,0.3))
ind
[1] 1 1 1 1 2 1 1 1 1 1 1 1 1 2 1 2 1 1 1 1 1 1 1 1 1 2 1 2 2 1 1 1 1 1 1 2 1 1 2 2 1 1 1 1 1 1 1 1 1 2 1 1 2 1 1 1 1 2 1 2 2 1 1 1 1 2 1 1 1 1 1 2 1 2 1 1 1 1 1 1 2
[82] 1 1 1 1 2 1 1 1 2 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 1 2 1 2 1 1 2 2 1 1 2 2 2 2 2 1 1 1 1 1 1 2 1 1 1
trainData <- stagec3[ind==1,]
testData <- stagec3[ind==2,]

tree <- ctree(ploidy~.,data=trainData)
tree

Conditional inference tree with 3 terminal nodes

Response:  ploidy 
Inputs:  pgtime, pgstat, age, eet, g2, grade, gleason 
Number of observations:  102 

1) g2 <= 13.01; criterion = 1, statistic = 49.684
2) pgstat <= 0; criterion = 0.958, statistic = 7.5
3)*  weights = 36 
2) pgstat 0
4)*  weights = 15 
1) g2 13.01
5)*  weights = 51 
plot(tree)

testPred = predict(tree, newdata=testData)
table(testPred, testData$ploidy)

testPred     diploid tetraploid aneuploid
diploid         17          0         1
tetraploid       0         13         1
aneuploid        0          0         0

airq <- subset(airquality, !is.na(Ozone))
head(airq)
Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2
3    12     149 12.6   74     5   3
4    18     313 11.5   62     5   4
6    28      NA 14.9   66     5   6
7    23     299  8.6   65     5   7
airct <- ctree(Ozone~.,data=airq)
airct

Conditional inference tree with 5 terminal nodes

Response:  Ozone 
Inputs:  Solar.R, Wind, Temp, Month, Day 
Number of observations:  116 

1) Temp <= 82; criterion = 1, statistic = 56.086
2) Wind <= 6.9; criterion = 0.998, statistic = 12.969
3)*  weights = 10 
2) Wind 6.9
4) Temp <= 77; criterion = 0.997, statistic = 11.599
5)*  weights = 48 
4) Temp 77
6)*  weights = 21 
1) Temp 82
7) Wind <= 10.3; criterion = 0.997, statistic = 11.712
8)*  weights = 30 
7) Wind 10.3
9)*  weights = 7 
# 최종마디(*로 표시된 마디)가 5개인 트리모형 
plot(airq)
plot(airct)
head(predict(airct,data=airq))
Ozone
[1,] 18.47917
[2,] 18.47917
[3,] 18.47917
[4,] 18.47917
[5,] 18.47917
[6,] 18.47917
# 자료가 속하는 해당 최종마디의 번호를 출력하고 싶을 때는 type="node" 옵션을 사용한다
predict(airct, data=airq, type="node")
[1] 5 5 5 5 5 5 5 5 3 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 3 5 6 9 9 6 5 5 5 5 5 8 8 6 8 9 8 8 8 8 5 6 6 3 6 8 8 9 3 8 8 6 9 8 8 8 6 3 6 6 8 8 8 8 8 8 9 6 6 5 3 5 6 6 5 5 6
[82] 3 8 8 8 8 8 8 8 8 8 8 9 6 6 5 5 6 5 3 5 5 3 5 5 5 6 5 5 6 5 5 3 5 5 5
mean((airq$Ozone - predict(airct))^2)
[1] 403.6668


4. 앙상블 모형
# 앙상블(ensemble) 모형은 여러 개의 분류모형에 의한 결과를 종합하여 분류의 정확도를 높이는 방법
install.packages("adabag")
library(adabag)
data("iris")
# 배깅 (bagging) 은 bootstrap aggregating 의 준말
# 원 데이터 집합으로부터 크기가 같은 표본을 여러 번 단순 임의 복원추출하여 
# 각 표본(이를 붓스트램 표본이라 함)에 대해 분류기 (classifiers)를 생성한 후 그 결과를 앙상블하는 방법 
iris.bagging <- bagging(Species~., data=iris, mfinal=10)
iris.bagging$importance
Petal.Length  Petal.Width Sepal.Length  Sepal.Width 
81.36615     18.63385      0.00000      0.00000 
plot(iris.bagging$trees[[10]])
text(iris.bagging$trees[[10]])

pred <- predict(iris.bagging, newdata=iris)
table(pred$class, iris[,5])

setosa versicolor virginica
setosa         50          0         0
versicolor      0         47         2
virginica       0          3        48
str(pred)
List of 6
$ formula  :Class 'formula'  language Species ~ .
.. ..- attr(*, ".Environment")=<environment: R_GlobalEnv
  $ votes    : num [1:150, 1:3] 10 10 10 10 10 10 10 10 10 10 ...
$ prob     : num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
$ class    : chr [1:150] "setosa" "setosa" "setosa" "setosa" ...
$ confusion: 'table' int [1:3, 1:3] 50 0 0 0 47 3 0 2 48
..- attr(*, "dimnames")=List of 2
.. ..$ Predicted Class: chr [1:3] "setosa" "versicolor" "virginica"
.. ..$ Observed Class : chr [1:3] "setosa" "versicolor" "virginica"
$ error    : num 0.0333

# 부스팅 (boosting) 은 배깅의 과정과 유사하나 붓스트랩 표본을 구성하는 재표본(re-sampling) 과정 에서
# 각 자료에 통일한 확률을 부여하는 것이 아니라 분류가 잘못된 데이터에 더 큰 가중을 주어 표본을 추출한다
library(adabag)
data("iris")
boo.adabag <- boosting(Species~., data=iris, boos=TRUE, mfinal=10)
boo.adabag$importance
Petal.Length  Petal.Width Sepal.Length  Sepal.Width 
62.639026    24.293538     5.122784     7.944652 
plot(boo.adabag$trees[[10]])
text(boo.adabag$trees[[10]])
# predict() 함수를 통해 새로운 자료에 대한 분류(예측)를 수행 할 수 있다. 
# 그 결과 setosa, versicolor, virginica 모두 정확히 분류되었음
pred <- predict(boo.adabag, newdata=iris)
tb <- table(pred$class, iris[,5])
tb

setosa versicolor virginica
setosa         50          0         0
versicolor      0         50         0
virginica       0          0        50
# 오분류율   
error.rpart <- 1-(sum(diag(tb))/sum(tb))
error.rpart
[1] 0

install.packages("ada")
library(ada)
data(iris)
iris[iris$Species!="setosa",]->iris # setosa를 제외
n <- dim(iris)[1]
# 100개의 자료를 60 개의 훈련용 자료 (training d ata)와 검증용 자료(testing data)로 나누었다.
trind <- sample(1:n, floor(.6*n), FALSE)
teind <- setdiff(1:n, trind)
n
[1] 100
iris[,5] <- as.factor((levels(iris[,5])[2:3])[as.nemeric(iris[,5])-1])
Error in as.nemeric(iris[, 5]) : could not find function "as.nemeric"
iris[,5] <- as.factor((levels(iris[,5])[2:3])[as.numeric(iris[,5])-1])
gdis <- ada(Species~., data=iris[trind,], iter=20, nu=1, type="discrete")
gdis <- addtest(gdis, iris[teind,-5], iris[teind, 5])
gids
Error: object 'gids' not found
gdis
Call:
  ada(Species ~ ., data = iris[trind, ], iter = 20, nu = 1, type = "discrete")

Loss: exponential Method: discrete   Iteration: 20 

Final Confusion Matrix for Data:
  Final Prediction
True value   versicolor virginica
versicolor         31         0
virginica           0        29

Train Error: 0 

Out-Of-Bag Error:  0.017  iteration= 20 

Additional Estimates of number of iterations:
  
  train.err1 train.kap1 test.errs2 test.kaps2 
15         15          4          4 
# plot() 함수는 오차와 일치도를 나타내는 카파( kappa) 계수를 그려준다. 
# 두 개의 TRUE 옵션은 훈련용, 검증용 자료 모두에 대해 그림을 그려준다.
plot(gdis, TRUE, TRUE)
varplot(gdis) # varplot() 함수는 변수의 중요도(importance)를 나타내는 그림을 제공한다
pairs(gdis, iris[trind,-5], maxvar=4)

# 랜덤포레스트(randorn forest)는 배깅에 랜덤 과정을 추가한 방법이다
install.packages("randomForest")
library(randomForest)
library(rpart)
data(stagec)
stagec3 <- stagec[complete.cases(stagec),]
?complete.cases
set.seed(1234)
ind <- sample(2, nrow(stagec3), replace=TRUE, prob=(0.7,0.3))
Error: unexpected ',' in "ind <- sample(2, nrow(stagec3), replace=TRUE, prob=(0.7,"
ind <- sample(2, nrow(stagec3), replace=TRUE, prob=c(0.7,0.3))
trainData <- stagec3[ind==1,]
testData <- stagec3[ind==2,]
rf <- randomForest(ploidy~., data=trainData, ntree=100, proximity=TRUE)
table(predict(rf), trainData$ploidy)

diploid tetraploid aneuploid
diploid         45          0         3
tetraploid       1         51         0
aneuploid        2          0         0
print(rf) # 정오분류표(confusion matrix)와 함께, 오류율에 대한 OOB(out-of-bag) 추정치를 제공 (붓스트램 샘플과정에서 제외된(out-of-bag) 자료)
Call:
  randomForest(formula = ploidy ~ ., data = trainData, ntree = 100,      proximity = TRUE) 
Type of random forest: classification
Number of trees: 100
No. of variables tried at each split: 2

OOB estimate of  error rate: 5.88%
Confusion matrix:
  diploid tetraploid aneuploid class.error
diploid         45          1         2      0.0625
tetraploid       0         51         0      0.0000
aneuploid        3          0         0      1.0000
plot(rf)
# importance()와 varImpPlot() 로 변수의 중요성을 알 수 있다.
importance(rf)
MeanDecreaseGini
pgtime         4.6800225
pgstat         2.0635061
age            3.5726107
eet            0.7875501
g2            37.5032896
grade          1.2084410
gleason        2.0820408
varImpPlot(rf)
rf.pred <- predict(rf, newdata=testData)
table(rf.pred, testData$ploidy)

rf.pred      diploid tetraploid aneuploid
diploid         17          0         1
tetraploid       0         13         1
aneuploid        0          0         0
# 마진 (margin)은 랜덤포레스트의 분류기(classifiers) 가운데 정분류를 수행한 비율에서 다른 클래스로 분류한 비율의 최대치를 뺀 값을 나타낸다.
# 즉, 양(positive)의 마진은 정확한 분류를 의미하며, 음(negative)은 그 반대이다.
plot(margin(rf))
# 랜덤포레스트는 다음과 같이 R 패키지 {party} 의 cforest() 합수를 이용할 수도 있다.
set.seed(1234)
cf <- cforest(ploidy~., data=trainData)
cf.pred <- predict(cf, newdata=testData, OOB=TRUE, type="response")

# 흘드아웃(hold-out) 방법은 주어진 원천 데이터를 랜덤하게 두 분류로 분리하여 교차 검정을 실시하는 방법으로 
# 하나는 모형의 학습 및 구축을 위한 훈련용 자료로 하나는 성과 평가를 위한 검증용 자료로 사용한다.
data(iris)
nrow(iris)
[1] 150
set.seed(1234)
idx <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[idx==1,]
testData <- iris[idx==2,]
idx
[1] 1 1 1 1 2 1 1 1 1 1 1 1 1 2 1 2 1 1 1 1 1 1 1 1 1 2 1 2 2 1 1 1 1 1 1 2 1 1 2 2 1 1 1 1 1 1 1 1 1 2 1 1 2 1 1 1 1 2 1 2 2 1 1 1 1 2 1 1 1 1 1 2 1 2 1 1 1 1 1 1 2
[82] 1 1 1 1 2 1 1 1 2 1 2 1 1 1 1 1 1 1 2 1 1 1 1 1 1 1 1 1 1 2 1 2 1 1 2 2 1 1 2 2 2 2 2 1 1 1 1 1 1 2 1 1 1 2 1 2 1 1 2 1 2 1 1 1 1 2 1 2 1
nrow(trainData)
[1] 112
nrow(testData)
[1] 38

교차검증은 주어진 데이터 를 가지고 반복적으로 성 과를 측정하여 그 결과를 명균한 것으로 분류 분석
모형을 평가하는 방법이다. 대표적인 기법인 k - fold 교차검증은 전체 데이터를 사이즈가 동일한 k개의 하부
집합(subset) 으로 나누고 k번째의 하부집합을 검증용 자료로， 나머지 k-1개의 하부집합을 훈련용 자료로
사용한다. 이를 k번 반복 측정하고 각각의 반복측정 결과를 명균 낸 값을 최종 명가로 사용한다.
data(iris)
nrow(iris)
[1] 150
set.seed(1234)
idx <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[idx==1,]
testData <- iris[idx==2,]
nrow(trainData)
[1] 112
nrow(testData)
[1] 38

  
  data("iris")
set.seed(1234)
k = 10
iris <- iris[sample(nrow(iris)),] # Randomly shuffle the data 
folds <- cut(seq(1,nrow(iris)), breaks=k, labels=FALSE)
trainData=list(0)
testData=list(0)
for (i in 1:k) {}
for (i in 1:k) {}
for (i in 1:k) { 
  +     testIdx <- which(folds==i, arr.ind=TRUE)
  +     testData[[i]] <- iris[testIdx,]
  +     trainData[[i]] <- iris[-testIdx,]
  +     }
head(trainData[[1]])
Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
114          5.7         2.5          5.0         2.0 virginica
39           4.4         3.0          1.3         0.2    setosa
36           5.0         3.2          1.2         0.2    setosa
25           4.8         3.4          1.9         0.2    setosa
31           4.8         3.1          1.6         0.2    setosa
42           4.5         2.3          1.3         0.3    setosa
head(testData[[2]])
Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
114          5.7         2.5          5.0         2.0 virginica
39           4.4         3.0          1.3         0.2    setosa
36           5.0         3.2          1.2         0.2    setosa
25           4.8         3.4          1.9         0.2    setosa
31           4.8         3.1          1.6         0.2    setosa
42           4.5         2.3          1.3         0.3    setosa

iris <-subset(iris, Species == "setosa" | Species == "versicolor")
iris$Species <- factor(iris$Species)
set.seed(1234)
iris <- iris[sample(nrow(iris)),]
trainData <- iris[1:(nrow(iris)*0.7),]
testData <- iris[((nrow(iris)*0.7)+1):nrow(iris),]
nrow(trainData)
[1] 70
library(nnet)
library(rpart)
nn.iris <- nnet(Species~., data=trainData, size=2, rang=0.1, decay=5e-4, maxit=200)
# weights:  13
initial  value 48.399646 
iter  10 value 1.154130
iter  20 value 0.430537
iter  30 value 0.328848
iter  40 value 0.206724
iter  50 value 0.193359
iter  60 value 0.189328
iter  70 value 0.184876
iter  80 value 0.178340
iter  90 value 0.172773
iter 100 value 0.168848
iter 110 value 0.144970
iter 120 value 0.131006
iter 130 value 0.109160
iter 140 value 0.103257
iter 150 value 0.102342
iter 160 value 0.102245
iter 170 value 0.102218
iter 180 value 0.102188
iter 190 value 0.102168
iter 200 value 0.102168
final  value 0.102168 
stopped after 200 iterations
dt.iris <- rpart(Species~., data=trainData)
nn_pred <- predict(nn.iris, testData, type="class")
dt_pred <- predict(dt.iris, testData, type="class")
install.packages("e1071")
library(caret)
nn_con = confusionMatrix(nn_pred, testData$Speceis) # ??? 
Error: `data` and `reference` should be factors with the same levels.
dt_con = confusionMatrix(dt_pred, testData$Speceis) # ??? 
Error: `data` and `reference` should be factors with the same levels.

accuracy <- c(nn_con$overall['Accuracy'], dt_con$overall['Accuracy'])
precision <- c(nn_con$byClass['Pos Pred Value'] , dt_con$byClass[Pos Pred Value'])
recall <- c(nn_con$byClass['Sensitivity'], dt_con$byClass [Sensitivity])
f1 <- 2 * (( precision * recall ) / (precision + recall ))
result <- data.frame (rbind(accuracy , precision , recall, f1) )
names(result ) <- c("Nueral Network", "Decision Tree")
result


나. ROC 그래프

set.seed(1234)
infert <- infert[sample(nrow(infert)),]
infert <- infert[,c("age","parity","induced","spontaneous","case")]
trainData <- infert[1:(nrow(infert)*0.7),]
testData <- infert[((nrow(infert)*0.7)+1):nrow(infert),]
library(neuralnet)
net.infert <- neuralnet(case~age+parity+induced+spontaneous, data=trainData, hidden=3, err.fct="ce", linear.outpu=FALSE, likelihood=TRUE)
n_test <- subset(testData, select=-case)
nn_pred <- compute(net.infert, n_test)
testData$net_pred <- nn_pred$net.result
head(testData)
age parity induced spontaneous case      net_pred
164  29      1       0           1    0 0.60085711017
199  32      2       2           0    0 0.30853793595
223  28      2       1           0    0 0.30640076235
133  38      3       1           0    0 0.06823728009
40   28      1       0           1    1 0.60080163992
225  27      2       1           0    0 0.30640076176
install.packages("C50")
library(C50)
trainData$case <- factor(trainData$case)
dt.infert <- C5.0(case~age+parity+induced+spontaneous, data=trainData)
testData$dt_pred <- predict(dt.infert, testData, type="prob")[,2]
head(testData)
age parity induced spontaneous case      net_pred      dt_pred
164  29      1       0           1    0 0.60085711017 0.6240261275
199  32      2       2           0    0 0.30853793595 0.2015895955
223  28      2       1           0    0 0.30640076235 0.2015895955
133  38      3       1           0    0 0.06823728009 0.2015895955
40   28      1       0           1    1 0.60080163992 0.6240261275
225  27      2       1           0    0 0.30640076176 0.2015895955

install.packages("Epi")
library(Epi)
neural_ROC <- ROC(form=case~net_pred, data=testData, plot="ROC")
dtree_ROC <- ROC(form=case~dt_pred, data=testData, plot="ROC")

install.packages("ROCR")
library(ROCR)
n_r <- prediction(testData$net_pred, testData$case)
d_r <- prediction(testData$dt_pred, testData$case)
n_p <- performance(n_r, "tpr", "fpr")
d_p <- performance(d_r, "tpr", "fpr")
plot(n_p, col="red")
abline(a=0, b=1)

n_lift <- performance(n_r, "lift", "rpp")
plot(n_lift, col="red")
abline(v=0.2)


제3절 군집 분석

data(USArrests)
str(USArrests)
'data.frame':	50 obs. of  4 variables:
$ Murder  : num  13.2 10 8.1 8.8 9 7.9 3.3 5.9 15.4 17.4 ...
$ Assault : int  236 263 294 190 276 204 110 238 335 211 ...
$ UrbanPop: int  58 48 80 50 91 78 77 72 80 60 ...
$ Rape    : num  21.2 44.5 31 19.5 40.6 38.7 11.1 15.8 31.9 25.8 ...
d <- dist(USArrests, method="euclidean") # 거리 (또는 비유사성)행렬 
fit <- hclust(d, method="ave") # 계층적 군집 분석 
par(mfrow=c(1,2))
plot(fit)
plot(fit, hang=-1)
par(mfrow=c(1,1))

# cutree()는 계층적군집의 결과를 이용하여 tree 의 높이 (h) 나 그룹의 수(k)를 옵션으로 지정하여 원하는 수의 그룹으로 나눌 수 있다.
groups <- cutree(fit, k=6)
groups
Alabama         Alaska        Arizona       Arkansas     California       Colorado    Connecticut       Delaware        Florida        Georgia         Hawaii 
1              1              1              2              1              2              3              1              4              2              5 
Idaho       Illinois        Indiana           Iowa         Kansas       Kentucky      Louisiana          Maine       Maryland  Massachusetts       Michigan 
3              1              3              5              3              3              1              5              1              6              1 
Minnesota    Mississippi       Missouri        Montana       Nebraska         Nevada  New Hampshire     New Jersey     New Mexico       New York North Carolina 
5              1              2              3              3              1              5              6              1              1              4 
North Dakota           Ohio       Oklahoma         Oregon   Pennsylvania   Rhode Island South Carolina   South Dakota      Tennessee          Texas           Utah 
5              3              6              6              3              6              1              5              2              2              3 
Vermont       Virginia     Washington  West Virginia      Wisconsin        Wyoming 
5              6              6              5              5              6 


plot(fit)
rect.hclust(fit, k=6, border="red")
hca <- hclust(dist(USArrests))
plot(hca)
rect.hclust(hca, k=3, border"red")
Error: unexpected string constant in "rect.hclust(hca, k=3, border"red""
rect.hclust(hca, k=3, border="red")
rect.hclust(hca, h=50, which=c(2,7), border=3:4)


# ??????????????????
library(cluster)
agn1 <- agnes(USArrests, metric="manhattan", stand=TRUE)
agn1
Call:	 agnes(x = USArrests, metric = "manhattan", stand = TRUE) 
Agglomerative coefficient:  0.7584534729 
Order of objects:
[1] Alabama        Tennessee      Georgia        Louisiana      Mississippi    South Carolina North Carolina Alaska         Arizona       
[10] Maryland       New Mexico     Michigan       Illinois       New York       Texas          Florida        California     Colorado      
[19] Nevada         Arkansas       Idaho          Nebraska       Kentucky       Montana        Indiana        Kansas         Oklahoma      
[28] Ohio           Pennsylvania   Virginia       Wyoming        Delaware       Missouri       Oregon         Washington     Connecticut   
[37] Utah           Hawaii         Massachusetts  New Jersey     Rhode Island   Iowa           New Hampshire  Maine          Minnesota     
[46] Wisconsin      North Dakota   Vermont        South Dakota   West Virginia 
Height (summary):
Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.3718103 1.5668819 2.0340726 2.3765539 2.9197634 7.3157290 

Available components:
[1] "order"     "height"    "ac"        "merge"     "diss"      "call"      "method"    "order.lab" "data"     
par(mfrow=c(1,2))
plot(agn1)
agn2 <- agnes(daisy(USArrests), diss=TRUE, method="complete")
plot(agn2)
agn3 <- agnes(USArrests, method="flexible", par.meth=0.6)
plot(agn3)
par(mfrow=c(1,1))

# data는 수치형의 자료이며. nc는 고려할 군집의 최대 수. seed는 난수 발생 초기값이다 
wssplot <- function(data, nc=15, seed=1234) {
+     wss <- (nrow(data)-1)*sum(apply(data,2,var))
+     for (i in 2:nc) {
+         set.seed(seed)
+         wss[i] <- sum(kmeans(data, centers=i)$withinss)
+     }
+     plot(1:nc, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")
+ }

# rattle, wine 못찾겠음 
data(wine, package="rattle")
head(wine)
df <- scale(wine[-1]) # 표준화를 수행 
wssplot(df) # 적절한 군집 수를 정하기 위해 앞서 소개된 wssplot() 함수를 수행한다

install.packages("NbClust")
library(NbClust)
set.seed(1234)
table(nc$Best.n[1,])
Error in table(nc$Best.n[1, ]) : object 'nc' not found
barplot(table(nc$Best.n[1,]), 
+     xlab="Number of Cluster", ylab="Number of Criteria",
+     main="Number of Cluster Chosen by 26 Criteria"
+ )
Error in table(nc$Best.n[1, ]) : object 'nc' not found

set.seed(1234)
fit.km <- kmeans(df, 3, nstart=25)
fit.km$size 
fit.km$centers
plot(df, col=fit.km$cluster)
points(fit,km$center, col=1:3, pch=8, cex=1.5)

aggregate(wine[-1], by=list(cluster=fit.km$cluster), mean) 
ct.km <- table(wine$Type, fit.km$cluster)
ct.km 

library (flexclust)
# 실제 와인의 종류(Type)와 군집간의 일치도 (agreement)를 나타내는 수정된 순위 지수(adjusted rank index)
# 이 지수는 -l(no agreement)과 l (perfect agreement) 사이의 값
randlndex( ct.km) 
ARI
0.897495

library(flexclust)
data("Nclus")
plot(Nclus)
cl <- kcca (Nclus, k=4, family=kccaFamily("kmeans"))
image(cl)
points(Nclus)

barplot(cl)
stripes(cl)

library(cc1ust)
c1.1 <- cc1ust(Nc1us, 4, 20, method="kmeans")
p1ot(Nclus, col=cl.1$cluster) 
points (c1.1$center, c01 = 1:4, pch = 8, cex=1.5)

library(cluster)
clusplot(Nclus, cl.1$cluster)

# 미국의 올드페이스풀 간헐천의 분출 간의 시간 자료(faithful) 에 대해 정규혼합분포모형을 적합한다.
install.packages("mixtools")
library(mixtools)
data(faithful)
attach(faithful)
hist(waiting, main="Time between Old Faithful eruptions", xlab="Minutes", ylab="", cex.main=1.5, cex.lab=1.5, cex.axis=1.4)

# EM 알고리즘을 이용한 정규혼합분포의 추정결과는 다음과 같다.
wait1 <- normalmixEM(waiting, lambda=.5, mu=c(55,80), sigma=5)
number of iterations= 9 
summary(wait1)
summary of normalmixEM object:
comp 1   comp 2
lambda  0.36085  0.63915
mu     54.61364 80.09031
sigma   5.86909  5.86909
loglik at estimate:  -1034.002 
# 추정된 정규혼합분포를 시각화 
plot(wait1, density=TRUE, cex.axis=1.4, cex.lab=1.4, cex.main=1.8, main2="Time between Old Faithful eruptions", xlab2="Minutes")

# iris 자료에 대해 Mclust() 함수를 통해 군집 분석을 수행 
install.packages("mclust")
Installing package into ‘C:/Users/juno2/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/mclust_5.4.zip'
Content type 'application/zip' length 4129221 bytes (3.9 MB)
downloaded 3.9 MB

package ‘mclust’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\juno2\AppData\Local\Temp\RtmpOoYJJt\downloaded_packages
library(mclust)
__  ___________    __  _____________
/  |/  / ____/ /   / / / / ___/_  __/
/ /|_/ / /   / /   / / / /\__ \ / /   
/ /  / / /___/ /___/ /_/ /___/ // /    
/_/  /_/\____/_____/\____//____//_/    version 5.4
Type 'citation("mclust")' for citing this R package in publications.
mc <- Mclust(iris[,1:4], G=3)
fitting ...
|==============================================================================================================================================================| 100%
summary(mc, parameters=TRUE)
----------------------------------------------------
Gaussian finite mixture model fitted by EM algorithm 
----------------------------------------------------

Mclust VEV (ellipsoidal, equal shape) model with 3 components:

log.likelihood   n df       BIC       ICL
-186.074 150 38 -562.5522 -566.4673

Clustering table:
1  2  3 
50 45 55 

Mixing probabilities:
1         2         3 
0.3333333 0.3005423 0.3661243 

Means:
[,1]     [,2]     [,3]
Sepal.Length 5.006 5.915044 6.546807
Sepal.Width  3.428 2.777451 2.949613
Petal.Length 1.462 4.204002 5.482252
Petal.Width  0.246 1.298935 1.985523

Variances:
[,,1]
Sepal.Length Sepal.Width Petal.Length Petal.Width
Sepal.Length   0.13320850  0.10938369  0.019191764 0.011585649
Sepal.Width    0.10938369  0.15495369  0.012096999 0.010010130
Petal.Length   0.01919176  0.01209700  0.028275400 0.005818274
Petal.Width    0.01158565  0.01001013  0.005818274 0.010695632
[,,2]
Sepal.Length Sepal.Width Petal.Length Petal.Width
Sepal.Length   0.22572159  0.07613348   0.14689934  0.04335826
Sepal.Width    0.07613348  0.08024338   0.07372331  0.03435893
Petal.Length   0.14689934  0.07372331   0.16613979  0.04953078
Petal.Width    0.04335826  0.03435893   0.04953078  0.03338619
[,,3]
Sepal.Length Sepal.Width Petal.Length Petal.Width
Sepal.Length   0.42943106  0.10784274   0.33452389  0.06538369
Sepal.Width    0.10784274  0.11596343   0.08905176  0.06134034
Petal.Length   0.33452389  0.08905176   0.36422115  0.08706895
Petal.Width    0.06538369  0.06134034   0.08706895  0.08663823

# plot.Mclust() 함수는 다양한 방식으로 군집 결과를 시각화 
plot.Mclust(mc)
Model-based clustering plots: 

1: BIC
2: classification
3: uncertainty
4: density

선택: 2

선택: 
Enter an item from the menu, or 0 to exit
선택: 0
str(mc)
List of 15
$ call          : language Mclust(data = iris[, 1:4], G = 3)
$ data          : num [1:150, 1:4] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
..- attr(*, "dimnames")=List of 2
.. ..$ : NULL
.. ..$ : chr [1:4] "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width"
$ modelName     : chr "VEV"
$ n             : int 150
$ d             : int 4
$ G             : int 3
$ BIC           : 'mclustBIC' num [1, 1:14] -879 -854 -813 -779 -798 ...
..- attr(*, "dimnames")=List of 2
.. ..$ : chr "3"
.. ..$ : chr [1:14] "EII" "VII" "EEI" "VEI" ...
..- attr(*, "G")= num 3
..- attr(*, "modelNames")= chr [1:14] "EII" "VII" "EEI" "VEI" ...
..- attr(*, "control")=List of 4
.. ..$ eps     : num 2.22e-16
.. ..$ tol     : num [1:2] 1.00e-05 1.49e-08
.. ..$ itmax   : int [1:2] 2147483647 2147483647
.. ..$ equalPro: logi FALSE
..- attr(*, "initialization")=List of 3
.. ..$ hcPairs: 'hc' num [1:2, 1:149] 102 143 128 139 18 41 1 18 1 28 ...
.. .. ..- attr(*, "initialPartition")= num [1:150] 1 2 3 4 5 6 7 8 9 10 ...
.. .. .. ..- attr(*, "unique")= int 150
.. .. ..- attr(*, "dimensions")= int [1:2] 150 4
.. .. ..- attr(*, "modelName")= chr "VVV"
.. .. ..- attr(*, "call")= language hc(data = data, modelName = mclust.options("hcModelNames")[1])
.. ..$ subset : NULL
.. ..$ noise  : NULL
..- attr(*, "warn")= logi FALSE
..- attr(*, "n")= int 150
..- attr(*, "d")= int 4
..- attr(*, "oneD")= logi FALSE
..- attr(*, "criterion")= chr "BIC"
..- attr(*, "returnCodes")= num [1, 1:14] 0 0 0 0 0 0 0 0 0 0 ...
.. ..- attr(*, "dimnames")=List of 2
.. .. ..$ : chr "3"
.. .. ..$ : chr [1:14] "EII" "VII" "EEI" "VEI" ...
$ bic           : num -563
$ loglik        : num -186
$ df            : num 38
$ hypvol        : num NA
$ parameters    :List of 4
..$ pro     : num [1:3] 0.333 0.301 0.366
..$ mean    : num [1:4, 1:3] 5.006 3.428 1.462 0.246 5.915 ...
.. ..- attr(*, "dimnames")=List of 2
.. .. ..$ : chr [1:4] "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width"
.. .. ..$ : NULL
..$ variance:List of 7
.. ..$ modelName  : chr "VEV"
.. ..$ d          : int 4
.. ..$ G          : int 3
.. ..$ sigma      : num [1:4, 1:4, 1:3] 0.1332 0.1094 0.0192 0.0116 0.1094 ...
.. .. ..- attr(*, "dimnames")=List of 3
.. .. .. ..$ : chr [1:4] "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width"
.. .. .. ..$ : chr [1:4] "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width"
.. .. .. ..$ : NULL
.. ..$ scale      : num [1:3] 0.0375 0.0579 0.1142
.. ..$ shape      : num [1:4] 6.858 1.012 0.627 0.23
.. ..$ orientation: num [1:4, 1:4, 1:3] -0.6691 -0.7341 -0.0965 -0.0636 0.5979 ...
.. .. ..- attr(*, "dimnames")=List of 3
.. .. .. ..$ : chr [1:4] "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width"
.. .. .. ..$ : chr [1:4] "Sepal.Length" "Sepal.Width" "Petal.Length" "Petal.Width"
.. .. .. ..$ : NULL
..$ Vinv    : NULL
$ z             : num [1:150, 1:3] 1 1 1 1 1 1 1 1 1 1 ...
..- attr(*, "dimnames")=List of 2
.. ..$ : NULL
.. ..$ : NULL
$ classification: num [1:150] 1 1 1 1 1 1 1 1 1 1 ...
$ uncertainty   : num [1:150] 0 0 0 0 0 0 0 0 0 0 ...
- attr(*, "class")= chr "Mclust"
mc$classification
[1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 2 3 2 3 2 2 2 2 3 2 2 2
[82] 2 2 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3

# 새로운 자료에 대한 분류는 predict() 함수를 이용 
predict(mc, data= )

install.packages("kohonen")
library(kohonen)
data(wines)
str(wines)
num [1:177, 1:13] 13.2 13.2 14.4 13.2 14.2 ...
- attr(*, "dimnames")=List of 2
..$ : NULL
..$ : chr [1:13] "alcohol" "malic acid" "ash" "ash alkalinity" ...
head(wines)
alcohol malic acid  ash ash alkalinity magnesium tot. phenols flavonoids non-flav. phenols proanth col. int. col. hue OD ratio proline
[1,]   13.20       1.78 2.14           11.2       100         2.65       2.76              0.26    1.28      4.38     1.05     3.40    1050
[2,]   13.16       2.36 2.67           18.6       101         2.80       3.24              0.30    2.81      5.68     1.03     3.17    1185
[3,]   14.37       1.95 2.50           16.8       113         3.85       3.49              0.24    2.18      7.80     0.86     3.45    1480
[4,]   13.24       2.59 2.87           21.0       118         2.80       2.69              0.39    1.82      4.32     1.04     2.93     735
[5,]   14.20       1.76 2.45           15.2       112         3.27       3.39              0.34    1.97      6.75     1.05     2.85    1450
[6,]   14.39       1.87 2.45           14.6        96         2.50       2.52              0.30    1.98      5.25     1.02     3.58    1290
wines.sc <- scale(wines)
set.seed(7)
wine.som <- som(data=wines.sc,
+ grid = somgrid(5,4, "hexagonal"),
+ rlen = 100, alpha = c(0.05, 0.01), 
+ toroidal = FALSE, keep.data = TRUE)
Error in supersom(list(X), ...) : unused argument (toroidal = FALSE)
wine.som <- som(data = wines.sc, grid = somgrid (5, 4, "hexagonal"), rlen = 100, alpha = c(0.05 , 0.01), toroidal = FALSE, keep.data = TRUE)
Error in supersom(list(X), ...) : unused argument (toroidal = FALSE)
plot(wine.som, main = "Wine data") 
summary(wine.som) 

par(mfrow = c(1, 3))
plot(wine.som, type = "counts", main = "wine data: counts")
plot(wine.som, type = "quality", main = "wine data: mapping quality")
plot(wine.som, type="mapping", labels=wine.classes, col=wine.classes, main= "mapping plot")

par(mfrow = c(1 , 3))
>
colour1 <- tricolor(wine.som$grid)
plot(wine.som, "mapping" , bg = rgb(colour1))
>
colour2 <- tricolor(wine.som$grid, phi = c(pi/6, 0, -pi/6))
plot(wine.som, "mapping", bg = rgb(colour2))
>
colour3 <- tricolor(wine.som$grid, phi = c(pi/6, 0, -pi/6 ), offset = .5)
plot(wine.som, "mapping", bg = rgb(colour3))

unit.distances(grid, toroidal) # SOM 군집 분석 결과， 유니트 사이의 거리 계산법 

par(mfrow = c(1 , 2))
>
dists <- unit.distances(wine.som$grid, toroidal=FALSE)
plot(wine.som, type="property", property=dists[1,],
+ main="Distances to unit 1" , zlim=c(0, 6) ,
+ palette = rainbow, ncolors = 7, contin = TRUE)
>
dists <- unit.distances(wine.som$grid, toroidal=FALSE )
plot(wine.som, type="property", property=dists[1,],
+ main="Distances to unit 1", zlim=c(0,2),
+ palette = rainbow, ncolors = 2, contin = TRUE )

data("wines")
wines.sc <- scale(wines)

set.seed(7)

wine.som <- som(data=wines.sc, 
+ grid = somgrid(5,4,"hexagonal"), 
+ rlen = 100, 
+ alpha = c(0.05, 0.01), 
+ toroidal = FALSE, keep.data = TRUE)

wine.som_1 <- som(data = wines.sc, 
+ grid = somgrid(5,4,"hexagonal"), 
+ rlen = 500, 
+ alpha = c(0.05, 0.01), 
+ toroidal = FALSE, keep.data = TRUE) 

par(mfrow = c(1,2))

plot(wine.som, type = "changes", main = "Wine data : SOM(Learning no=100")
plot(wine.som_1, type = "changes", main = "Wine data : SOM(Learning no=500") 

library(ggplot2)
wines.sc = as.data.frame(wines)
wines.sc$clusterX <- wine.som$grid$pts[wine.som$unit.classif, "x"]
wines.sc$clusterY <- wine.som$grid$pts[wine.som$unit.classif, "y"]

p <- ggplot(wines.sc, aes(clusterX, clusterY))
p+geom_jitter(position=position_jitter(width=0.4, height=0.3))

# arules 패키지의 apriori 함수를 사용하면 연관규칙을 발굴해낼 수 있다.
데이터
install.packages("arules")
library(arules)
data("Adult")
Adult
transactions in sparse format with
48842 transactions (rows) and
115 items (columns)
rules <- apriori(Adult)
Apriori

Parameter specification:
confidence minval smax arem  aval originalSupport maxtime support minlen maxlen target   ext
0.8    0.1    1 none FALSE            TRUE       5     0.1      1     10  rules FALSE

Algorithmic control:
filter tree heap memopt load sort verbose
0.1 TRUE TRUE  FALSE TRUE    2    TRUE

Absolute minimum support count: 4884 

set item appearances ...[0 item(s)] done [0.00s].
set transactions ...[115 item(s), 48842 transaction(s)] done [0.05s].
sorting and recoding items ... [31 item(s)] done [0.01s].
creating transaction tree ... done [0.04s].
checking subsets of size 1 2 3 4 5 6 7 8 9 done [0.14s].
writing ... [6137 rule(s)] done [0.00s].
creating S4 object  ... done [0.01s].

inspect(head(rules)) # inspect 함수를 사용하면 apriori 함수를 통해 발굴된 규칙을 보여준다.
lhs                         rhs                            support   confidence lift     count
[1] {}                       ={race=White}                   0.8550428 0.8550428  1.000000 41762
[2] {}                       ={native-country=United-States} 0.8974243 0.8974243  1.000000 43832
[3] {}                       ={capital-gain=None}            0.9173867 0.9173867  1.000000 44807
[4] {}                       ={capital-loss=None}            0.9532779 0.9532779  1.000000 46560
[5] {relationship=Unmarried} ={capital-loss=None}            0.1019819 0.9719024  1.019537  4981
[6] {occupation=Sales}       ={race=White}                   0.1005282 0.8920785  1.043314  4910

adult.rules <- apriori(Adult, parameter=list(support=0.1, confidence=0.6),
+                         appearance = list(rhs=c('income=small', 'income=large'),
+                                             default='lhs'),
+                         control=list(verbose=F))
adult.rules.sorted <- sort(adult.rules, by='lift')
inspect(head(adult.rules.sorted))
lhs          rhs            support   confidence lift     count
[1] {age=Young,workclass=Private,capital-loss=None}                              ={income=small} 0.1005282 0.6633342  1.310622 4910 
[2] {age=Young,workclass=Private}                                                ={income=small} 0.1025961 0.6630938  1.310147 5011 
[3] {age=Young,marital-status=Never-married,capital-gain=None,capital-loss=None} ={income=small} 0.1060563 0.6616426  1.307279 5180 
[4] {age=Young,marital-status=Never-married,capital-gain=None}                   ={income=small} 0.1084517 0.6609683  1.305947 5297 
[5] {relationship=Own-child,capital-loss=None}                                   ={income=small} 0.1000983 0.6604972  1.305016 4889 
[6] {relationship=Own-child}                                                     ={income=small} 0.1023914 0.6596755  1.303393 5001 

install.packages("arulesViz") 
library(arulesViz)
plot(adult.rules.sorted, method="scatterplot")
plot(adult.rules.sorted, method="graph", control=list(type="items", alpha=0.5))


