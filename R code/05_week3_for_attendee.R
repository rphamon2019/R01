#### .=========.####
#### | [[ Week 3 ]] ####
#### .=========.####

# 하나씩 실행시키세요.
install.packages("lubridate")
install.packages("reshape2")
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")
install.packages("ggExtra")
install.packages("ggparallel")
install.packages("psych")
install.packages("corrplot")
install.packages("GGally")
# install.packages("BiocManager")
# BiocManager::install("genefilter")
# install.packages("clusterSim")
install.packages("MASS")
install.packages("nortest")
install.packages("moments")
install.packages("datasauRus")

library("lubridate")
library("reshape2")
library("dplyr")
library("data.table")
library("ggplot2")
library("ggExtra")
library("ggparallel")
library("psych")
library("corrplot")
library("GGally")
# library("clusterSim")
library("MASS")
library("nortest")
library("moments")
library("datasauRus")

#### 1. 2주차 복습 ####
#숫자값 날짜를 날짜형식으로 변환
as.Date(10, origin = "1900-01-01")
as.Date(43370, origin = "1900-01-01")

#### 2. R려줘! 보여줘! 데이터 시각화 ####
#### __ [09] 축 설정 ####
#### ____ ● 여백 조정 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)


# 기본 그래프 
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity")

ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_col() # geom_bar(stat = "identity") 와 동일


# 그래프 1
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") +
  scale_x_discrete(expand = c(0.01, 0.01)) # X축 좌우 여백 

# 그래프 2
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") +
  scale_x_discrete(expand = c(0.5, 0.5)) # X축 좌우 여백 


# 그래프 3
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(expand = c(0.01, 0.01)) # Y축 상하 여백 

# 그래프 4
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") +
  scale_y_continuous(expand = c(0.5, 0.5)) # Y축 상하 여백 

#### ____ ● 최대, 최소값 설정 ####
# 그래프 1
ggplot(data = bar_df, 
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2)

# 그래프 2
bar_df 

ggplot(data = bar_df, 
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2) + 
  scale_x_continuous(limits = c(5, 10)) # X축(obs) 데이터 5-10 사이가 아닌 4건이 그래프에서 제외됨

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(limits = c(20, 80)) # Y 데이터 중 범위(20-80) 외 1건 (16)이 그래프에서 제외됨 


# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(limits = c(0, 200)) # Y 데이터 중 범위(0-200) 내 이므로 모두 표시됨  


#### ____ ● 구간 설정 ####
# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_line(size = 2) +
  scale_x_continuous(breaks = c(5, 10), # X축 값 5, 10 위치에만 표시 
                     labels = c(5, 10)) # X축 값 5, 10 위치에 5, 10 이라고 표시됨 
# breaks, labels 원소 갯수가 같아야 한다.

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_line(size = 2) +
  scale_x_continuous(breaks = c(5, 10),
                     labels = c("ㅎ", "ㅋ")) + # X축 값 5, 10 위치에 ㅎ, ㅋ 표시됨
  theme(axis.text = element_text(size = 20)) # 축 값 폰트 사이즈 20으로 변경 


# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_line(size = 2) +
  scale_y_continuous(breaks = seq(0, 100, 10),  
                     labels = seq(0, 100, 10)) # Y축 값 범위를 0-100 으로 하고 10 간격으로 표시 

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_line(size = 2) +
  scale_y_continuous(breaks = seq(0, 100, 10),
                     labels = LETTERS[1:11]) + # Y축 값 범위를 0-100 으로 하고 10 간격으로 A - K 표시 
  theme(axis.text = element_text(size = 20))



#### __ [10] 요소 설정 ####
#### ____ ● 기호 변경 ####
# 데이터 준비
library("ggplot2")
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)


# 그래프 1
ggplot(data = bar_df, aes(x = obs, 
                          y = value,
                          color = value)) + 
  geom_point(size = 10)


# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = 1) # 점의 테두리만 표시 

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = 109) #숫자109는 알파벳 m 이다

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = "헐") # 점 대신 "헐"이라는 문자 표시

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = "k")

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = "kk") #문자2개는 에러

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = "★")


# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = 2) # 정삼각형 테두리만 

ggplot(data = bar_df, aes(x = obs, 
                          y = value, 
                          color = value)) + 
  geom_point(size = 10, 
             shape = 3) # "+" 기호 표시 

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) +
  geom_point(size = 10) +
  scale_shape_manual(values = c("A" = 7,
                                "B" = 8,
                                "c" = 9))



#### ____ ● 기호 모음 ####
# google: shape in r
symbol_df = data.frame(obs = 0:127)
head(symbol_df)

symbol_df[, "var"] = symbol_df$obs %/% 16 
symbol_df[, "value"] = symbol_df$obs %% 16

symbol_df

ggplot(data = symbol_df, aes(x = value,
                             y = var,
                             color = obs)) + 
  geom_point(size = 5,
             shape = symbol_df$obs)



#### __ [11] 텍스트 설정 ####
#### ____ ● 글자 모양 설정 ####
# 기본 그래프
ggplot(data = bar_df, aes(x = obs, 
                          y = value,
                          color = value)) + 
  geom_point(size = 10)

# 그래프 1
ggplot(data = bar_df, aes(x = obs, 
                          y = value, 
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title = element_text(size = 20)) # X축, Y축 항목명 크기 변경 


# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.title = element_text(size = 10,
                                  face = "bold")) # X축, Y축 항목명 폰트 굵게


# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.title = element_text(size = 10,
                                  face = "bold",
                                  angle = 45)) # X축, Y축 항목명 기울림 


# 그래프 4
# X축, Y축 값 표시 폰트 각각 다르게 설정  
# axis.text : X축, Y축 모두 적용 
# axis.text.x : X축만 적용 
# axis.text.Y : Y축만 적용 
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.text.x = element_text(size = 30,
                                   face = "italic",
                                   angle = 30),  
        axis.text.y = element_text(size = 30,
                                   face = "bold",
                                   angle = 180))



#### ____ ● 제목 변경 ####
# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  labs(x = "title_x_axis", # X축 제목 
       y = "title_y_axis", # Y축 제목 
       title = "This is title", # 차트 제목 
       color = "color!!") + #범례제목바꾸기
  theme_bw() + # 차트 배경색 변경 
  theme(axis.title = element_text(size = 30),
        axis.title.x = element_text(hjust = 0), # X축 제목출력 위치지정(0 : left, 1 : right)
        axis.title.y = element_text(hjust = 1), # Y축 제목출력 위치지정(0 : bottom, 1 : top)
        title = element_text(size = 40)) # 차트 제목 
#theme_bw()
#theme 함수는 마지막함수가 유효하므로, 위의 title 설정을 사용하려면
#theme_bw()를 먼저 사용하고, title을 지정하면 됨


# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  scale_x_continuous(name = "X_axis_title") + # X축 명 설정 
  scale_y_continuous(name = "Y_axis_title") + # Y축 명 설정
  ggtitle("Your Title") + # 차트 제목 설정 
  theme(axis.title = element_text(size = 30), # X축, Y축 명 폰트 사이즈 설정 
        title = element_text(size = 40)) # 차트 제목 폰트 사이즈 설정 

# 그래프 3
ggplot(data = bar_df, aes(x = obs, 
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  # X축 제목 설정 
  theme(axis.title.x = element_text(size = 30, 
                                    face = "bold",
                                    angle = 45))

# 그래프 4
ggplot(data = bar_df, aes(x = obs, 
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  # Y축 제목 설정 
  theme(axis.title.y = element_text(size = 30,
                                    face = "bold",
                                    angle = 45))

#### __ [12] 덧그리기 ####
#### ____ ● 가로/세로선 추가 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)


# 기본 그래프
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10)

# 그래프(가로선 추가)
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          colour = value)) +
  geom_point(size = 10) +
  geom_hline(yintercept = 10, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 1) +
  geom_hline(yintercept = 20, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 2) +
  geom_hline(yintercept = 30, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 3) +
  geom_hline(yintercept = 40, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 4) +
  geom_hline(yintercept = 50, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 5) +
  geom_hline(yintercept = 60, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 6) +
  geom_hline(yintercept = 70, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 7) +
  geom_hline(yintercept = 80, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 8) +
  geom_hline(yintercept = 90, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 9) +
  geom_hline(yintercept =100, size = 2, colour = "#44FF44", alpha = 0.7, linetype =10)

# 점이 아래에 표시 
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          colour = value)) +
  geom_point(size = 10) + 
  geom_hline(yintercept = seq(10, 100, 10), size = 2)

# 점이 위에 표시 
# geom_point 순서 변경 (나중에 적는데 위에 표시)
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          colour = value)) +
  geom_hline(yintercept = seq(10, 100, 10), size = 2) +
  geom_point(size = 10)


ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          colour = value)) +
  geom_point(size = 10) + 
  theme(panel.grid = element_line(size = 2,
                                  color = "black"))

