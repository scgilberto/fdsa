library(RPostgreSQL)
library(dplyr)
library(dbplyr)

?dbConnect
# link https://stackoverflow.com/questions/36026436/error-in-postgresqlnewconnectiondrv-rs-dbi-driver-could-not-connect-pos
db <- DBI::dbConnect(odbc::odbc(),
                     Driver = "{PostgreSQL ODBC Driver(ANSI)}",
                     Database = "treinamento_py",
                     UserName = "postgres",
                     Password = "admin362_python2023",
                     Servername = "localhost",
                     Port = 5432)
