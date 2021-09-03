install.packages("rvest")
library(rvest)

met688 <- read_html("https://www.bu.edu/academics/met/courses/met-cs-688")
met688
class(met688)

met688 <- read_html("https://www.bu.edu/academics/met/courses/met-cs-688") 
aaa <- html_nodes(met688, '.cf-course') %>% html_text() 
aaa

# too big to show
b<- html_nodes(met688, '.container')%>% html_text() 
b