# 그래프(세로선 추가)
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          colour = value)) +
  geom_point(size = 10) +
  geom_vline(xintercept = 1, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 1) +
  geom_vline(xintercept = 2, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 2) +
  geom_vline(xintercept = 3, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 3) +
  geom_vline(xintercept = 4, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 4) +
  geom_vline(xintercept = 5, size = 2, colour = "#FFAACC", alpha = 0.7, linetype = 5) +
  geom_vline(xintercept = 6, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 6) +
  geom_vline(xintercept = 7, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 7) +
  geom_vline(xintercept = 8, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 8) +
  geom_vline(xintercept = 9, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 9) +
  geom_vline(xintercept =10, size = 2, colour = "#44FF44", alpha = 0.7, linetype =10)

# Q. geom_vline() 함수 하나로 
#    위 코드의 결과와 같은 것을 구현하시오.
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_vline(xintercept = seq(1:10),
             size = 2,
             alpha = 0.7,
             linetype = 3) + 
  geom_point(size = 10)

#### ____ ● annotate() 함수 ####
# 텍스트(geom = "text")
# annotate의  x, y 위치는 텍스트 상자의 중심 위치임
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) +
  annotate(geom = "text",
           label = "Adf", 
           size = 10,
           x = 7,
           y = 3)

# 사각형(geom = "rect")
# (5, 2) ~ (7, 3) 좌표의 사각형 표시 
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) +
  annotate(geom = "rect",
           fill = "#FFA500", 
           xmin = 5, xmax = 7,
           ymin = 2, ymax = 3)

# 선분(geom = "segment")
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) +
  annotate(geom = "segment",
           fill = "#FF0000", 
           size = 2, 
           x = 5, xend = 7,
           y = 2, yend = 3)

# 값 범위(geom = "pointrange")
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) + 
  annotate(geom = "pointrange",
           color = "#FF0000",
           size = 2,
           x = 7, y = 3, # Point 위치 
           ymin = 2, ymax = 5) # range 위치 설정 


#### __ [13] 범례 ####
#### ____ ● 사전 준비 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)


# 기본 그래프
ggplot(data = bar_df,
       aes(x = obs,
           y = value, 
           color = value,
           shape = var)) +
  geom_point(size = 10)

#### ____ ● 위치 조정 ####
# 그래프 1
ggplot(data = bar_df,
       aes(x = obs,
           y = value, 
           color = value,
           shape = var)) +
  geom_point(size = 10) + 
  theme(legend.position = "top")

# 그래프 2
ggplot(data = bar_df,
       aes(x = obs, 
           y = value, 
           color = value,
           shape = var)) + 
  geom_point(size = 10) + 
  theme(legend.position = "bottom")

ggplot(data = bar_df,
       aes(x = obs,
           y = value, 
           color = value,
           shape = var)) +
  geom_point(size = 10) + 
  theme(legend.position = c(0.5, 0.5)) # 차트 중앙에 표시 (위치 입력으로 비어있는 공간에 위치시킬 수 있다.)


#### ____ ● 텍스트 ####
# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) + 
  geom_point(size = 10) + 
  theme(legend.text = element_text(size = 15)) # 범례 항목값 폰트 설정 

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) + 
  geom_point(size = 10) + 
  theme(legend.title = element_text(size = 20)) # 범례 항목명 폰트 설정 

#### ____ ● 기타 ####
# 그래프 5
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) + 
  geom_point(size = 10) + 
  theme(legend.key.size = unit(x = 0.5, units = "cm"))

# 그래프 6
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) + 
  geom_point(size = 10) + 
  theme(legend.key.size = unit(x = 2, units = "cm")) # 범례 표시 영역 크기 변경 

#### __ [14] 다양한 그래프 #### 
#### ____ ● 히스토그램 ####
ggplot(diamonds, aes(x = price,
                     fill = cut)) + 
  geom_histogram(bindwidth = 500)

# Q. Very Good 이상 등급만 사용하여 그리시오.
ggplot(diamonds[diamonds$cut %in% c("Very Good",
                                    "Premium",
                                    "Ideal"),]
       , aes(x = price, 
             fill = cut)) + 
  geom_histogram(binwidth = 500)


class(diamonds$cut)
diamonds$cut[1]

# orderd class 이므로 >= "Very Good" 도 사용 가능 
ggplot(diamonds[diamonds$cut >= "Very Good",]
       , aes(x = price, 
             fill = cut)) + 
  geom_histogram(binwidth = 500)


#### ____ ● Dot plot ####
ggplot(mtcars, aes(x = mpg)) + 
  geom_dotplot(binwidth = 1.5) # binwidth : 점의 크기 

#### ____ ● Ribbon + Line ####
# 압축된 데이터는 Line으로, 압축 전 원본 데이터를 Ribbon으로 표시 
data("LakeHuron")
huron = data.frame(year  = 1875:1972,
                   level = as.vector(LakeHuron))
head(huron)

ggplot(huron, aes(x = year)) + 
  geom_ribbon(aes(ymin = level -1,
                  ymax = level + 1),
              fill = "grey70") + 
  geom_line(aes(y = level))


#### ____ ● 다차원 시각화 ####
library("ggplot2")
data("mtcars")

ggplot() + 
  geom_point(data = mtcars,
             aes(x = disp,
                 y = hp,
                 color = as.factor(cyl),
                 size = gear))

# aes_string 사용 시 문자열에 함수를 포함하여 사용할 수 있다.
# 반복문 함수 처리 가능 
ggplot() + 
  geom_point(data = mtcars,
             aes_string(x = "disp",
                        y = "hp",
                        color = "as.factor(cyl)",
                        size = "gear"))


#### ____ ● 분할 ####
library("ggplot2")
data("diamonds")

ggplot(diamonds,
       aes(x = carat,
           y = price,
           color = cut)) + 
  geom_point() + 
  facet_wrap( ~ cut, ncol = 3) # 한 행에 표시되는 차트 수 (5개인 경우 윗줄에 3개, 나머지 2개는 아랫줄에 표시)

ggplot(diamonds,
       aes(x = carat,
           y = price,
           color = cut)) + 
  geom_point(alpha = 0.1, size = 3) + 
  facet_wrap( ~ cut, ncol = 5) + 
  theme(legend.position = "none") # 범례 숨김

#### ____ ● 병합 ####
library("ggExtra")
library("ggplot2")

set.seed(1234)

# 정규분포에서 평균이 1.7이 되도록 임의값 500개 선택 
# rnorm(500, mean = 1.7))

df = data.frame(x = c(rnorm(500, mean = -1), rnorm(500, mean = 1.5)), # 평균 -1의 500개 + 평균 1.5의 500개 
                y = c(rnorm(500, mean = 1), rnorm(500, mean = 1.7)))
head(df)
summary(df)
str(df)

p = ggplot(df, aes(x, y)) + 
  geom_point()

ggMarginal(p,
           type = "histogram", # boxplot, 하나더있음 
           fill = "steelblue",
           color = "darkblue",
           bins = 50) # 급간 ?


#### ____ ● 흐름도 ####
library("ggparallel")
library("ggplot2")
titanic = as.data.frame(Titanic)

head(titanic)

ggparallel(data = titanic,
           vars = names(titanic)[c(1, 2, 4)], # Class, Sex, Survived 
           order = 0, 
           weight = "Freq") + 
  scale_fill_brewer(palette = "Paired", guide = "none") + 
  scale_color_brewer(palette = "Paired", guide = "none") + 
  scale_x_discrete(expand = c(0.01, 0.01)) + 
  scale_y_continuous(expand = c(0.01, 0.01))

ggparallel(data = titanic,
           vars = names(titanic)[c(1, 2, 4, 1)], # class를 뒤에 추가 
           order = 0, 
           weight = "Freq") + 
  scale_fill_brewer(palette = "Paired", guide = "none") + 
  scale_color_brewer(palette = "Paired", guide = "none") + 
  scale_x_discrete(expand = c(0.01, 0.01)) + 
  scale_y_continuous(expand = c(0.01, 0.01))


#### ____ ● 막대그래프 중첩 ####
df = data.frame(Quarter = paste0("Q", 1:4),
                Team_A = c(1320000, 700000, 300000, 123000),
                Team_B = c( 600000, 500000, 400000, 123000),
                Team_C = c( 250000, 300000, 500000, 123000),
                Team_D = c( 150000, 100000, 600000, 123000))
head(df)
df_melt = reshape2::melt(df, id.vars = "Quarter")
head(df_melt)

