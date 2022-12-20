#importing libraries   
library(magrittr) 
library(dplyr)  
library(reticulate)
library(expm)
library(fastDummies)
library(corrplot)
library(Hmisc)
library(NeuralNetTools)
library(nnet)
library(neuralnet)
set.seed(333)
library(nnet)

data <- read.csv("~/Desktop/Hurricane_Project-main/data.csv", header = TRUE)
head(data)



#cheching na values
which(is.na(data$duration))
which(is.na(data$lat))
which(is.na(data$pressure))

#repace the NA's with the column mean
data$pressure[is.na(data$pressure)] <- mean(data$pressure, na.rm=TRUE)

data <- dummy_cols(data, select_columns = "category", remove_selected_columns = TRUE)
head(data)
data <- dummy_cols(data, select_columns = "month", remove_selected_columns = TRUE)
head(data) #latest

# Train Test Split
set.seed(1)

data = subset(data, select  = -c( storm_id, name, year, date))
head(data)

#use 70% of dataset as training set and 30% as test set
sample <- sample(c(TRUE, FALSE), nrow(data), replace=TRUE, prob=c(0.7,0.3))
train  <- data[sample, ]
test   <- data[!sample, ]

dim(train)
dim(test)
head(train)

x_train = subset(train, select  = -c(damage))
y_train = subset(train, select = c(damage))
x_test = subset(test, select  = -c(damage))
y_test = subset(test, select = c(damage))
head(x_train)
head(x_test)
head(y_train)
head(y_test)

dim(train)
dim(test)
head(train)

#Without scaling
nn <- neuralnet(damage~., data=train, hidden=c(42), stepmax = 10000, lifesign = 'full',linear.output = FALSE,  rep = 2, algorithm = 'backprop', learningrate = 0.01)
plot(nn) 
garson(nn) 


nn <- neuralnet(damage~., data=train, hidden=c(42, 42), stepmax = 10000, lifesign = 'full',linear.output = FALSE,  rep = 2, algorithm = 'backprop', learningrate = 0.1)
plot(nn) 
#garson(nn) 

mod <- nnet(damage~., data = train, size = 42)
plotnet(mod) #without scaling
garson(mod) #without scaling

##################


scale <- function(x) {
  return ((x-mean(x)) / (max(x) - min(x)))
}

colnames(data)
scaled_data = subset(data, select = c(duration, wind, pressure, lat, long, rainfall, elevation))
head(scaled_data)


scaled_data <- as.data.frame(lapply(scaled_data, scale))
head(scaled_data)

scaled_data$category_0 = data$category_0
scaled_data$category_1 = data$category_1
scaled_data$category_2 = data$category_2
scaled_data$category_3 = data$category_3
scaled_data$category_4 = data$category_4
scaled_data$category_5 = data$category_5

scaled_data$month_5 = data$month_5
scaled_data$month_6 = data$month_6
scaled_data$month_7 = data$month_7
scaled_data$month_8 = data$month_8
scaled_data$month_9 = data$month_9
scaled_data$month_10 = data$month_10
scaled_data$month_11 = data$month_11

scaled_data$damage = data$damage


#use 70% of dataset as training set and 30% as test set
sample <- sample(c(TRUE, FALSE), nrow(scaled_data), replace=TRUE, prob=c(0.7,0.3))
train  <- scaled_data[sample, ]
test   <- scaled_data[!sample, ]

nn <- neuralnet(damage~., data=train, hidden=c(42), stepmax = 10000, lifesign = 'full',linear.output = FALSE,  rep = 2, algorithm = 'backprop', learningrate = 0.01)
plot(nn) 
garson(nn) 


nn <- neuralnet(damage~., data=train, hidden=c(42, 42), stepmax = 10000, lifesign = 'full',linear.output = FALSE,  rep = 2, algorithm = 'backprop', learningrate = 0.1)
plot(nn) 
#garson(nn) 

mod <- nnet(damage~., data = train, size = 42)
plotnet(mod) 
garson(mod) 





