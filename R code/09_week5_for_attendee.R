#### .=========.####
#### | [[ Week 5 ]] ####
#### .=========.####

# 하나씩 실행시키세요.
install.packages("tidyverse")
install.packages("dplyr")
install.packages("reshape2")
install.packages("psych")

install.packages("intergraph")
install.packages("network")
install.packages("igraph")
install.packages("sna")

install.packages("ggplot2")
install.packages("ggnetwork")
install.packages("wordcloud")

library("tidyverse")
library("dplyr")
library("reshape2")
library("psych")

library("intergraph")
library("network")
library("igraph")
library("sna")

library("ggplot2")
library("ggnetwork")
library("wordcloud")


#### 1. 4주차 복습 ####
#### 2. 고급 텍스트 처리 ####
#### ____ ● 정규표현식 ####
# 실습 데이터 만들기
text1 = "1234 asdfASDF  ㄱㄴㄷㄹㅏㅑㅓㅕ가나다라   .!@#"
text2 = "<a> <ab> <abc> <abcd>"
text3 = c("aaa", "bbb", "ccc", "abc")

# 네이버 실시간 검색어 
gsub("<.*?>", "", grep("ah_k", readLines("https://www.naver.com", encoding = "UTF-8"), value = TRUE))[1:20]

# 활용 함수
# ▶ gsub(): 패턴 치환
# ▶ grep(): 매칭되는 패턴을 포함하는 데이터 또는 그 위치를 출력
# ▶ grepl(): 패턴 매칭 결과를 논리값(TRUE/FALSE)으로 반환
# ▶ gregexpr(): 주어진 데이터에서 패턴이 매칭되는 결과를 리스트 형식으로 출력
# ▶ regmatches(): 패턴 매칭

# 숫자 치환
gsub(pattern = "", replacement = "@", x = text1) # 빈문자열 "@"로 치환 
gsub(pattern = "[0-9]", replacement = "@", x = text1) # 숫자만 "@"로 치환 
gsub(pattern = "[0-9]", replacement = "", x = text1) # 숫자만 제거 


# 영문 치환
# __ 소문자 치환
gsub(pattern = "[a-z]", replacement = "", x = text1)

# __ 대문자 치환
gsub(pattern = "[A-Z]", replacement = "", x = text1)

# 한글 치환
gsub(pattern = "[ㄱ-힣]", replacement = "", x = text1) # 한글 마지막 글자 : 힣 

# __ 자음 치환
gsub(pattern = "[ㄱ-ㅎ]", replacement = "", x = text1)

# __ 모음 치환
gsub(pattern = "[ㅏ-ㅣ]", replacement = "", x = text1)

# __ 완성형 치환
gsub(pattern = "[가-힣]", replacement = "", x = text1)

# 띄어쓰기 치환
gsub(pattern = " ", replacement = "@", x = text1)
gsub(pattern = "  ", replacement = "@", x = text1)
gsub(pattern = "   ", replacement = "@", x = text1)

gsub(pattern = "  ", replacement = " ", x = text1)
gsub(pattern = "   ", replacement = " ", x = text1)

# 응용
# __ 숫자가 아닌 모든 문자 치환
gsub(pattern = "[^0-9]", replacement = "@", x = text1)

# __ 영문자가 아닌 모든 문자 치환
gsub(pattern = "[^a-zA-Z]", replacement = "@", x = text1)
gsub(pattern = "[^A-z]", replacement = "@", x = text1)

# __ 한글이 아닌 모든 문자 치환
gsub(pattern = "[^ㄱ-힣]", replacement = "@", x = text1)

# __ 숫자와 영문 대문자가 아닌 모든 문자 치환
gsub(pattern = "[^0-9A-Z]", replacement = "@", x = text1)

# __ 숫자 2, 3만 치환
gsub(pattern = "2|3", replacement = "@", x = text1)
gsub(pattern = "[2-3]", replacement = "@", x = text1)
gsub(pattern = "[23]", replacement = "@", x = text1) # 권장하지 않음. []는 범위 설정 기능 
gsub(pattern = "[2,3]", replacement = "@", x = "123,235452 aba") # "2"와 "3"과 ","가 처리됨