libarary("ggplot2")
ggplot(data = df_melt, aes(x = variable, y = value)) + 
  theme(plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_rect(size = 1, fill = NA)) + 
  geom_col(fill = "cyan", alpha = 0.25) + 
  geom_hline(yintercept = seq(0, 2.5, by = 0.5) * 1000000, color = "#FFFFFF") + 
  geom_col(aes(fill = Quarter), position = "dodge", alpha = 0.8) + 
  scale_y_continuous(breaks = seq(0, 2.5, by = 0.5) * 1000000,
                     labels = paste0(seq(0, 2.5, by = 0.5), "M"), 
                     expand = c(0.01, 0.01), limits = c(0, 2600000)) + 
  labs(title = "The Bar Chart") + 
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 15),
        plot.title = element_text(size = 20, face = "bold", hjust = 0.5))

#### ____ ● 그래프 6개 중첩 ####
df = data.frame(xx = 1:10,
                yy = 1:10)

# 레이어 순서, 점 크기 등 조정 
ggplot(data = df,
       aes(x = xx,
           y = yy)) + 
  geom_line(size = 2) + 
  geom_hline(yintercept = 5
             , color = "#FF0000",
             size = 2, 
             alpha = 0.5) + 
  geom_point(size = 12) + 
  geom_point(size = 10, color = "#FFFFFF") + 
  geom_text(aes(label = LETTERS[1:10], # 점에 알파벳 표시 
                y = yy + 1), # 알파벳 위치 변경 
            fontface = "bold",
            size = 8,
            color = "#0000FF") + 
  theme_bw() + 
  theme(axis.title = element_blank(), # 축 제목 숨김 
        axis.text = element_text(size = 20))


#### 3. 더 이상 피할 수 없다! 기초 통계 ####
#### __ [01] 들어가며 ####
#### ____ ● 통계? ####


#### ____ ● 표본 ####

#### ____ ● 사건 ####

#### ____ ● 확률 ####

#### ____ ● 확률 ####

#### __ [02] 통계량 ####
#### ____ ● 통계량의 정의 ####


#### ____ ● 평균 - mean() ####
# 산술 평균


# 기하 평균


# 결측치가 포함되어 있는 값의 평균 계산
mean(c(1:3, NA, 23))

# na.rm 파라미터 추가
mean(c(1:3, NA, 23), na.rm = TRUE) 
mean(c(1:3, NA, 23), na.rm = T) # 가급적 TRUE 사용 (가독성)

# 글자가 포함되어 있는 값의 평균 계산
mean(c(1:3, "사과", 23))

# na.rm 파라미터 추가
mean(c(1:3, "사과", 23), na.rm = TRUE) # 글자는 NA가 아니므로 오류 발생 


#### ____ ● 중앙값 - median() ####


