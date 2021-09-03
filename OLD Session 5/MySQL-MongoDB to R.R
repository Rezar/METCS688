#-------- Connecting R to mySQL
install.packages("RMySQL")
library("RMySQL")

db_sql=dbConnect(MySQL(),user="root",
                 host="127.0.0.1",
                 dbname="met622",
                 password="root",
                 port=3306)

tableData <- dbGetQuery(db_sql, "SELECT * FROM pet")
tableData


#-------- Connecting R to mongoDB
install.packages("mongolite")
library(mongolite)

m <- mongo("test", url = "mongodb://localhost:27017/test")
inventory_col = mongo(collection = "inventory", db = "test")

inventory_col$find('{}')