# __ 숫자 2, 3, 4, 7, 8, 9 치환
gsub(pattern = "[2-47-9]", replacement = "@", x = text1)
gsub(pattern = "2[0-9]", replacement = "@", x = "23 24 25 33")
gsub(pattern = "2[0-9]{2}", replacement = "@", x = "236 246 256 336 21") # 200~ 숫자만 치환 
# {} : {} 직전 패턴이 {} 안의 숫자만큼 반복 
gsub(pattern = "2[5-9]|3[0-4]", replacement = "@", x = 20:40) # 25 ~ 34 치환 

# __ '.'의 치환
gsub(pattern = ".", replacement = "@", x = text1) # 모든 문자열(.) 치환 
gsub(pattern = "\\.", replacement = "@", x = text1) # 기본 함수는 \\, 일부 패키지 함수는 \ 

# __ 두 칸 띄어쓰기와 세 칸 띄어쓰기의 치환
gsub(pattern = "  |   ", replacement = " ", x = text1)
gsub(pattern = " {2}| {3}", replacement = " ", x = text1)
gsub(pattern = " {2,3}", replacement = " ", x = text1) # 2번 반복 또는 3번 반복 

gsub(pattern = " {2,}", replacement = " ", x = text1) # 2번 이상 반복 문자열 처리 

# pattern 아규먼트가 있는 함수는 대부분 정규식표현이 적용된다. 

gsub(pattern = "[^0-9A-zㄱ-ㅎ ]", replacement = "", x = text1)
gsub(pattern = "[[:punct:]]", replacement = "", x = text1) # 특수문자 제거 
gsub(pattern = "[[:space:]]", replacement = "", x = text1) # 공백 제거 


# 정규표현식 regexp cheat sheet for r
# https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf

# __ "asdf"와 "가나다라" 치환

# __ 1, 3 치환

# __ 1~3, 7~9 치환

# 특수문자내 문자 처리
# __ 모든 경우의 수 치환
text2 
gsub(pattern = "<.*?>", replacement = "@", x = text2) # < > 사이에 포함된 모든 문자열 
gsub(pattern = "\\(.*?\\)", replacement = "@", x = text2) # ( ) 사이에 포함된 모든 문자열 

# __ 내부 문자 1개 치환
gsub(pattern = "<.>", replacement = "@", x = text2) 
gsub(pattern = "<.{1}>", replacement = "@", x = text2) 
gsub(pattern = "<[A-z]{1}>", replacement = "@", x = text2) 

# __ 내부 문자 2~4개 치환
# <> 안에 문자가 2-4개 문자열이 있는 경우 치환 
gsub(pattern = "<.{2,4}>", replacement = "@", x = text2) 


# 텍스트 조건
# __ "a"를 포함하는 원소 추출
text3
grep(pattern = "a", x = text3) 
text3[grep(pattern = "a", x = text3)] # 가능함
grep(pattern = "a", x = text3, value = TRUE) # 추천함 

# __ "b"를 포함하는 원소 추출
grep(pattern = "b", x = text3, value = TRUE)

# __ "b"로 시작하는 원소 추출
grep(pattern = "^b", x = text3, value = TRUE)

# __ "a"로 끝나는 원소 추출
grep(pattern = "a$", x = text3, value = TRUE)


# working directory 파일 목록 추출 
list.files(pattern = "")

# Q. csv 로 끝나는 파일명만 추출하시오 
list.files(pattern = "csv$")


# __ "a"또는 "b"를 포함하는 원소 추출
grep(pattern = "a|b", x = text3, value = TRUE)



# grepl() 함수의 활용
# TRUE, FALSE 로 결과 표시 
grepl(pattern = "^b", x = text3)
!grepl(pattern = "^b", x = text3) # 반대로 추출 

# 참고 사이트 
# https://regexr.com/

text = "adsf1234adsf"
gregexpr(patter = "[0-9]", text = text)
gregexpr(patter = "[0-9]{2}", text = text)
gregexpr(patter = "[0-9]{4}", text = text)