#### ____ ● 최빈값 ####
# 최빈값 추출 기본 함수가 없어서 가장 빠른 방법으로 만든 함수 
mode = function(x){
  ux = unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode(c(1, 1, 1, 2, 3, 4, 4))


#### ____ ● 분산과 표준편차 - var(), sd() ####
var(c(1,3,5,2,7,10))
sd(c(1,3,5,2,7,10))

#### ____ ● 통계량의 함정 ####
# https://github.com/stephlocke/datasauRus

library("ggplot2")
library("datasauRus")
ggplot(datasaurus_dozen) + 
  aes(x = x,
      y = y,
      color = dataset) + 
  geom_point() + 
  theme(legend.position = "none") + 
  facet_wrap( ~ dataset, nrow = 3)


# boxplot 그래프 1 
df = data.frame(obs = 1:20,
                name = LETTERS[1:20],
                grade = sample(LETTERS[1:5],
                               size = 20, replace = TRUE),
                score1 = sample(20:100, size = 20),
                score2 = sample(20:100, size = 20),
                score3 = sample(20:100, size = 20),
                score4 = sample(20:100, size = 20))
head(df)

library("reshape2")
df_melt = melt(data = df, id.vars = c("obs",
                                      "name",
                                      "grade"))
head(df_melt)

ggplot(data = df_melt,
       aes(x = grade,
           y = value)) + 
  geom_boxplot()


# boxplot 그래프 2 
df = data.frame(xx = 1:10,
                yy = 1:10)

ggplot(data = df,
       aes(x = xx,
           y = yy)) + 
  geom_hline(yintercept = 5, color = "#FF0000",
             size = 2, alpha = 0.5) +
  geom_line(size = 1.6) + 
  geom_point(size = 12) +
  geom_point(size = 10, color = "#FFFFFF") + 
  geom_text(aes(label = LETTERS[1:10],
                y = yy + 1),
            fontface = "bold",
            size = 8,
            color = "#0000FF") +
  theme_bw() + 
  theme(axis.title = element_blank(),
        axis.text = element_text(size = 20))


df = data.frame(obs = 1:20,
                name = LETTERS[1:20],
                grade = sample(LETTERS[1:5],
                               size = 20, replace = TRUE),
                score1 = sample(20:100, size = 20),
                score2 = sample(20:100, size = 20),
                score3 = sample(20:100, size = 20),
                score4 = sample(20:100, size = 20),
                type = sample(LETTERS[1:3],
                              size = 20, replace = TRUE))
head(df)

library("reshape2")
df_melt = melt(data = df, id.vars = c("obs",
                                      "name",
                                      "grade",
                                      "type"))
head(df_melt)

ggplot(data = df_melt,
       aes(x = grade,
           y = value)) + 
  geom_boxplot() + 
  facet_grid( ~ type)



#### __ [03] 표본 추출 ####
#### ____ ● 표본 추출의 정의 ####

#### ____ ● 표본 추출의 종류 ####

#### ____ ● 확률적 표본 추출의 정의 ####

#### ____ ● 단순 임의 추출의 정의 ####

#### ____ ● 단순 임의 추출의 특징 ####

#### ____ ● 단순 임의 추출 ####
# 복원 추출

# 비복원 추출

#### ____ ● 군집 표본 추출의 정의 ####


#### ____ ● 군집 표본 추출의 특징 ####


#### ____ ● 예시 ####
# 행정구역 기준 표본 추출


# 교육기관 기준 표본 추출


#### ____ ● 체계적 표본 추출의 정의 ####

#### ____ ● 체계적 표본 추출의 특징 ####


#### ____ ● 예시  ####


#### ____ ● 비확률적 표본 추출의 정의 ####

#### ____ ● 편의 표본 추출의 정의 ####


#### ____ ● 편의 표본 추출의 특징 ####


#### ____ ● 예제 ####
# 숫자 생성
number = 1:1000

set.seed(50)
number = sample(number, 30)
head(number)
number = number[order(number)] # 오름차순 정렬 
head(number)

# 최소값/최대값/평균값
min(number)
max(number)
mean(number)

# 복원 추출 / 비복원 추출1:100
numbers = 1:100
sample(numbers, size = 10, replace = TRUE)
sample(numbers, size = 10, replace = FALSE)

numbers_2 = 10:20
sample(numbers_2, size = 20, replace = TRUE)
sample(numbers_2, size = 20, replace = FALSE)


# 추출 방법별 특징 비교


#### __ [04] 분위수와 상자그림 ####
#### ____ ● 사분위수와 상자그림 ####


#### ____ ● 분위수 함수 - quantile() ####
quantile(0:100)
quantile(0:100, probs = 0.98)
quantile(0:100, probs = 0.02)
quantile(0:100, probs = c(0.123, 0.3456))

#### ____ ● psych 패키지 활용 ####
library("psych")

data("iris")
head(iris, 3)
describe(iris) # 다양한 기술통계량 추출 가능

#### __ [05] 상관 분석 ####
#### ____ ● 상관 계수의 정의 ####


#### ____ ● 상관 계수의 특징 ####


#### ____ ● 두 집단간 상관 계수 확인 ####
# 데이터 준비
set.seed(53779)
aa = runif(100)
bb = runif(100)


# 두 집단의 상관계수 계산
cor(aa, bb) # 상관계수만 표시 
cor.test(aa, bb) # 피어슨상관계수 관련 자세한 내용 표시 

#### ____ ● 상관 행렬 ####
# 데이터 준비
bike = read.csv("bike.csv",
                stringsAsFactors = FALSE)
head(bike, 3)

# 상관 행렬의 생성
cor_matrix = cor(bike[, 2:9]) # 3개 이상 원소 입력 시 매트릭스로 표시 
round(cor_matrix, 4)

#### ____ ● 상관 행렬의 시각화 1 ####
library("corrplot")

corrplot(cor_matrix)

corrplot(cor_matrix, method = "color", addCoef.col = TRUE,
         order = "hclust", hclust.method = "ward.D", # 계층적 군집분석 
         outline = TRUE, tl.srt = 45)

corrplot(cor_matrix, method = "color", addCoef.col = TRUE,
         # order = "hclust", hclust.method = "ward.D",
         outline = TRUE, tl.srt = 45)

#### ____ ● 상관 행렬의 시각화 2 ####
library("ggplot2")
library("GGally")

data("flea", package = "GGally")
head(flea)

ggpairs(flea, columns = 2:4)
ggpairs(flea, columns = 2:4, aes(color = species)) # species 데이터별로 한번에 볼 수 있다. 

ggpairs(flea, columns = 2:4) + 
  theme_bw()

# species 데이터별로 상관관계를 확인해보니 
# 특정 species에서는 상관관계가 높음 
ggpairs(flea, columns = 2:4, 
        aes(color = species)) + 
  theme_bw()
#### ____ ● 예제 ####


#### ____ ● 쉬어가기 ####
# http://guessthecorrelation.com/


#### ____ ● 상관과 인과 ####
# http://www.tylervigen.com/spurious-correlations
# 상관관계가 있는 것으로 보이지만 인과관계가 없다면 그 상관관계는 의미 없다. 

#### __ [06] 이상치 ####
#### ____ ● 개요 ####


#### ____ ● 처리 절차 ####


#### ____ ● 텍스트 출력을 통한 확인 ####
# 데이터 준비
set.seed(1228)
df = data.frame(xx = 1:200,
                yy = rnorm(n = 200,
                           mean = 5,
                           sd = 3))
head(df)

# 하위 3개 값 추출
df[order(df$yy), "yy"][1:3] # yy 데이터 기준 정렬 후 1~3 요소 추출

# 상위 3개 값 추출
df[order(-df$yy), "yy"][1:3] # 숫자형 데이터는 - 적용해서 역순을 추출

# 하위 3개 값의 row 추출
df[df$yy %in% df[order(df$yy), "yy"][1:3], ]

# 상위 3개 값의 row 추출
df[df$yy %in% df[order(-df$yy), "yy"][1:3], ]


# 분위수 활용
quantile(df$yy, probs = 0.95)
df[df$yy > quantile(df$yy, probs = 0.95), ] # df$yy 기준 95% 초과 yy 값의 데이터 추출 

#### ____ ● 시각화를 통한 확인 ####
ggplot() + 
  geom_point(data = rbind(df,
                          data.frame(xx = c(30, 50, 84),
                                     yy = c(35, 40, 39))),
             aes(x = xx,
                 y = yy),
             size = 7,
             alpha = 0.5,
             color = "#FFA500") + 
  scale_y_continuous(limit = c(-10, 50))


boxplot(rbind(df,
              data.frame(xx = c(30, 50, 84),
                         yy = c(35, 40, 39))))


#### __ [07] 결측치 ####
#### ____ ● 개요 ####


#### ____ ● 결측치 확인 ####
# 데이터 준비 
data("Orange")
head(Orange, 3)
class(Orange)

set.seed(1228)
df = as.matrix(Orange)
# NA 를 임의의 10개에 입력 
df[sample(1:(nrow(df) * ncol(df)), size = 10)] = NA
df = as.data.frame(df, 
                   strtingAsFactors = FALSE)
head(df, 3)

# 벡터 연산
df[is.na(df$Tree),]
df[is.na(df$age),]

df[is.na(df$Tree) | is.na(df$age),]
df[is.na(df$Tree) & is.na(df$age),]

# summary()
summary(df) # 원소별 결측치(NA) 갯수 확인 가능 
str(df)
sapply(df, "class") # df data.frame 각 항목의 클래스 확인 

# factor 설명 
dd = factor(c(1, 2, 3, 3, 2),
            labels = c(1, 2, 3))
dd[4] = 4 # 오류 발생 : label 에 없는 값 입력 시도 
dd


data("Orange")
head(Orange, 3)

set.seed(1228)
df = as.matrix(Orange)
df[sample(1:(nrow(df) * ncol(df)), size = 10)] = NA
df = as.data.frame(df)
head(df, 3)
sapply(df, "class")

dd = factor(c(1, 2, 3, 3, 2),
            labels = c(1, 2, 3))
dd[4] = 4
as.numeric(as.character(dd))

# 벡터 연산
df[is.na(df$Tree), ]
df[is.na(df$age), ]

df[is.na(df$Tree) | is.na(df$age), ]
df[is.na(df$Tree) & is.na(df$age), ]

# summary()
summary(df)

# Q1. df 에서 두 개 이상의 결측치를 가지는 row 개수를 계산하시오.
nrow(df[(is.na(df$Tree) + is.na(df$age) + is.na(df$circumference)) >= 2, ])

df[(is.na(df$Tree) & is.na(df$age)) |
     (is.na(df$age) & is.na(df$circumference)) | 
     (is.na(df$circumference) & is.na(df$Tree)),]

nrow(df[(is.na(df$Tree) & is.na(df$age)) |
          (is.na(df$age) & is.na(df$circumference)) | 
          (is.na(df$circumference) & is.na(df$Tree)),])

sum((is.na(df$Tree) & is.na(df$age)) |
      (is.na(df$age) & is.na(df$circumference)) | 
      (is.na(df$circumference) & is.na(df$Tree)))

# 함수 사용 (data.frame 에 항목이 많은 경우 유리)
df[, "na_cnt"] = apply(df, MARGIN = 1, FUN = function(x){sum(is.na(x))})
head(df)

sum(df$na_cnt == 2)

# Q2. age 변수의 결측치를 1000으로 대체하시오.
df[, "age"] = as.character(df$age) # factor를 문자열로 변경 
df[is.na(df$age), "age"] = 1000
df[df$age == "1000", ]
sapply(df, "class")

# Q3. circonference 변수의 결측치를 해당 변수의 평균값으로 대체하시오.
df[, "circumference"] = as.numeric(df$circumference)
df[is.na(df$circumference), "circumference"] = mean(df$circumference,
                                                    na.rm = TRUE)
df

# Q4. Tree 변수에 결측치가 있는 경우 해당 row를 제외하시오.
df[is.na(df$Tree),]

df[!is.na(df$Tree),]
df_sub = df[ is.na(df$Tree) == 0,]
summary(df_sub)


# 데이터를 만들면 결측치 처리를 먼저해야 한다. 
df[df$Tree == 1, ]
# NA   <NA> <NA>          <NA>
# NA.1 <NA> <NA>          <NA>
# NA.2 <NA> <NA>          <NA>

na.omit(df) # 사용 시 조심

sapply(df, FUN = function(x){sum(is.na(x))})
t(t(sapply(df, FUN = function(x){sum(is.na(x))})))


# 옵션 지정하면 이후 실행되는 명령어들은 자동 반영된다. 
options(stringsAsFactors = FALSE,
        scipen = 1000)
123140000
0.00000457

options(stringsAsFactors = FALSE,
        scipen = 2)
123140000
0.00000457

#### 4. 확률변수와 확률분포함수 ####
#### __ [01] 개념 정리 ####
#### ____ ● 확률 변수 ####


#### ____ ● 확률 분포 ####
# 이산 확률 분포


# 연속 확률 분포


#### ____ ● 확률 함수 ####


#### ____ ● 확률 질량 함수 ####


#### ____ ● 확률 질량 함수 ####


#### ____ ● 확률 밀도 함수 ####


#### ____ ● 확률 밀도 함수 ####


#### __ [02] 분포 ####
#### ____ ● 누적 분포 함수 ####


#### ____ ● 누적 분포 함수 ####


#### __ [03] 중심 극한 정리 ####
#### ____ ● 중심 극한 정리 ####

#### ____ ● 표본 개수에 따른 표본 분포 시뮬레이션 ####
library("ggplot2")
library("reshape2")

sample_size = c(1:32, 2^(6:9))

test_fun = function(sample_size,
                    trial = 1000,
                    p = 0.5,
                    mean = 0,
                    sd = 2,
                    dist = c("normal", "uniform", "binomial")){
  nums = if(dist == "normal"){
    rnorm(trial * sample_size, mean = mean, sd = sd)
  } else if(dist == "uniform") {
    runif(trial * sample_size)
  } else if(dist == "binomial") {
    sample(0:1, trial * sample_size, replace = TRUE, prob = c(p, 1 - p))
  }
  
  return(apply(matrix(nums, trial), MARGIN = 1, FUN = "mean"))
}

mat = sapply(sample_size, test_fun, dist = "binomial")
#mat = sapply(sample_size, test_fun, dist = "normal")
#mat = sapply(sample_size, test_fun, dist = "uniform")

mat_melt = melt(mat)
colnames(mat_melt) = c("simulation", "sample_size", "mean")

ggplot(data = mat_melt,
       aes(x = mean,
           fill = as.factor(sample_size))) + 
  geom_histogram(aes(y = ..density..),
                 bins = 30) + 
  geom_density() + 
  facet_wrap( ~ sample_size) + 
  labs(title = "Central Limit Theorem Tested with different sample sizes",
       x = NULL, y = NULL, fill = "Sample Size") + 
  theme(axis.text  = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "none")

#### __ [04] 정규 분포 ####
#### ____ ● 정규분포 ####


#### ____ ● 밀도 함수 ####
# d : 밀도, p : 확률, q : 분위수, r : 임의  
# dnorm, pnorm, qnorm, rnorm 
# qnorm (quantile norm) : 분위수 함수, 정규 분포에서 분위값 사용 시 
# rnorm (random norm) :

# 데이터/패키지 준비 
library("ggplot2")
norm_d = seq(-3, 3, length.out = 200)
norm_d

# 밀도 함수 (Density Function)
dnorm(x = 0) # x 값이 0 인 위치의 밀도함수 

ggplot() + 
  geom_line(aes(x = norm_d,
                y = dnorm(norm_d)),
            size = 2) + 
  geom_point(aes(x = 0,
                 y = dnorm(x = 0)),
             size = 4,
             color = "red")

#### ____ ● 누적 분포 함수 ####
# Cumulative Distribution Function 
pnorm(q = 0) # 0 일때 0.5 (50%)

ggplot() + 
  geom_line(aes(x = norm_d,
                y = pnorm(norm_d)),
            size = 2) + 
  geom_point(aes(x = 0,
                 y = pnorm(q = 0)),
             size = 4,
             color = "red")


#### ____ ● 분위수 함수 ####
# Quantile Function 
qnorm(p = 0.5)
qnorm(p = 0.9)

ggplot() + 
  geom_line(aes(x = norm_d,
                y = dnorm(norm_d)),
            size = 2) + 
  geom_vline(xintercept = c(qnorm(p = 0.5),
                            qnorm(p = 0.9)),
             size = 2,
             color = "red")


#### ____ ● 난수 생성 ####
set.seed(123)
normal_d = rnorm(n = 1000)
head(normal_d)

ggplot() + 
  geom_point(aes(x = 1:1000,
                 y = normal_d))

ggplot() + 
  geom_histogram(aes(x = normal_d),
                 bins = 100,
                 fill = "#FFFFFF",
                 color = "#000000",
                 size = 1.2)

set.seed(123)
normal_d = rnorm(1000, mean = 15) # 평균 15 인 난수 1000개  
head(normal_d)

ggplot() + 
  geom_histogram(aes(x = normal_d),
                 bins = 100,
                 fill = "#FFFFFF",
                 color = "#000000",
                 size = 1.2) + 
  theme(axis.text.x = element_text(size = 20,
                                   face = "bold"))

set.seed(123)
normal_d = rnorm(1000, sd = 1) # 표준편차 1인 난수 1000개  

ggplot() + 
  geom_histogram(aes(x = normal_d),
                 bins = 100,
                 fill = "#FFFFFF",
                 color = "#000000",
                 size = 1.2) + 
  theme(axis.text.x = element_text(size = 20,
                                   face = "bold"))

set.seed(123)
normal_d_1 = rnorm(1000, sd = 1)
normal_d_2 = rnorm(1000, sd = 3)
normal_d_3 = rnorm(1000, sd = 5)
normal_d_3

ggplot() + 
  geom_histogram(aes(x = normal_d_1),
                 bins = 50,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = normal_d_2),
                 bins = 50,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) + 
  geom_histogram(aes(x = normal_d_3),
                 bins = 50,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4) + 
  theme(axis.text.x = element_text(size = 20,
                                   face = "bold"))


