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
  # geom_col()
  geom_bar(stat = "identity")


# 그래프 1
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(expand = c(0.01, 0.01))

# 그래프 2
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) +
  geom_bar(stat = "identity") +
  scale_x_discrete(expand = c(0.5, 0.5))

# 그래프 3
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(expand = c(0.01, 0.01))

# 그래프 4
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(expand = c(0.5, 0.5))


#### ____ ● 최대, 최소값 설정 ####
# 그래프 1
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2)

# 그래프 2
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_x_continuous(limits = c(5, 10))

# 그래프 3
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(limits = c(20, 80))

# 그래프 4
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(limits = c(0, 200))


#### ____ ● 구간 설정 ####
# 그래프 1
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_x_continuous(breaks = c(5, 10),
                     labels = c(5, 10))

ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_x_continuous(breaks = c(5, 10),
                     labels = c("ㅋ", "ㅎ"))


# 그래프 2
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(breaks = seq(0, 100, 10),
                     labels = seq(0, 100, 10))

ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(breaks = seq(0, 100, 10),
                     labels = LETTERS[1:11])

ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) +
  geom_line(size = 2) +
  scale_y_continuous(breaks = seq(0, 100, 10),
                     labels = paste0(0:10, "k"))


#### __ [10] 요소 설정 ####
#### ____ ● 기호 변경 ####
# 데이터 준비
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
ggplot(dat = bar_df, aes(x = obs,
                         y = value,
                         color = value)) +
  geom_point(size = 10,
             shape = 1)

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10,
             shape = 2)

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) + 
  geom_point(size = 10) + 
  scale_shape_manual(values = c("A" = 7,
                                "B" = 8,
                                "C" = 9))

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10,
             shape = "★")

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10,
             shape = "헐")



#### ____ ● 기호 모음 ####
# google: shape in r


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
  theme(axis.title = element_text(size = 10))

# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.title = element_text(size = 10,
                                  face = "bold"))

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.title = element_text(size = 10,
                                  face = "bold",
                                  angle = 45))

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.title = element_text(size = 30,
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
  labs(x = "title_x_axis",
       y = "title_y_axis",
       title = "This is title") +
  theme(axis.title = element_text(size = 30),
        title = element_text(size = 40))

ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) +
  labs(x = "title_x_axis",
       y = "title_y_axis",
       title = "This is title",
       color = "Legend") +
  theme(axis.title = element_text(size = 30),
        title = element_text(size = 40))

# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  scale_x_continuous(name = "X_axis_title") +
  scale_y_continuous(name = "Y_axis_title") + 
  ggtitle("Your Title") +
  theme(axis.title = element_text(size = 30),
        title = element_text(size = 40))

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
  theme(axis.title.x = element_text(size = 30,
                                    face = "bold",
                                    angle = 45))

# 그래프 4
ggplot(data = bar_df, aes(x= obs,
                          y = value,
                          color = value)) +
  geom_point(size = 10) +
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
  geom_hline(yintercept = 100, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 10)


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
  geom_vline(xintercept = 10, size = 2, colour = "#44FF44", alpha = 0.7, linetype = 10) 

# Q. geom_vline() 함수 하나로 
#    위 코드의 결과와 같은 것을 구현하시오.
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          colour = value)) +
  geom_point(size = 10) +
  geom_vline(xintercept = 1:10, 
             color = rep(c("red", "blue"), each = 5))



#### ____ ● annotate() 함수 ####
# 텍스트(geom = "text")
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
  annotate(geom = "Segment",
           color = "#FF0000",
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
           x = 7, y = 3,
           ymin = 2, ymax = 5)


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
# top, bottom, left, right
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


#### ____ ● 텍스트 ####
# 그래프 3
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value,
           shape = var)) +
  geom_point(size = 10) +
  theme(legend.text = element_text(size = 15))

# 그래프 4
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value,
           shape = var)) +
  geom_point(size = 10) +
  theme(legend.text = element_text(size = 20))


#### ____ ● 기타 ####
# 그래프 5
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value,
           shape = var)) +
  geom_point(size = 10) +
  theme(legend.key.size = unit(x = 0.5, units = "cm"))

# 그래프 6
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value,
           shape = var)) +
  geom_point(size = 10) +
  theme(legend.key.size = unit(x = 2, units = "cm"))


#### __ [14] 다양한 그래프 #### 
#### ____ ● 히스토그램 ####
ggplot(diamonds, aes(x = price,
                     fill = cut)) +
  geom_histogram(binwidth = 500)

# 그래프 퀴즈: Very Good 이상 등급만 사용하여 그리시오.
ggplot(diamonds[diamonds$cut %in% c("Very Good", "Premium", "Ideal"), ], 
       aes(x = price,
           fill = cut)) +
  geom_histogram(binwidth = 500)

class(diamonds$cut)
diamonds$cut[1]

ggplot(diamonds[diamonds$cut >= "Very Good", ], 
       aes(x = price,
           fill = cut)) +
  geom_histogram(binwidth = 500)



