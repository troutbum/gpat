library(RColorBrewer)
library(wordcloud)
library(tm)

colors1 <- brewer.pal(9, "Greens")
palette1 <- colorRampPalette(colors1)
colors2 <- brewer.pal(9, "YlOrRd")
palette2 <- colorRampPalette(colors2)

pal <- brewer.pal(9,"BuGn")

mywords <-c("Accuracy",
            "Agility",
            "Balance",
            "Coordination",
            "Endurance",
            "Flexibility",
            "Power",
            "Stamina",
            "Strength",
            "Speed")
myfreq <- c(10, 8, 8, 8, 6, 6, 6, 5, 5, 1)
data <- data.frame(word = mywords, freq = myfreq)

wordcloud(data$word, data$freq, scale=c(3,1), max.words=100, random.order=TRUE, random.color=FALSE,
          rot.per=0.5, use.r.layout=FALSE, colors=rainbow(10),
          ordered.colors=TRUE)

wordcloud(data$word, data$freq, scale=c(3,.5), max.words=100, random.order=TRUE, random.color=FALSE,
          rot.per=0.5, use.r.layout=FALSE, colors=rainbow(10))

wordcloud(data$word, data$freq, scale=c(3,.5), max.words=100, random.order=TRUE, random.color=FALSE,
          rot.per=0.5, use.r.layout=FALSE, colors=brewer.pal(10, "Set3"))




wordcloud(
        "Many years ago the great British explorer George Mallory, who
was to die on Mount Everest, was asked why did he want to climb
it. He said, \"Because it is there.\"
Well, space is there, and we're going to climb it, and the
moon and the planets are there, and new hopes for knowledge
and peace are there. And, therefore, as we set sail we ask
God's blessing on the most hazardous and dangerous and greatest
adventure on which man has ever embarked.",
        ,random.order=FALSE)
## Not run:
data(crude)
crude <- tm_map(crude, removePunctuation)
crude <- tm_map(crude, function(x)removeWords(x,stopwords()))
##### from corpus #####
wordcloud(crude)

##### from frequency counts #####
tdm <- TermDocumentMatrix(crude)
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
wordcloud(d$word,d$freq)
#A bigger cloud with a minimum frequency of 2
wordcloud(d$word,d$freq,c(8,.3),2)
#Now lets try it with frequent words plotted first
wordcloud(d$word,d$freq,c(8,.5),2,,FALSE,.1)
##### with colors #####
if(require(RColorBrewer)){
        pal <- brewer.pal(9,"BuGn")
        pal <- pal[-(1:4)]
        wordcloud(d$word,d$freq,c(8,.3),2,,FALSE,,.15,pal)
        pal <- brewer.pal(6,"Dark2")
        pal <- pal[-(1)]
        wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,,.15,pal)
        #random colors
        wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,TRUE,.15,pal)
}
##### with font #####
wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,,.15,pal,
          vfont=c("gothic english","plain"))
wordcloud(d$word,d$freq,c(8,.3),2,100,TRUE,,.15,pal,vfont=c("script","plain"))
wordcloud(d$word,d$freq,c(8,.3),2,100,TRUE,,.15,pal,vfont=c("serif","plain"))
## End(Not run)
}