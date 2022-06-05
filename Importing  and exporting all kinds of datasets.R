
####Importing and exporting all kinds of data  in R #####


### It is important to set the working directory to where the datasets are located 
setwd("~/Desktop/R programming/data") # setting a working directory
getwd() # to identify your working directory

## Pacman helps to organize all your libraries within a single line
if(!require("pacman")) install.packages("pacman")
if(!require("rio")) install.packages("rio")
if(!require("tidyverse")) install.packages("tidyverse")
pacman::p_load(pacman, rio, tidyverse, readxl, readr )
# pacman is used in loading and unloading packages 
 
# rio is used for importing data
# tidyverse is used for tibble, ggplots and many others 


# Reading a .txt dataset 
 
airplanes<-read.delim("airplanes.txt", header = FALSE, sep = ",") # read the data
View(airplanes) 

# Reading the .txt data 
airplanes_2<-read.table("airplanes.txt", header = FALSE, sep = ",")
view(airplanes_2)

# Another way 
my_airplane <- read.delim(file.choose(), header = FALSE, sep = ",")
View(my_airplane)

# Reading a CSV dataset 
diamonds<-read.csv("diamonds.csv", header = TRUE) # read the data
View(diamonds) 

## Another way
diamond<-read.table("diamonds.csv", sep = ",", header = TRUE)
view(diamond)

# Another way
if(!require("readr"))install.packages("readr")
library(readr)
diamond_d<-read_csv("diamonds.csv", col_names = TRUE) #This is a faster version of read.table
View(diamond_d)

# Reading a Excel files dataset 
library(rio) #using the Rio
statedata<-import("StateData.xlsx")
View(statedata)

#Another way is by using the readxl function 
if(!require("readxl"))install.packages("readxl")
library(readxl)

statedata<-read_excel("StateData.xlsx")
View(statedata)

# Reading data from the internet
library(tidyverse)
library(rio)
data<-import("https://web.njit.edu/~wguo/Math644_2012/data020101.txt", header = FALSE)
view(data)
#Renaming all the columns 
names(data)[1]<-"y"   # first column
names(data)[2]<-"x1"  # second column
names(data)[3]<-"x2"  # third column
names(data)[4]<-"x3"  # forth column
view(data)

library(tidyverse)
gpa<-read.delim("https://web.njit.edu/~wguo/Math644_2012/GPA.txt", sep = "")
View(gpa)
gpa<-gpa %>%as_tibble %>% select(X., the) 

view(gpa)
names(gpa)[1]<- "GPA" # changing the name of column 1 to GPA
names(gpa)[2]<- "ACT" # changing the name of column 2 to ACT
view(gpa)


# Exporting all the data in other extensions 
data
write.csv(data, "data.csv")
iris
write.csv(iris, "iris_data.csv")
write_delim(iris,"iris22_file.txt")

swiss
write_delim(swiss, "Swiss_data.txt")

statedata
write.csv(statedata, "STATE.csv")

state.x77
write.csv(state.x77, "United_States.csv")



