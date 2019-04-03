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

# 활용 함수
# ▶ gsub(): 패턴 치환
# ▶ grep(): 매칭되는 패턴을 포함하는 데이터 또는 그 위치를 출력
# ▶ grepl(): 패턴 매칭 결과를 논리값(TRUE/FALSE)으로 반환
# ▶ gregexpr(): 주어진 데이터에서 패턴이 매칭되는 결과를 리스트 형식으로 출력
# ▶ regmatches(): 패턴 매칭

# 숫자 치환

# 영문 치환
# __ 소문자 치환

# __ 대문자 치환

# 한글 치환
# __ 자음 치환

# __ 모음 치환

# __ 완성형 치환

# 띄어쓰기 치환

# 응용
# __ 숫자가 아닌 모든 문자 치환

# __ 영문자가 아닌 모든 문자 치환

# __ 한글이 아닌 모든 문자 치환

# __ 숫자와 영문 대문자가 아닌 모든 문자 치환

# __ 숫자 2, 3만 치환

# __ 숫자 2, 3, 4, 7, 8, 9 치환

# __ '.'의 치환

# __ 두 칸 띄어쓰기와 세 칸 띄어쓰기의 치환

# __ "asdf"와 "가나다라" 치환

# __ 1, 3 치환

# __ 1~3, 7~9 치환

# 특수문자내 문자 처리
# __ 모든 경우의 수 치환

# __ 내부 문자 1개 치환

# __ 내부 문자 2~4개 치환


# 텍스트 조건
# __ "a"를 포함하는 원소 추출

# __ "b"를 포함하는 원소 추출

# __ "b"로 시작하는 원소 추출

# __ "a"로 끝나는 원소 추출

# __ "a"또는 "b"를 포함하는 원소 추출

# grepl() 함수의 활용


# 참고 사이트
# https://regexr.com/

#### ____ ● 실전 예제 ####
# ▶ regexpr_example.txt
#### _____ L Q1 ####
# 파일을 읽어들여 이미지 파일 주소를 추출하고 데이터프레임으로 정제하시오.




#### 3. 텍스트 분석 ####
#### __ [01] 워드 클라우드 ####
library("wordcloud")
words = readRDS("wordcloud.rds")
words = sort(rowSums(words), decreasing = TRUE)
df = data.frame(word = names(v),
                freq = v)
head(df, 10)

set.seed(1234)
wordcloud(words = df$word, freq = df$freq, min.freq = 2,
          max.words = 200, colors = brewer.pal(8, "Dark2"))

#### __ [02] 문서 분류 ####
# ▶ news_ecommerce_lda_k10.csv
df = read.csv("news_ecommerce_lda_k10.csv",
              stringsAsFactors = FALSE)
head(df)


#### _____ L Q1 ####
# Q1. 첫 번째 부터 열 번째 column의 기술통계량을 확인하시오.
summary(df[, 1:10])
psych::describe(df[, 1:10])


#### _____ L Q2 ####
# Q2. year, month, press column
# Q2-1. (year) 자료는 몇 년도 부터 몇 년도 까지 기록되어있는가?
unique(df$year)
min(df$year)
max(df$year)

# Q2-2. (month) 자료는 몇 월 부터 몇 월 까지 기록되어있는가?
unique(df$month)
min(df$month)
max(df$month)

# Q2-3. (press) 몇 종류의 언론사명이 자료에 존재하는가?
unique(df$press)
length(unique(df$press))

#### _____ L Q3 ####
# Q3. 자료의 분할
# Q3-1. df객체의 첫 번째 부터 열 번째 column을 뽑아 df_topic 이라는 새로운 객체에 할당하시오.
df_topic = df[, 1:10]

# Q3-2. df객체의 열한번째 부터 마지막 column까지,
# 2015년 10월 부터 2016년 3월까지 추출하여 
#       df_sub 이라는 새로운 객체에 할당하시오.
head(df)
df[, "time"] = as.Date(paste(df$year, df$month, "01", sep = "-"))
# sapply(df, "class")

df_sub = df[(df$time >= "2015-10-01") & (df$time <= "2016-03-01"), ]
unique(df_sub$time)

df[, "time_2"] = paste(df$year, df$month, sep = "-")
head(df)

# timeline = c("2015-10", "2015-11" ~~~~)
timeline = paste(rep(2015:2016, each = 3), 
                 c(10:12, "01", "02", "03"), sep = "-")
# sprintf(fmt = "%02d", 1:3)

df_sub = df[df$time_2 %in% timeline, ]


#### _____ L Q4 ####
# Q4. 고급 필터링
# Q4-1. df_topic의 첫 번째 부터 열 번째 column까지 row별로 가장 높은 값을 추출하여
#       df_topic 객체에 "topic_no"라는 새로운 column을 만들어 붙이시오. 
#       ※ which() 함수 활용
df_topic[, "topic_no"] = apply(df_topic[, 1:10], 
                               MARGIN = 1, 
                               FUN = "which.max")