dd = gregexpr(patter = "[0-9]", text = text)
attr(dd[[1]], "match.length")
attr(dd[[1]], "index.type")

df_match = data.frame(pos = dd[[1]],
                      length = attr(dd[[1]], "match.length"))

df_match

for(n in 1:nrow(df_match)) {
  print(substr(text, df_match[n, 1], df_match[n, 1] + df_match[n, 2] - 1))
}

dd = regmatches(x = text, 
                m = gregexpr(pattern = "[0-9]",
                             text = text))
class(dd) # list 
unlist(dd)
class(unlist(dd)) # vector

#### ____ ● 실전 예제 ####
# ▶ regexpr_example.txt
#### _____ L Q1 ####
# 파일을 읽어들여 이미지 파일 주소를 추출하고 데이터프레임으로 정제하시오.
source = readLines("regexpr_example.txt")
head(source)
length(source)


# test = "aaaa https://cbu01.alicdn.com/img/ibank/2018/014/137/8636731410_1399793676.400x400.jpg  a"

# .{20,80} : 문자열이 20 ~ 80 글자 
# "https.{20,80}\\.(jpg|png|gif)" : jpg 또는 png, gif 파일 
# "https.{20,80}\\.jpg|https.{20,80}\\.png" 동일 
# .*? : 모든 문자열, 이상한 것도 딸려오는 경우가 있음. 
# 60x60, 400x400 제외하고 가져올 수도 있겠다. 
# 결과 : list 
source_img = regmatches(x = source, 
                        m = gregexpr(pattern = "https.{20,80}\\.(jpg|png)", 
                                     text = source)) 

# vector로 변경 
source_img = unlist(source_img) 

# data.frame 변경 
df_img = data.frame(obs = 1:length(source_img),
                    url = source_img)
  
head(df_img)



#### 3. 텍스트 분석 ####
#### __ [01] 워드 클라우드 ####
# library("wordcloud2") : 특정 이미지(물고기, 새 등) 모양의 워드클라우드 생성 가능 

library("wordcloud")
words = readRDS("wordcloud.rds")
head(words) # vector ? 
words = sort(rowSums(words), decreasing = TRUE)
df = data.frame(word = names(words),
                freq = words)
head(df, 10)

set.seed(1234)
wordcloud(words = df$word, 
          freq = df$freq, 
          min.freq = 2,
          max.words = 200, 
          colors = brewer.pal(8, "Dark2"))

#### __ [02] 문서 분류 ####

# ▶ news_ecommerce_lda_k10.csv
news = read.csv("news_ecommerce_lda_k10.csv", stringsAsFactors = FALSE)
head(news)

#### _____ L Q1 ####
# Q1. 첫 번째 부터 열 번째 column의 기술통계량을 확인하시오.
# topic1 ~ topic10 : 기사가 해당 토픽일 확률 
summary(news[, 1:10])
psych::describe(news[, 1:10])

#### _____ L Q2 ####
# Q2. year, month, press column
# Q2-1. (year) 자료는 몇 년도 부터 몇 년도 까지 기록되어있는가?
summary(news$year) # 2014 ~ 2017 

min(news$year) # 2014
max(news$year) # 2017 

# Q2-2. (month) 자료는 몇 월 부터 몇 월 까지 기록되어있는가?
summary(news$month)

# Q2-3. (press) 몇 종류의 언론사명이 자료에 존재하는가?
unique(news$press)
length(unique(news$press))


#### _____ L Q3 ####
# Q3. 자료의 분할
# Q3-1. df객체의 첫 번째 부터 열 번째 column을 뽑아 df_topic 이라는 새로운 객체에 할당하시오.
df_topic = news[, 1:10]
df_topic

# Q3-2. df객체의 열한번째 부터 마지막 column까지,
# 2015년 10월 부터 2016년 3월까지 추출하여 
#       df_sub 이라는 새로운 객체에 할당하시오.
news[, "time"] = as.Date(paste(news$year, news$month, "01", sep = "-")) # 2018-11-01 형태 
head(news)

