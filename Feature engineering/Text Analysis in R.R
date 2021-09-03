install.packages('tokenizers')
library('tokenizers')

rawtxt <- "Hello Mr. Smith, how are you doing today? The weather is great, and city is awesome. The sky is pinkish-blue. Seeing the sky is amazing. You shouldn't eat cardboard"
tktxt <- tokenize_sentences(rawtxt, lowercase = FALSE, strip_punct = FALSE, simplify = FALSE)
tktxt 
class(tktxt)

tktxt2 <- tokenize_lines(rawtxt, simplify = FALSE) 
tktxt2

tktxt3 <- tokenize_regex(rawtxt, pattern = "\\s+", simplify = FALSE) # \\s+ means space
tktxt3

# ------ stop word removal --------
install.packages('tm')
library('tm')

corp1 <- Corpus(VectorSource(rawtxt)) 
inspect(corp1)

# --------remove stop words
nostoptxt <- tm_map(corp1, removeWords, stopwords("english"))
inspect(nostoptxt)

# --------Stemming
stemmed <- tm_map(nostoptxt, stemDocument)
inspect(stemmed)

# -------TF/IDF 
txt <- c("banana is a fruit which is yellow", 
         "banana is the most tastiest fruit in the world", 
         "banana tastes good", 
         "banana looks like a yellow cucumber ... ha ha ha yellow", 
         "there are pink banana and blue banana as well as yellow")

corp2 <- Corpus(VectorSource(txt)) 
#-------- first lets create a document term matrix
tdmatrix <- DocumentTermMatrix(corp2)
inspect(tdmatrix)

# calcualte tf
tf <- as.matrix(tdmatrix) 
# calcualte idf
idf <- log( ncol(tf) / ( 1 + rowSums(tf != 0) ) )
idf 
# transform idf into a diagonal matrix to be able to multiply it by TF
idf <- diag(idf) 
idf

tf_idf <- crossprod(tf, idf)
colnames(tf_idf) <- rownames(tf)
tf_idf