head(df_topic)

max(df_topic[1, 1:10])
df_topic[1, 1:10] == max(df_topic[1, 1:10])
which(df_topic[1, 1:10] == max(df_topic[1, 1:10]))

which_max = function(x){
  which(x == max(x))
}

df_topic[, "topic_no"] = apply(df_topic[, 1:10], 
                               MARGIN = 1, 
                               FUN = "which_max")
head(df_topic)

# Q4-2. df_topic객체에서 topic_no가 3인 row를 추출하여 df_topic_3이라는 새로운 객체에 할당하시오.
df_topic_3 = df_topic[df_topic$topic_no == 3, ]



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
                      color = c("#225378", "#1695A3", "#ACF0F2",
                                "#F3FFE2", "#EB7F00"),
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
df_graph_sub = df[df$num %in% 12:15, ]
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
# sample_g = graph(edges = c(1, 2, 2, 3, 3, 1), n = 3, directed = FALSE) 
sample_g = graph(edges = c(1, 2, 
                           2, 3, 
                           3, 1), 
                 n = 3, directed = FALSE) 
sample_g
plot(sample_g)

# 방법 2
df = data.frame(from = c(1, 2, 3),
                to   = c(2, 3, 1))

edges = unlist(df)

sample_g = graph(edges = edges,
                 n = 3, directed = FALSE) 
sample_g
plot(sample_g)


#### ______ 3) 유향 네트워크 생성 ####
# 방법 1
sample_g = graph(edges = c(1, 2, 
                           2, 3, 
                           3, 1), 
                 n = 3, directed = TRUE) 
sample_g
plot(sample_g)


# 방법 2
df = data.frame(from = c(1, 2, 3),
                to   = c(2, 3, 1))
edges = matrix(unlist(df), nrow = 2, byrow = TRUE)
edges = as.vector(edges)

sample_g = graph(edges = edges,
                 n = 3, directed = TRUE) 
sample_g
plot(sample_g)

sample_ggn = ggnetwork(sample_g)
ggplot(data = sample_ggn,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(arrow = arrow(length = unit(1, "lines"), type = "closed")) +
  geom_nodes(size = 7) + 
  geom_nodetext(aes(label = vertex.names), 
                color = "#FFFFFF",
                fontface = "bold") +
  theme_bw()

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
# colnames(mat_net) = LETTERS[1:n_size]
# rownames(mat_net) = LETTERS[1:n_size]
mat_net

# 방법 2
set.seed(1)
df = data.frame(from  = sample(1:15, size = 88, replace = TRUE),
                to    = sample(1:15, size = 88, replace = TRUE),
                value = 1)

library("reshape2")
df_cast = acast(df, from ~ to, fun.aggregate = function(x){ifelse(length(x) >= 1, 1, 0)})
df_cast

mat_net = as.matrix(df_cast)

#### ______ 3) 네트워크 생성 ####
n = network(mat_net, directed = FALSE)
n %v% "family" = sample(letters[1:3], size = n_size, replace = TRUE)
n %v% "importance" = sample(1:3, size = n_size, replace = TRUE)
edges = network.edgecount(n)

network::set.edge.attribute(x = n, attrname = "type", 
                            value = sample(letters[24:26], edges, replace = TRUE))
network::set.edge.attribute(x = n, attrname = "day", 
                            value = sample(1:3, edges, replace = TRUE))

# set.vertex.attribute()

#### ______ 4) 네트워크 속성 확인 ####
# 네트워크 크기
network.size(n)

# 네트워크 attribute 확인
names(n$mel[[1]]$atl)[-1]

# 네트워크의 특정 attribute에 할당된 값 추출
network::get.edge.attribute(n, attrname = "type")

# 특정 node에 연결된 node 정보를 추출하시오.
get.edgeIDs(x = n, v = 2)
network::get.edges(x = n, v = 3)

edge_info = network::get.edges(x = n, v = 3)

df_edge_info = data.frame(e_in  = unlist(lapply(edge_info, FUN = "[", 1)),
                          e_out = unlist(lapply(edge_info, FUN = "[", 2)))

df_edge_info = data.frame(e_in  = unlist(lapply(edge_info, FUN = "[", 1)),
                          e_out = unlist(lapply(edge_info, FUN = "[", 2)),
                          type  = unlist(lapply(lapply(edge_info, FUN = function(x){lapply(X = `[`(x)$atl, FUN = "[")}), "[", 1)),
                          day   = unlist(lapply(lapply(edge_info, FUN = function(x){lapply(X = `[`(x)$atl, FUN = "[")}), "[", 1)))

sna::degree(n)
sna::degree(n, cmode = "outdegree")
sna::degree(n, cmode = "indegree")


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
par(mar = c(0, 0, 0, 0))
plot(ng)

#### ____ ● 연습 문제 ####
#### ______ 1) ####
# 이름이 A, B, C, D인 4개의 node가 존재할 때
# 각 node끼리 순환연결이 되는 네트워크를 생성하시오.
# 단, 방향은 없는 것으로 한다(무향 그래프).
# 해당 네트워크를 그래프로 그려 확인하시오.
library("igraph")
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A"), directed = FALSE) 
sample_g
plot(sample_g)

#### ______ 2) ####
# 문제 1번에서 생성한 네트워크의 코드를 활용하시오.
# A node에 순환경로가 생성되도록 node E를 추가하시오.

# 방법 1
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A",
                           "E", "A", 
                           "A", "E"), directed = FALSE) 