df_sub = news[(news$time >= "2015-10-01") & (news$time >= "2016-03-01"), 11:ncol(news)]
unique(news$time)

#### _____ L Q4 ####
# Q4. 고급 필터링
# Q4-1. df_topic의 첫 번째 부터 열 번째 column까지 row별로 가장 높은 값의 위치를 추출하여
#       df_topic 객체에 "topic_no"라는 새로운 column을 만들어 붙이시오. 
#       ※ which() 함수 활용
df_topic[, "topic_no"] = apply(df_topic[, 1:10], 
                               MARGIN = 1, 
                               FUN = "which.max") 
head(df_topic)

max(df_topic[1, 1:10])
df_topic[1, 1:10] == max(df_topic[1, 1:10])
which(df_topic[1, 1:10] == max(df_topic[1, 1:10]))

for(n in 1:nrow(df_topic)){
  df_topic[n, "topic_no"] = which(df_topic[n, 1:10] == max(df_topic[n, 1:10]))
}

which_max = function(x){
  which(x == max(x))
}

df_topic[, "topic_no"] = apply(df_topic[, 1:10],
                               MARGIN = 1,
                               FUN = "which_max") # 사용자정의 함수 적용 
head(df_topic)


# Q4-2. df_topic객체에서 topic_no가 3인 row를 추출하여 df_topic_3이라는 새로운 객체에 할당하시오.
df_topic_3 = df_topic[df_topic$topic_no == 3, ]

df_topic_3

# Q5. 
# 월별 토픽별 누적합을 계산하시오. 
# aggregate() 

df_topic = news
which_max = function(x){
  which(x == max(x))
}
df_topic[, "topic_no"] = apply(df_topic[, 1:10],
                               MARGIN = 1,
                               FUN = "which_max") # 사용자정의 함수 적용 

df_topic_agg = aggregate(data = cbind(df_topic, 
                                      value = 1), # 건수 계산 편의를 위해서 value 칼럼을 임의로 처리 
                         value ~ month + topic_no,
                         FUN = "sum")

head(df_topic_agg)

library("ggplot2")
ggplot(data = df_topic_agg, 
       aes(x = month,
           y = value,
           color = as.factor(topic_no),
           group = as.factor(topic_no))) +
  geom_point(size = 4, alpha = 0.5) + 
  geom_point(size = 2.5) + 
  geom_line(size = 1.2)


# 빅콘테스트 
# 모든 경우의 수 생성 
expand.grid(1:4, LETTERS[1:3]) 



#### 4. Social Network Analysis ####
#### __ [01] 개요 ####
#### ____ ● 목적 ####
#### ____ ● Social Metrics ####
# http://www.socialmetrics.co.kr/

#### __ [02] 실전 예제 ####
#### ____ ● 교우관계 네트워크 분석 ####
library("dplyr")
library("igraph")

df = read.csv("network_friends.csv", stringsAsFactors = FALSE)
df = df[df$relationship != 0, ]
df[, "relationship_2"] = 1
head(df)

# 색상 설정
color_df = data.frame(major = unique(df$major),
                      color = c("#225378", "#1695A3", "#ACF0F2", "#F3FFE2", "#EB7F00"),
                      stringsAsFactors = FALSE)
df = left_join(df, color_df, by = c("major" = "major"))
head(df)

df_graph_sub = df
graph = graph.data.frame(df_graph_sub[, c("from", "to" , "relationship_2")],
                         directed = TRUE)
V(graph)$label.color = "#000000"
V(graph)$color = df_graph_sub$color
V(graph)$size = sqrt(igraph::degree(graph)) * 2 + 2

par(mar = c(0, 0, 0, 0))
plot(graph, 
     vertex.label.dist = 1.5, 
     vertex.label.cex = 0.7,
     edge.arrow.size = 0.5,
     vertex.shape = ifelse(df_graph_sub$sex == 2, "square", "circle"))


df_degree = data.frame(names = names(igraph::degree(graph)),
                       degree = igraph::degree(graph),
                       stringsAsFactors = FALSE)
df_degree = df_degree[order(-df_degree$degree), ]
row.names(df_degree) = NULL
head(df_degree)

