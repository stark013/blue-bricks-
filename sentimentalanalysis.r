library(syuzhet)
library(tm)
library(wordcloud2)

txt <- readLines(file.choose())

docs = Corpus(VectorSource(txt))

docs = tm_map(docs,tolower)
docs = tm_map(docs , removeNumbers)
docs = tm_map(docs , removePunctuation)
docs = tm_map(docs , removeWords , stopwords("english"))
docs = tm_map(docs , stripWhitespace)
inspect(docs[3])

tdm = TermDocumentMatrix(docs)
tdm

dtm = t(tdm)
dtm

tdm =as.matrix(tdm)
tdm[1:5,1:30]

tdm

w <- rowSums(tdm)
w_subset <- subset(w,w>=2)
w1 <- data.frame(names(w),w)
colnames(w1) <- c('names' , 'freq')

w1

wordcloud2(w1,shape="circle",size=0.5)
barplot(w_subset,las=2)

txt = iconv(txt,"UTF-8")
txt1 <- get_nrc_sentiment(txt)
txt1
barplot(colSums(txt1), las = 2,col=rainbow(20))

s1<-get_sentiment(txt,methods = "nrc")
s2<-get_sentiment(txt,methods = "bing")
s3<-get_sentiment(txt,method = "afinn")


s1
s2
s3