#### ____ ● 첨도 ####
# 자료 분포의 뾰족함의 정도 
# 표준정규분포 기준 = 0 
# 뾰족하면 > 0 , 평평하면 < 0 
library("moments")

kurtosis(1:100)
kurtosis(rnorm(n = 100)) # 정규분포 적용 시 3 기준 
kurtosis(rnorm(n = 100, sd = 2))
kurtosis(rnorm(n = 100, sd = 10))
kurtosis(rnorm(n = 100, sd = 0.01))

#### ____ ● 관련 이론 ####


#### ____ ● 왜도 ####
# 자료 분포의 치우침의 정도 
skewness(1:100)
skewness(rnorm(n = 100))


#### ____ ● 관련 이론 ####


#### ____ ● 정규분포의 왜도 계산 시물레이션 ####
trials = 2000 # 시뮬레이션 횟수
nums_df = c() # 비어있는 벡터 생성

for(n in 1:trials){
  rnorm_nums = rnorm(n = n * 100)
  nums_df[length(nums_df) + 1] = skewness(rnorm_nums)
}
plot(1:trials, nums_df, "l")


#### __ [05] 이산 확률 분포 ####
#### ____ ● 이항 분포 ####


#### ____ ● R 함수 ####
# 밀도 함수(Density Function)
dbinom(x = 1, size = 5, prob = 0.5)

ggplot() + 
  geom_col(aes(x = 1:20,
               y = dbinom(x = 1:20, size = 5, prob = 0.5)))

ggplot() + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size =  5, prob = 0.5)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 10, prob = 0.5)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 15, prob = 0.5)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 20, prob = 0.5)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)

ggplot() + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size =  5, prob = 0.8)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 10, prob = 0.8)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 15, prob = 0.8)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dbinom(x = 1:20, size = 20, prob = 0.8)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)

# 누적 분포 함수 (Cumulative Distribution Function)
pbinom(q = 1, size = 10, prob = 0.5)

ggplot() + 
  geom_line(aes(x = 1:20,
                y = pbinom(q = 1:20, size = 20, prob = 0.5)))

num_binom = data.frame(x = 1:20,
                       y_1 = pbinom(q = 1:20, size =  5, prob = 0.5),
                       y_2 = pbinom(q = 1:20, size = 10, prob = 0.5),
                       y_3 = pbinom(q = 1:20, size = 15, prob = 0.5),
                       y_4 = pbinom(q = 1:20, size = 20, prob = 0.5))

ggplot(data = num_binom, aes(x = x)) + 
  geom_col(aes(y = y_1),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(y = y_2),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) +
  geom_col(aes(y = y_3),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) +
  geom_col(aes(y = y_4),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)


# 분위수 함수 (Quantile Function)
qbinom(p = 0.5, size = 5, prob = 0.5)

ggplot() + 
  geom_line(aes(x = (0:10)/10,
                y = qbinom(p = (0:10)/10, size = 5, prob = 0.5)))

ggplot() + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size =  5, prob = 0.5)),
            size = 1.3, color = "#225378") + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size = 10, prob = 0.5)),
            size = 1.3, color = "#1695A3") + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size = 15, prob = 0.5)),
            size = 1.3, color = "#ACF0F2") + 
  geom_line(aes(x = (0:20)/20,
                y = qbinom(p = (0:20)/20, size = 20, prob = 0.5)),
            size = 1.3, color = "#EB7F00")

# 난수 생성 (Random Number Generation)
num_binom = rbinom(n = 200, size = 10, prob = 0.5)

df = data.frame(obs = 1:200,
                num = rbinom(n = 200, size = 10, prob = 0.5))

ggplot(df, aes(x = as.factor(num))) + 
  geom_histogram(stat = "count")


#### ____ ● 기하 분포 ####


#### ____ ● R 함수 ####
geom_d = seq(0, 15, length.out = 200)

# 밀도 함수(Density Function)
dgeom(x = 1, prob = 0.5)

ggplot() + 
  geom_col(aes(x = 1:20,
               y = dgeom(x = 1:20, prob = 0.5)))

ggplot() + 
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.2)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.4)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.6)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dgeom(x = 1:20, prob = 0.8)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)


# 누적 분포 함수 (Cumulative Distribution Function)
pgeom(q = 1, prob = 0.5)

ggplot() + 
  geom_line(aes(x = 1:20,
                y = pgeom(q = 1:20, prob = 0.5)))

num_geom = data.frame(x = 1:20,
                      y_1 = pgeom(q = 1:20, prob = 0.2),
                      y_2 = pgeom(q = 1:20, prob = 0.4),
                      y_3 = pgeom(q = 1:20, prob = 0.6),
                      y_4 = pgeom(q = 1:20, prob = 0.8))

ggplot(data = num_geom, aes(x = x)) + 
  geom_col(aes(y = y_4),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6) +
  geom_col(aes(y = y_3),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) +
  geom_col(aes(y = y_2),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) +
  geom_col(aes(y = y_1),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6)


# 분위수 함수 (Quantile Function)
qgeom(p = 0.5, prob = 0.5)

ggplot() + 
  geom_line(aes(x = (0:10)/10,
                y = qgeom(p = (0:10)/10, prob = 0.5)))