#### 15학번 이하 ####
df_graph_sub = df[df$num %in% 12:15, ] # 12학번 ~ 15학번 
# df_graph_sub = df[df$num %in% 12:15, ] # 13학번 
graph = graph.data.frame(df_graph_sub[, c("from", "to" , "relationship_2")],
                         directed = TRUE)
V(graph)$label.color = "#000000"
V(graph)$color = df_graph_sub$color
V(graph)$size = sqrt(igraph::degree(graph)) * 3 + 2
# E(graph)$label = aggregate(formula = relationship ~ from, 
#                            data = df_graph_sub,
#                            FUN = "sum")[, 2]

par(mar = c(0, 0, 0, 0))
plot(graph, 
     vertex.label.dist = 1.5, 
     vertex.label.cex = 0.7,
     edge.arrow.size = 0.5,
     vertex.shape = ifelse(df_graph_sub$sex == 2, "square", "circle"))


df_degree = data.frame(names = names(igraph::degree(graph)),
                       degree = igraph::degree(graph),
                       stringsAsFactors = FALSE)
df_degree = df_degree[order(-df_degree$degree), ]
row.names(df_degree) = NULL
head(df_degree)



#### __ [03] 기초 예제 ####
#### ____ ● 기본 네트워크 ####
#### ______ 1) 패키지 준비 ####
library("igraph")

#### ______ 2) 무향 네트워크 생성 ####
# 방법 1

# 방법 2

#### ______ 3) 유향 네트워크 생성 ####
# 방법 1

# 방법 2


#### ____ ●  임의의 네트워크 생성 ####
#### ______ 1) 패키지 준비 ####
library("ggnetwork")
library("network")
library("sna")

#### ______ 2) 데이터 준비 ####
n_size = 8

# 방법 1
set.seed(1)
mat_net = rgraph(n_size, tprob = 0.2)

# 방법 2
set.seed(1)
df = data.frame(from  = sample(1:15, size = 88, replace = TRUE),
                to    = sample(1:15, size = 88, replace = TRUE),
                value = 1)

#### ______ 3) 네트워크 생성 ####
n = network(mat_net, directed = FALSE)

# network 패키지의 함수!!
# set.vertex.attribute()

#### ______ 4) 네트워크 속성 확인 ####
# 네트워크 크기

# 네트워크 attribute 확인

# 네트워크의 특정 attribute에 할당된 값 추출

# 특정 node에 연결된 node 정보를 추출하시오.