sample_g
plot(sample_g)

# 방법 2
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A"), directed = FALSE) 

sample_g = igraph::add.vertices(graph = sample_g, nv = 1)
plot(sample_g)

igraph::get.vertex.attribute(sample_g)

sample_g = set_vertex_attr(graph = sample_g, name = "name", value = c(LETTERS[1:4], "E"))
plot(sample_g)

sample_g = igraph::add.edges(graph = sample_g, edges = c("A", "E", "E", "A"))
plot(sample_g)

#### ______ 3) ####
# 이름이 A, B, C, D인 4개의 node가 존재할 때
# 각 node끼리 순환연결이 되는 네트워크를 생성하시오.
# 단, 방향은 임의로 지정한다(유향 그래프).
sample_g = graph(edges = c("A", "B", 
                           "B", "C", 
                           "C", "D",
                           "D", "A"), directed = TRUE) 
plot(sample_g)


#### ______ 4) ####
# 문제 3번에서 작성한 코드를 참고하시오.
# 문제 3번에서 만든 네트워크와 방향이 반대인 유향 그래프를 생성하시오.

sample_g = graph(edges = c("B", "A", 
                           "C", "B", 
                           "D", "C",
                           "A", "D"), directed = TRUE) 
plot(sample_g)

# 방법 2
edges = rev(c("A", "B", 
              "B", "C", 
              "C", "D",
              "D", "A"))
sample_g = graph(edges = edges, directed = TRUE) 
plot(sample_g)

#### ______ 5) ####
# 크기가 30인 임의의 무향 그래프를 생성하시오. (tprob = 0.1)
# edge의 "join" attribute에 14부터 17까지 단순 임의 복원추출을 사용하여 값을 지정하시오.
# 단, set.seed(1)로 지정하여 연산을 수행하시오.
set.seed(1)
mat_net = network(rgraph(30, tprob = 0.1), directed = FALSE)
network::set.vertex.attribute(x = mat_net, attrname = "join",
                              value = sample(14:17, replace = TRUE,
                                             size = network.edgecount(mat_net)))
plot(mat_net)

gg_net = ggnetwork(mat_net)
ggplot(data = gg_net,
       aes(x = x, 
           y = y, 
           xend = xend, 
           yend = yend)) +
  geom_edges(size = 1) +
  geom_nodes(aes(color = as.factor(join)), size = 8) +
  theme_blank() + 
  labs(color = "Join")

#### ______ 6) ####
# 문제 5에서 생성한 네트워크에서 각종 정보를 추출하시오.
#  - 네트워크 크기
#  - "join" attribute의 값을 모두 추출하시오.
#  - 인접 node와 연결이 가장 많이 되어있는 node를 추출하시오.
network.size(mat_net)
str(mat_net)
unique(unlist(lapply(mat_net$val, "[[", 3)))

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
text = readLines("https://www.naver.com", encoding = "UTF-8")
text_sub = grep(pattern = "ah_k", text, value = TRUE)[1:20]
for(n in 1:length(text_sub)){
  start_p = gregexpr(text_sub[n], pattern = ">")[[1]][1] + 1
  end_p   = gregexpr(text_sub[n], pattern = "<")[[1]][2] - 1
  text_sub[n] = substr(text_sub[n], start_p, end_p)
}
text_sub

gsub("<.*?>", "", grep("ah_k", readLines("https://www.naver.com", encoding = "UTF-8"), value = TRUE))[1:20]

#### ____ ● Zum ####
unique(gsub("<.*?>", "", grep("d_keyword", value = T, readLines("http://zum.com", encoding = "UTF-8"))))

#### ____ ● Daum ####
text = readLines("https://www.daum.net/", encoding = "UTF-8")
text_sub = grep(pattern = "txt_issue", x = text, value = TRUE)
unique(gsub(pattern = "<.*?>", replacement = "", text_sub))[-(1:4)]


unique(gsub("<.*?>", "", grep("txt_issue", value = T, readLines("https://www.daum.net/", encoding = "UTF-8"))))[-(1:4)]


#### __ [04] SNS 크롤링 ####
#### ____ ● SNS 크롤링 목적 ####
#### ____ ● 주의 사항 ####



# R 참고 사이트 
# https://www.r-bloggers.com