ggplot() + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20, prob = 0.2)),
            size = 1.3, color = "#225378") + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20,  prob = 0.4)),
            size = 1.3, color = "#1695A3") + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20, prob = 0.6)),
            size = 1.3, color = "#ACF0F2") + 
  geom_line(aes(x = (0:20)/20,
                y = qgeom(p = (0:20)/20, prob = 0.8)),
            size = 1.3, color = "#EB7F00")

# 난수 생성 (Random Number Generation)
num_geom = rgeom(n = 200, prob = 0.5)

df = data.frame(obs = 1:200,
                num = rgeom(n = 200, prob = 0.5))

ggplot(df, aes(x = as.factor(num))) + 
  geom_histogram(stat = "count")



#### ____ ● 음이항 분포 ####


#### ____ ● R 함수 ####
library("reshape2")
nb_d = 1:60

# 밀도 함수(Density Function)
dnbinom(2, size = 15, prob = 0.5)

ggplot() + 
  geom_line(aes(x = nb_d,
                y = dnbinom(nb_d, size = 15, prob = 0.5)),
            size = 2)

nb_df = data.frame(num = nb_d,
                   V_p_1 = dnbinom(nb_d, size = 15, prob = 0.1))
head(nb_df)

for(n in 2:9){
  nb_df[, paste0("V_p_", n)] = dnbinom(nb_d, size = 15, prob = n/10)
}
head(nb_df)

nb_df_melt = melt(nb_df, id.vars = "num")
head(nb_df_melt)

ggplot() + 
  geom_line(data = nb_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable),
            size = 1.5)

# 누적 분포 함수 (Cumulative Distribution Function)
pnbinom(15, size = 15, prob = 0.5)

ggplot() + 
  geom_line(aes(x = nb_d,
                y = pnbinom(nb_d, size = 15, prob = 0.5)),
            size = 2)

nb_df = data.frame(num = nb_d,
                   V1  = pnbinom(nb_d, size = 15, prob = 0.1))

for(n in 2:9){
  nb_df[, paste0("V", n)] = pnbinom(nb_d, size = 15, prob = n/10)
}
head(b_df)

nb_df_melt = melt(nb_df, id.vars = "num")
head(nb_df_melt)

ggplot() + 
  geom_line(data = nb_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable),
            size = 1.5)

# 분위수 함수 (Quantile Function)
qnbinom(0.5, size = 15, prob = 0.5)

nb_num = seq(0, 1, length.out = 21)
head(nb_num)

ggplot() + 
  geom_line(aes(x = nb_num,
                y = qnbinom(nb_num, size = 15, prob = 0.5)),
            size = 2)

nb_num_df = data.frame(num = nb_num,
                       V1 = qnbinom(nb_num, size = 15, prob = 0.1))
head(nb_num_df)

for(n in 2:9){
  nb_num_df[, paste0("V", n)] = qnbinom(nb_num, size = 15, prob = n/10) 
}
head(nb_num_df)

nb_num_df_melt = melt(nb_num_df, id.vars = "num")
head(nb_num_df_melt)

ggplot() + 
  geom_line(data = nb_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable))

# 난수 생성 (Random Number Generation)
set.seed(123)
nb_d_r = rnbinom(200, size = 15, prob = 0.5)
head(nb_d_r)

ggplot() + 
  geom_histogram(aes(x = nb_d_r),
                 bins = 20,
                 fill = "#FFFFFF",
                 color = "#000000")

nb_d_r_2 = rnbinom(200, size = 15, prob = 0.2)
nb_d_r_5 = rnbinom(200, size = 15, prob = 0.5)
nb_d_r_8 = rnbinom(200, size = 15, prob = 0.8)
head(nb_d_r_8)

ggplot() + 
  geom_histogram(aes(x = nb_d_r_2),
                 bins = 20,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = nb_d_r_5),
                 bins = 20,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) + 
  geom_histogram(aes(x = nb_d_r_8),
                 bins = 20,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)


#### ____ ● 포아송 분포 ####


#### ____ ● R 함수 ####
# 밀도 함수(Density Function)
dpois(x = 1, lambda = 0.5)

ggplot() + 
  geom_col(aes(x = 1:20,
               y = dpois(x = 1:20, lambda = 5)))

ggplot() + 
  geom_col(aes(x = 1:20, y = dpois(x = 1:20, lambda = 5)),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(x = 1:20, y = dpois(x = 1:20, lambda = 10)),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dpois(x = 1:20, lambda = 15)),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) + 
  geom_col(aes(x = 1:20, y = dpois(x = 1:20, lambda = 20)),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)

# 누적 분포 함수 (Cumulative Distribution Function)
ppois(q = 1, size = 10, prob = 0.5)

ggplot() + 
  geom_line(aes(x = 1:20,
                y = ppois(q = 1:20, lambda = 5)))

num_pois = data.frame(x = 1:20,
                      y_1 = ppois(q = 1:20, lambda = 5),
                      y_2 = ppois(q = 1:20, lambda = 10),
                      y_3 = ppois(q = 1:20, lambda = 15),
                      y_4 = ppois(q = 1:20, lambda = 20))

ggplot(data = num_pois, aes(x = x)) + 
  geom_col(aes(y = y_1),
           color = "#AAAAAA", fill = "#225378", alpha = 0.6) +
  geom_col(aes(y = y_2),
           color = "#AAAAAA", fill = "#1695A3", alpha = 0.6) +
  geom_col(aes(y = y_3),
           color = "#AAAAAA", fill = "#ACF0F2", alpha = 0.6) +
  geom_col(aes(y = y_4),
           color = "#AAAAAA", fill = "#EB7F00", alpha = 0.6)


# 분위수 함수 (Quantile Function)
qpois(p = 0.5, lambda = 5)

ggplot() + 
  geom_line(aes(x = (0:10)/10,
                y = qpois(p = (0:10)/10, lambda = 5)))

ggplot() + 
  geom_line(aes(x = (0:20)/20,
                y = qpois(p = (0:20)/20, lambda = 5)),
            size = 1.3, color = "#225378") + 
  geom_line(aes(x = (0:20)/20,
                y = qpois(p = (0:20)/20, lambda = 10)),
            size = 1.3, color = "#1695A3") + 
  geom_line(aes(x = (0:20)/20,
                y = qpois(p = (0:20)/20, lambda = 15)),
            size = 1.3, color = "#ACF0F2") + 
  geom_line(aes(x = (0:20)/20,
                y = qpois(p = (0:20)/20, lambda = 20)),
            size = 1.3, color = "#EB7F00")

# 난수 생성 (Random Number Generation)
num_pois = rpois(n = 200, lambda = 5)

df = data.frame(obs = 1:200,
                num = rpois(n = 200, lambda = 5))

ggplot(df, aes(x = as.factor(num))) + 
  geom_histogram(stat = "count")

#### __ [06] 연속 확률 분포 ####
#### ____ ● 연속 균등 분포 ####

#### ____ ● R 함수 ####
#### __ ● R 함수 ####
# 밀도 함수(Density Function)
dunif(x = 1, shape = 2, rate = 1)
unif_d = seq(-15, 15, length.out = 200)

# 밀도 함수(Density Function)
dunif(2, shape = 2, rate = 1)

ggplot() + 
  geom_line(aes(x = unif_d,
                y = dunif(unif_d, min = -10, max = 10)),
            size = 2)

unif_df = data.frame(num = unif_d,
                     V1 = dunif(unif_d, min = -15, max = -14))
head(unif_df)

for(n in 2:30){
  unif_df[, paste0("V", n)] = dunif(unif_df$num, min = -15, max = n-15)
}
head(unif_df)

unif_df_melt = melt(unif_df, id.vars = "num")
head(unif_df_melt)

ggplot() + 
  geom_line(data = unif_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable))

# 누적 분포 함수 (Cumulative Distribution Function)
punif(2, df = 2)

ggplot() + 
  geom_line(aes(x = unif_d,
                y = punif(unif_d, min=-15, max=15)),
            size = 2)

unif_df = data.frame(num = unif_d,
                     V1 = punif(unif_d, min=-15, max=-14))
head(unif_df)

for(n in 2:30){
  unif_df[, paste0("V", n)] = punif(unif_df$num, min=-15, max=n-15)
}
head(unif_df)

unif_df_melt = melt(unif_df, id.vars = "num")
head(unif_df_melt)

ggplot() + 
  geom_line(data = unif_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable))

# 분위수 함수 (Quantile Function)
qunif(0.5, shape = 2, rate = 1)

unif_num = seq(0, 1, length.out = 201)[-1]
head(unif_num)

ggplot() + 
  geom_line(aes(x = unif_num,
                y = qunif(unif_num, min=-10, max=10)))

unif_num_df = data.frame(num = unif_num,
                         V1 = qunif(unif_num, min=-15, max=-14))
head(unif_num_df)

for(n in 2:30){
  unif_num_df[, paste0("V", n)] = qunif(unif_num, min=-15, max=n-15)
}
head(unif_num_df)