#### ____ ● Dot plot ####
data("mtcars")

ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5)


#### ____ ● Ribbon + Line ####
data("LakeHuron")
huron = data.frame(year  = 1875:1972,
                   level = as.vector(LakeHuron))

ggplot(huron, aes(x = year)) + 
  geom_ribbon(aes(ymin = level - 1,
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
  facet_wrap( ~ cut, ncol = 3)

ggplot(diamonds,
       aes(x = carat,
           y = price,
           color = price)) +
  geom_point() +
  facet_wrap( ~ cut, ncol = 5) + 
  theme(legend.position = "none")

#### ____ ● 병합 ####
library("ggExtra")
library("ggplot2")

set.seed(1234)
df = data.frame(x = c(rnorm(500, mean = -1), rnorm(500, mean = 1.5)),
                y = c(rnorm(500, mean = -1), rnorm(500, mean = 1.7)))

p = ggplot(df, aes(x, y)) +
  geom_point()

ggMarginal(p,
           type = "histogram",
           fill = "steelblue",
           color = "darkblue",
           bins = 50)

ggMarginal(p,
           type = "density",
           fill = "steelblue",
           color = "darkblue")

#### ____ ● 흐름도 ####
library("ggparallel")
library("ggplot2")
data("Titanic")
titanic = as.data.frame(Titanic)

ggparallel(data   = titanic,
           vars   = names(titanic)[c(1, 2, 4, 1)],
           order  = 0,
           weight = "Freq") + 
  scale_fill_brewer(palette  = "Paired", guide = "none") + 
  scale_color_brewer(palette = "Paired", guide = "none") + 
  scale_x_discrete(  expand = c(0.01, 0.01)) + 
  scale_y_continuous(expand = c(0.01, 0.01))


#### ____ ● 막대그래프 중첩 ####
df = data.frame(Quarter = paste0("Q", 1:4),
                Team_A = c(1320000, 700000, 300000, 123000),
                Team_B = c( 600000, 500000, 400000, 123000),
                Team_C = c( 250000, 300000, 500000, 123000),
                Team_D = c( 150000, 100000, 600000, 123000))
df_melt = reshape2::melt(df, id.vars = "Quarter")

library("ggplot2")
ggplot(data = df_melt, aes(x = variable, y = value)) +
  theme(plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_rect(size = 1, fill = NA)) +
  geom_col(fill = "cyan", alpha = 0.25) +
  geom_hline(yintercept = seq(0, 2.5, by = 0.5) * 1000000, color = "#FFFFFF", size = 2) +
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

ggplot(data = df, aes(x = xx,
                      y = yy)) +
  geom_line(size = 2) + 
  geom_point(size = 9) + 
  geom_point(size = 7,
             color = "#FFFFFF") +
  geom_point(data = data.frame(a = c(2, 8),
                               b = c(2, 8)),
             aes(x = a, y = b),
             size = 7,
             color = "#FFAACC")


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
mean(c(1:3, NA, 23), na.rm = T)

# 글자가 포함되어 있는 값의 평균 계산
mean(c(1:3, "사과", 23))

# na.rm 파라미터 추가
mean(c(1:3, "사과", 23), na.rm = TRUE)


#### ____ ● 중앙값 - median() ####


#### ____ ● 최빈값 ####
mode = function(x){
  ux = unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

mode(c(1, 1, 1, 2, 3, 4, 4))


#### ____ ● 분산과 표준편차 - var(), sd() ####
var(c(1, 3, 5, 2, 7, 10))
sd(c(1, 3, 5, 2, 7, 10))


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
number = number[order(number)]
number

# 최소값/최대값/평균값
min(number)
max(number)
mean(number)

# 복원 추출 / 비복원 추출
1:100
numbers = 1:100
sample(numbers, size = 10, replace = TRUE)
sample(numbers, size = 10, replace = FALSE)

# 추출 방법별 특징 비교
numbers_2 = 10:20
sample(numbers_2, size = 20, replace = TRUE)

sample(numbers_2, size = 20, replace = FALSE)

#### __ [04] 분위수와 상자그림 ####
#### ____ ● 사분위수와 상자그림 ####


#### ____ ● 분위수 함수 - quantile() ####
quantile(0:100)

#### ____ ● psych 패키지 활용 ####
library("psych")

data("iris")
head(iris, 3)

describe(iris)

#### __ [05] 상관 분석 ####
#### ____ ● 상관 계수의 정의 ####


#### ____ ● 상관 계수의 특징 ####


#### ____ ● 두 집단간 상관 계수 확인 ####
# 데이터 준비
set.seed(53779)
aa = runif(100)
bb = runif(100)

# 두 집단의 상관계수 계산
cor.test(aa, bb)
cor(aa, bb)
  
#### ____ ● 상관 행렬 ####
# 데이터 준비
bike = read.csv("bike.csv",
                stringsAsFactors = FALSE)
head(bike, 3)

# 상관 행렬의 생성
cor_matrix = cor(bike[, 2:9])
round(cor_matrix, 4)


#### ____ ● 상관 행렬의 시각화 1 ####
library("corrplot")
corrplot(cor_matrix)

corrplot(cor_matrix, method = "color", addCoef.col = TRUE,
         order = "hclust", hclust.method = "ward.D",
         outline = TRUE, tl.srt = 45)

#### ____ ● 상관 행렬의 시각화 2 ####
library("ggplot2")
library("GGally")
data("flea", package = "GGally")
ggpairs(flea, columns = 2:4)
ggpairs(flea, columns = 2:4, aes(color = species))


#### ____ ● 예제 ####


#### ____ ● 쉬어가기 ####
# http://guessthecorrelation.com/


#### ____ ● 상관과 인과 ####


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
df[order(df$yy), "yy"][1:3]

# 상위 3개 값 추출
df[order(-df$yy), "yy"][1:3]

# 하위 3개 값의 row 추출
df[df$yy %in% df[order(df$yy), "yy"][1:3], ]

# 상위 3개 값의 row 추출
df[df$yy %in% df[order(-df$yy), "yy"][1:3], ]


# 분위수 활용
quantile(df$yy, probs = 0.95)
df[df$yy > quantile(df$yy, probs = 0.95),] 

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


set.seed(1228)
df = as.matrix(Orange)
df[sample(1:(nrow(df) * ncol(df)), size = 10)] = NA
df = as.data.frame(df)
head(df, 3)

# 벡터 연산
df[is.na(df$Tree), ]
df[is.na(df$age), ]

df[is.na(df$Tree) | is.na(df$age), ]
df[is.na(df$Tree) & is.na(df$age), ]

# summary()
summary(df)


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
mat_melt = melt(mat)
colnames(mat_melt) = c("simulation", "sample_size", "mean")

#### ____ ● 표본 개수에 따른 표본 분포 시뮬레이션 ####
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
norm_d = seq(-3, 3, length.out = 200)
norm_d

dnorm(x = 0)

ggplot() + 
  geom_line(aes(x = norm_d,
                y = dnorm(norm_d)),
            size = 2) + 
  geom_point(aes(x = 0,
                 y = dnorm(x = 0)),
             size = 4,
             color = "red")

#### ____ ● 누적 분포 함수 ####
pnorm(q = 0)

ggplot() + 
  geom_line(aes(x = norm_d,
                y = pnorm(norm_d)),
            size = 2) + 
  geom_point(aes(x = 0,
                 y = pnorm(q = 0)),
             size = 4,
             color = "red")


#### ____ ● 분위수 함수 ####
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
normal_d

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
normal_d = rnorm(1000, mean = 15)

ggplot() + 
  geom_histogram(aes(x = normal_d),
                 bins = 100,
                 fill = "#FFFFFF",
                 color = "#000000",
                 size = 1.2) + 
  theme(axis.text.x = element_text(size = 20,
                                   face = "bold"))

set.seed(123)
normal_d = rnorm(1000, sd = 1)

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
library("moments")
kurtosis(1:100)
kurtosis(rnorm(n = 100))
kurtosis(rnorm(n = 100, sd = 2))
kurtosis(rnorm(n = 100, sd = 10))

#### ____ ● 관련 이론 ####


#### ____ ● 왜도 ####
skewness(1:100)
skewness(rnorm(n = 100))


#### ____ ● 관련 이론 ####


#### ____ ● 정규분포의 왜도 계산 시물레이션 ####
trials = 2000 # 시뮬레이션 횟수
nums_df = c()

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

gender.response = na.omit((survey$Sex))
sum(gender.response == "Female") / length(gender.response)

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

t.test(x, alternative = "greater", 
       mu = 63.0, conf.level = 0.95)

result_t = t.test(x, alternative = "greater", 
                  mu = 63.0, conf.level = 0.95)
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

sum(table[1, 1], table[2, 2])/sum(table) # Accuracy
table[1, 1]/sum(table[1, 1:2]) # Precision
table[1, 1]/sum(table[1:2, 1]) # Recall



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
t.test(x = rnorm(300, mean = 1), mu = 0)
?t.test


#### ____ ● 대응 표본 t-검정 ####

#### ____ ● 대응 표본 t-검정 ####
set.seed(1234)
aa = rnorm(100, mean = 5, sd = 4)
bb = rnorm(100, mean = 8, sd = 4)
t.test(x = aa, y = bb, paired = TRUE)


#### ____ ● 독립 표본 t-검정 ####

#### ____ ● 독립 표본 t-검정 ####
t.test(x = aa, y = bb, paired = FALSE)


#### __ [05] 등분산 검정 ####
#### ____ ● 개요 ####

#### ____ ● F-검정 ####
a = c(61, 60, 56, 63, 56, 69, 59, 56, 40, 61)
b = c(70, 54, 40, 55, 51, 61, 57, 54, 21, 20)


# Q. a와 b를 시각화 하여 비교하시오.