#### ______ 5) 네트워크 그리기 ####
gg_net = ggnetwork(n)
ggplot(data = gg_net,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(aes(linetype = type), size = 1) +
  theme_blank()

#### ____ ● 다양한 네트워크 ####
#### ______ 1) 비어있는 그래프 ####
ng = make_empty_graph(40)
plot(ng)

#### ______ 2) 완전 연결 그래프 ####
ng = make_full_graph(40)
plot(ng)

#### ______ 3) 트리 그래프 ####
ng = make_tree(40)
plot(ng)

#### ______ 4) 고리 그래프 ####
ng = make_ring(40)
plot(ng)

#### ______ 5) Erdos-Renyi 그래프 ####
ng = sample_gnm(n = 100, m = 50)
plot(ng)

#### ____ ● 연습 문제 ####
#### ______ 1) ####
# 이름이 A, B, C, D인 4개의 node가 존재할 때
# 각 node끼리 순환연결이 되는 네트워크를 생성하시오.
# 단, 방향은 없는 것으로 한다(무향 그래프).
# 해당 네트워크를 그래프로 그려 확인하시오.

#### ______ 2) ####
# 문제 1번에서 생성한 네트워크의 코드를 활용하시오.
# A node에 순환경로가 생성되도록 node E를 추가하시오.

# 방법 1

# 방법 2

#### ______ 3) ####
# 이름이 A, B, C, D인 4개의 node가 존재할 때
# 각 node끼리 순환연결이 되는 네트워크를 생성하시오.
# 단, 방향은 임의로 지정한다(유향 그래프).


#### ______ 4) ####
# 문제 3번에서 작성한 코드를 참고하시오.
# 문제 3번에서 만든 네트워크와 방향이 반대인 유향 그래프를 생성하시오.

# 방법 1

# 방법 2

#### ______ 5) ####
# 크기가 30인 임의의 무향 그래프를 생성하시오. (tprob = 0.1)
# edge의 "join" attribute에 14부터 17까지 단순 임의 복원추출을 사용하여 값을 지정하시오.
# 단, set.seed(1)로 지정하여 연산을 수행하시오.

#### ______ 6) ####
# 문제 5에서 생성한 네트워크에서 각종 정보를 추출하시오.
#  - 네트워크 크기
#  - "join" attribute의 값을 모두 추출하시오.
#  - 인접 node와 연결이 가장 많이 되어있는 node를 추출하시오.


#### 5. 크롤링 맛보기 ####
#### __ [01] 개요 ####
#### ____ ● 크롤링(Crawling)? ####
#### ____ ● 크롤러(Crawler)의 활용 ####
# DDoS 오인
# robots.txt
# https://www.naver.com/robots.txt
# https://www.daum.net/robots.txt
# https://www.google.com/robots.txt
# https://www.clien.net/robots.txt

#### ____ ● 각종 도구 ####
#### ____ ● 필요 기술 ####
# 웹페이지 구조
# HTML
# 자료구조
# 통신


# HTML / CSS / JavaScript

#### __ [02] URL ####
#### ____ ● URL 이해하기 ####

#### __ [03] 실시간 검색어 크롤링 ####
#### ____ ● 실시간 검색어 크롤링 ####
#### ____ ● 네이버 실시간 검색어 ####
text = readLines("http://www.naver.com")
Encoding(text) = "UTF-8"
text_sub = grep(pattern = "ah_k", text, value = TRUE)[1:20] # <span class="ah_k">코오롱몰</span>

for(n in 1:length(text_sub)){
  start_p = gregexpr(text_sub[n], pattern = ">")[[1]][1] + 1 # 첫번째 ">" 의 다음부터 
  end_p = gregexpr(text_sub[n], pattern = "<")[[1]][2] - 1 # 두번째 "<" 의 앞자리까지 
  text_sub[n] = substr(text_sub[n], start_p, end_p)
}

text_sub


text = readLines("https://www.naver.com", encoding = "UTF-8")
text_sub = grep(pattern = "ah_k", x = text, value = TRUE) # value = TRUE : 위치가 아닌 데이터를 표시 
text_sub = text_sub[1:20]
gsub(pattern = "<.*?>", replacement = "", x = text_sub) # "<", ">" 사이에 있는 내용 제거 


#### ____ ● Zum ####
text = readLines("http://www.zum.com/", encoding = "UTF-8")
text_sub = grep(pattern = "d_keyword", x = text, value = TRUE)
text_sub = text_sub[seq(from = 1, to = 40, by = 2)]
# text_sub = text_sub[(1:20) * 2 - 1] # 동일 
gsub(pattern = "<.*?>", replacement = "", x = text_sub)


#### ____ ● Daum ####
text = readLines("https://www.daum.net/", encoding = "UTF-8")
text_sub = grep(pattern = "txt_issue", x = text, value = TRUE)
text_sub = text_sub[-grep(pattern = "txt_issue\\{", x = text_sub)] # 앞부분 일부 스크립트 제거 필요 
text_sub = text_sub[seq(from = 1, to = 40, by = 2)]
gsub(pattern = "<.*?>", replacement = "", x = text_sub)

#### __ [04] SNS 크롤링 ####
#### ____ ● SNS 크롤링 목적 ####
#### ____ ● 주의 사항 ####



install.packages("RSelenium")
library("RSelenium")

drv = wdman::phantomjs(port = 4444L, verbose = FALSE)
sel = remoteDriver()
sel$open(silent = TRUE) # ??? 오류 

sel$navigate("https://www.naver.com")
sel$screenshot(display = TRUE)
sel$findElement(using = "css selector",
                value = "#account > div > a> i")$clickElement()
sel$screenshot(display = TRUE)