unif_num_df_melt = melt(unif_num_df, id.vars = "num")
head(unif_num_df_melt)

ggplot() + 
  geom_line(data = unif_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable))

# 난수 생성 (Random Number Generation)
set.seed(345)
unif_d_r = runif(200, min=-15, max=15)
head(unif_d_r)

ggplot() + 
  geom_histogram(aes(x = unif_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

unif_d_r_15  = runif(200, min=-15, max=15)
unif_d_r_10 = runif(200, min=-10, max=10)
unif_d_r_5 = runif(200, min=-5, max=5)
head(unif_d_r_5)

ggplot() + 
  geom_histogram(aes(x = unif_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = unif_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = unif_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)

#### ____ ● 감마 분포 ####

#### ____ ● R 함수 ####
library("reshape2")

# 밀도 함수(Density Function)
dgamma(x = 1, shape = 10, rate = 5)
gamma_d = seq(0, 15, length.out = 200)

# 밀도 함수(Density Function)
dgamma(2, shape = 2, rate = 1)

ggplot() + 
  geom_line(aes(x = gamma_d,
                y = dgamma(gamma_d, shape = 10, rate = 5)),
            size = 2)

gamma_df = data.frame(num = gamma_d,
                      V1 = dgamma(gamma_d, shape = 10, rate = 1))
head(gamma_df)

for(n in 2:30){
  gamma_df[, paste0("V", n)] = dgamma(gamma_df$num, shape = 10, rate = n)
}
head(gamma_df)

gamma_df_melt = melt(gamma_df, id.vars = "num")
head(gamma_df_melt)

ggplot() + 
  geom_line(data = gamma_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

##

gamma_df = data.frame(num = gamma_d,
                      V1 = dgamma(gamma_d, shape = 1, rate = 5))

for(n in 2:30){
  gamma_df[, paste0("V", n)] = dgamma(gamma_df$num, shape = n, rate = 5)
}

gamma_df_melt = melt(gamma_df, id.vars = "num")

ggplot() + 
  geom_line(data = gamma_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")


# 누적 분포 함수 (Cumulative Distribution Function)
pgamma(2, shape = 10, rate = 5)

ggplot() + 
  geom_line(aes(x = gamma_d,
                y = pgamma(gamma_d, shape = 2, rate = 1)),
            size = 2)

gamma_df = data.frame(num = gamma_d,
                      V1 = pgamma(gamma_d, shape = 10, rate = 1))
head(gamma_df)

for(n in 2:30){
  gamma_df[, paste0("V", n)] = pgamma(gamma_df$num, shape = 10, rate = n)
}
head(gamma_df)

gamma_df_melt = melt(gamma_df, id.vars = "num")
head(gamma_df_melt)

ggplot() + 
  geom_line(data = gamma_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) +
  theme(legend.position = "none")

# 분위수 함수 (Quantile Function)
qgamma(0.5, shape = 10, rate = 5)

gamma_num = seq(0, 1, length.out = 201)[-1]
head(gamma_num)

ggplot() + 
  geom_line(aes(x = gamma_num,
                y = qgamma(gamma_num, shape = 10, rate = 5)))

gamma_num_df = data.frame(num = gamma_num,
                          V1 = qgamma(gamma_num, shape = 10, rate = 1))
head(gamma_num_df)

for(n in 2:30){
  gamma_num_df[, paste0("V", n)] = qgamma(gamma_num, shape = 10, rate = n)
}
head(gamma_num_df)

gamma_num_df_melt = melt(gamma_num_df, id.vars = "num")
head(gamma_num_df_melt)

ggplot() + 
  geom_line(data = gamma_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

##

gamma_num_df = data.frame(num = gamma_num,
                          V1 = qgamma(gamma_num, shape = 1, rate = 5))
head(gamma_num_df)

for(n in 2:30){
  gamma_num_df[, paste0("V", n)] = qgamma(gamma_num, shape = n, rate = 5)
}
head(gamma_num_df)

gamma_num_df_melt = melt(gamma_num_df, id.vars = "num")
head(gamma_num_df_melt)

ggplot() + 
  geom_line(data = gamma_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 난수 생성 (Random Number Generation)
set.seed(345)
gamma_d_r = rgamma(200, shape = 10, rate = 5)
head(gamma_d_r)

ggplot() + 
  geom_histogram(aes(x = gamma_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

gamma_d_r_15  = rgamma(200, shape = 15, rate = 5)
gamma_d_r_10 = rgamma(200, shape = 10, rate = 5)
gamma_d_r_5 = rgamma(200, shape = 5, rate = 5)

ggplot() + 
  geom_histogram(aes(x = gamma_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = gamma_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = gamma_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)

##

gamma_d_r_15  = rgamma(200, shape = 5, rate = 5)
gamma_d_r_10 = rgamma(200, shape = 5, rate = 10)
gamma_d_r_5 = rgamma(200, shape = 5, rate = 15)

ggplot() + 
  geom_histogram(aes(x = gamma_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = gamma_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = gamma_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)


#### ____ ● 카이제곱 분포 ####

#### ____ ● R 함수 ####
# 밀도 함수(Density Function)
dchisq(x = 1, df = 2)
chisq_d = seq(0, 50, length.out = 200)

# 밀도 함수(Density Function)
dchisq(2, df = 2)

ggplot() + 
  geom_line(aes(x = chisq_d,
                y = dchisq(chisq_d, df = 2)),
            size = 2)

chisq_df = data.frame(num = chisq_d,
                      V1 = dchisq(chisq_d, df = 1))
head(chisq_df)

for(n in 2:30){
  chisq_df[, paste0("V", n)] = dchisq(chisq_df$num, df = n)
}
head(chisq_df)

chisq_df_melt = melt(chisq_df, id.vars = "num")
head(chisq_df_melt)

ggplot() + 
  geom_line(data = chisq_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 누적 분포 함수 (Cumulative Distribution Function)
pchisq(2, df = 2)

ggplot() + 
  geom_line(aes(x = chisq_d,
                y = pchisq(chisq_d, df = 2)),
            size = 2)

chisq_df = data.frame(num = chisq_d,
                      V1 = pchisq(chisq_d, df = 1))
head(chisq_df)

for(n in 2:30){
  chisq_df[, paste0("V", n)] = pchisq(chisq_df$num, df = n)
}
head(chisq_df)

chisq_df_melt = melt(chisq_df, id.vars = "num")
head(chisq_df_melt)

ggplot() + 
  geom_line(data = chisq_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 분위수 함수 (Quantile Function)
qchisq(0.5, df = 2)

chisq_num = seq(0, 1, length.out = 201)[-1]
head(chisq_num)

ggplot() + 
  geom_line(aes(x = chisq_num,
                y = qchisq(chisq_num, df = 2)))

chisq_num_df = data.frame(num = chisq_num,
                          V1 = qchisq(chisq_num, df = 1))
head(chisq_num_df)

for(n in 2:30){
  chisq_num_df[, paste0("V", n)] = qchisq(chisq_num, df = n)
}
head(chisq_num_df)

chisq_num_df_melt = melt(chisq_num_df, id.vars = "num")
head(chisq_num_df_melt)

ggplot() + 
  geom_line(data = chisq_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 난수 생성 (Random Number Generation)
set.seed(345)
chisq_d_r = rchisq(200, df = 2)
head(chisq_d_r)

ggplot() + 
  geom_histogram(aes(x = chisq_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

chisq_d_r_15  = rchisq(200, df = 15)
chisq_d_r_10 = rchisq(200, df = 10)
chisq_d_r_5 = rchisq(200, df = 5)
head(chisq_d_r_5)

ggplot() + 
  geom_histogram(aes(x = chisq_d_r_15),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = chisq_d_r_10),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = chisq_d_r_5),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)


#### ____ ● 스튜던트 t 분포 ####

#### ____ ● R 함수 ####
t_d = seq(-15, 15, length.out = 200)

# 밀도 함수(Density Function)
dt(2, df = 2)

ggplot() + 
  geom_line(aes(x = t_d,
                y = dt(t_d, df = 2)),
            size = 2)

t_df = data.frame(num = t_d,
                  V1 = dt(t_d, df = 1))
head(t_df)

for(n in 2:30){
  t_df[, paste0("V", n)] = dt(t_df$num, df = n)
}
head(t_df)

t_df_melt = melt(t_df, id.vars = "num")
head(t_df_melt)

ggplot() + 
  geom_line(data = t_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 누적 분포 함수 (Cumulative Distribution Function)
pt(2, df = 2)

ggplot() + 
  geom_line(aes(x = t_d,
                y = pt(t_d, df = 2)),
            size = 2)

t_df = data.frame(num = t_d,
                  V1 = pt(t_d, df = 1))
head(t_df)

for(n in 2:30){
  t_df[, paste0("V", n)] = pt(t_df$num, df = n)
}
head(t_df)

t_df_melt = melt(t_df, id.vars = "num")
head(t_df_melt)

ggplot() + 
  geom_line(data = t_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")


# 분위수 함수 (Quantile Function)
qt(0.5, df = 2)

t_num = seq(0, 1, length.out = 201)[-1]
head(t_num)

ggplot() + 
  geom_line(aes(x = t_num,
                y = qt(t_num, df = 2)))

t_num_df = data.frame(num = t_num,
                      V1 = qt(t_num, df = 1))
head(t_num_df)

for(n in 2:30){
  t_num_df[, paste0("V", n)] = qt(t_num, df = n)
}
head(t_num_df)

t_num_df_melt = melt(t_num_df, id.vars = "num")
head(t_num_df_melt)

ggplot() + 
  geom_line(data = t_num_df_melt,
            aes(x = num,
                y = value,
                group = variable,
                color = variable)) + 
  theme(legend.position = "none")

# 난수 생성 (Random Number Generation)
set.seed(345)
t_d_r = rt(200, df = 2)
head(t_d_r)

ggplot() + 
  geom_histogram(aes(x = t_d_r),
                 bins = 50,
                 fill = "#FFFFFF",
                 color = "#000000")

t_d_r_2  = rt(200, df = 2 )
t_d_r_15 = rt(200, df = 15)
t_d_r_30 = rt(200, df = 30)
head(t_d_r_30)

ggplot() + 
  geom_histogram(aes(x = t_d_r_2),
                 bins = 25,
                 fill = "#99CCFF",
                 color = "#000000") + 
  geom_histogram(aes(x = t_d_r_15),
                 bins = 25,
                 fill = "#44BB44",
                 color = "#000000",
                 alpha = 0.4) +
  geom_histogram(aes(x = t_d_r_30),
                 bins = 25,
                 fill = "#FFAACC",
                 color = "#000000",
                 alpha = 0.4)


#### 5. 추정 ####
#### __ [01] 개요 ####
#### ____ ● 추론 통계 ####


#### ____ ● 용어 정리 ####
# ▶ 추정(estimation): 표본을 통해 모집단 특성을 추측하는 과정
# ▶ 가설검정(hypothesis): 모집단 실제값과 표본값을 이용하여 가설의 옳고 그름을 판정하는 과정
# ▶ 귀무가설(null hypothesis): 연구에서 검증하는 가설
# ▶ 대립가설(alternative hypothesis): 연구자가 연구를 통해 입증되기를 기대하는 가설(귀무가설과 반대)
# ▶ 모수적 방법(parametric method): 모집단의 특정 확률 분포를 가정하고, 해당 표본 분포의 평균과 분산을 추정
# ▶ 비모수적 방법(non-parametric method): 표본의 반복적인 복원 추출로 표본 분포를 생성하고 모집단의 분포를 추정



#### __ [02] 변환 ####
#### ____ ● 정규화 ####


#### ____ ● 표준화 ####


#### ____ ● 패키지 활용 ####
library("clusterSim")

set.seed(123)
df = data.frame(obs = 1:100,
                origin = sample(20:60, size = 100, replace = TRUE))
df[, "n1"] = data.Normalization(x = df$origin, type = "n1")
head(df)

ggplot() + 
  geom_histogram(data = df, aes(x = origin), bins = 30,
                 fill = "#FFFFFF", color = "#000000",
                 alpha = 0.5)


ggplot() + 
  geom_histogram(data = df, aes(x = n1), bins = 30,
                 fill = "#FFFFFF", color = "#000000",
                 alpha = 0.5)


#### __ [03] 점 추정 ####
#### ____ ● 점 추정 ####


#### ____ ● 용어 정리 ####


#### ____ ● 예제 코드 ####
library("MASS")

mean(survey$Height, na.rm = TRUE)
gender.response = na.omit(survey$Sex)
sum(gender.response == "Female") / length(gender.response)

# 1차원 벡터의 유일값 갯수 
length(unique(survey$Age))

#### ____ ● 좋은 점 추정량의 조건 ####
# 불편성

# 효율성

# 일치성

# 충분성


#### __ [04] 구간 추정 ####
#### ____ ● 구간 추정 ####

#### ____ ● 용어 정리 - 구간 추정 ####

#### ____ ● 정규분포 신뢰구간 관련 코드 1 ####
library("ggplot2")

nums = seq(-4, 4, length = 100)

ggplot() + 
  geom_line(aes(x = nums, y = dnorm(nums)), size = 2) + 
  geom_vline(xintercept = c(mean(nums),
                            mean(nums) - 1.96,
                            mean(nums) + 1.96), 
             color = "#FF0000", linetype = 2) + 
  geom_vline(xintercept = c(mean(nums), mean(nums) - 2.33, mean(nums) + 2.33),
             color = "#009900", linetype = 2) + 
  geom_vline(xintercept = c(mean(nums), mean(nums) - 2.58, mean(nums) + 2.58),
             color = "#0000FF", linetype = 2)


#### ____ ● 정규분포 신뢰구간 관련 코드 2 ####
pnorm(q = mean(nums) + 1.96) - pnorm(q = mean(nums) - 1.96)
pnorm(q = mean(nums) + 2.33) - pnorm(q = mean(nums) - 2.33)
pnorm(q = mean(nums) + 2.58) - pnorm(q = mean(nums) - 2.58)


#### ____ ● 모평균의 신뢰 구간 ####
set.seed(123)
x = sample(30:70, size = 15)
mean(x)

var(x)

sd(x)

t.test(x, 
       alternative = "greater",
       mu = 63.0, # 모집단 평균 입력 
       conf.level = 0.95)

t.test(x, 
       alternative = "less",
       mu = 63.0, # 모집단 평균 입력 
       conf.level = 0.95)

result_t = t.test(x, 
                  alternative = "greater",
                  mu = 63.0, # 모집단 평균 입력 
                  conf.level = 0.95)
result_t$p.value
result_t$estimate
result_t$parameter

str(result_t)

#### ____ ● 모비율의 신뢰 구간 ####
prop.test(x = 130,
          n = 200,
          p = 0.50,
          alternative = c("two.sided"),
          conf.level = 0.95)

#### 6. 가설검정 ####
#### __ [01] 개요 ####
#### ____ ● 용어 정리 ####


#### ____ ● 가설 검정 절차 ####


#### __ [02] 분할표 ####
#### ____ ● 분할표와 오류 ####


#### ____ ● 분할표 해석 ####
# 정확도

# 정밀도

# 재현율


#### ____ ● 분할표 ####
set.seed(1234)
Truth = factor(sample(0:1, size = 150, replace = TRUE), levels = 1:0)
Result = factor(sample(0:1, size = 150, replace = TRUE), levels = 1:0)
table = table(Result, Truth)
table

# Accuracy 정확도 
sum(table[1, 1], table[2, 2]) / sum(table)
# Precision 정밀도 
table[1, 1] / sum(table[1, 1:2]) 
# Recall 재현률 
table[1, 1] / sum(table[1:2, 1])

# confusion matrix 함수 

#### __ [03] 정규성 검정 ####
#### ____ ● 개요 ####


#### ____ ● Z-Score ####


#### ____ ● 표준화 ####


#### ____ ● Kolmogorov Smirnov의 적합도 검정 ####
x = rnorm(50); y = rnorm(50); z = runif(50)
ks.test(x, y)
ks.test(x, z)

#### ____ ● 기타 정규성 검정 ####
library("nortest")

z = rnorm(100)

ad.test(z)
cvm.test(z)
lillie.test(z)

pearson.test(z)
sf.test(z)
shapiro.test(z)

#### __ [04] t-검정 ####
#### ____ ● 단일 표본 t-검정 ####

#### ____ ● 단일 표본 t-검정 ####
set.seed(123)
t.test(x = rnorm(300), mu = 0)

#### ____ ● 대응 표본 t-검정 ####

#### ____ ● 대응 표본 t-검정 ####
set.seed(1234)
aa = rnorm(100, mean = 5, sd = 4)
bb = rnorm(100, mean = 8, sd = 4)
t.test(x = aa, y = bb, paired = TRUE) # paired = TRUE 

#### ____ ● 독립 표본 t-검정 ####

#### ____ ● 독립 표본 t-검정 ####
t.test(x = aa, y = bb, paired = FALSE) # paired = FALSE

#### __ [05] 등분산 검정 ####
#### ____ ● 개요 ####

#### ____ ● F-검정 ####
a = c(61, 60, 56, 63, 56, 69, 59, 56, 40, 61)
b = c(70, 54, 40, 55, 51, 61, 57, 54, 21, 20)
var.test(a, b)

# Q. a와 b를 시각화 하여 비교하시오.


