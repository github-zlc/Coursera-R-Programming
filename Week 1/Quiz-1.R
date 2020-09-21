# class of x <- 4L and x <- c(4, TRUE)
x <- 4L
class(x)

x <- c(4, TRUE)
class(x)

# x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
x <- c(1,3,5)
y <- c(3,2,10)
rbind(x,y)

# x <- list(2, "a", "b", TRUE). What does x[[1]] give me?
x <- list(2, "a", "b", TRUE)
x[[1]]

# x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
x <- 1:4
y <- 2:3
x + y

#  x <- c(3, 5, 1, 10, 12, 6), set all elements that are less than 6 to be equal to zero
x <- c(3, 5, 1, 10, 12, 6)
x[x<6] <- 0
x
x[x<=5] <- 0
x
x[x<6] <- 0
x
x[x %in% 1:5] <- 0
x

# Quiz data set problems

data <- read.csv("hw1_data.csv")
data[1:2,]
data[152:153,]
data[47,]$Ozone
length(which(is.na(data[,1])=="TRUE"))

Ozonecomplete <- data[,1][complete.cases(data[,1])]
mean(Ozonecomplete)

Solar <- data[data$Ozone > 31 & data$Temp > 90,]$Solar.R
mean(Solar[complete.cases(Solar)])

Temp <- data[data$Month == "6",]$Temp
mean(Temp[complete.cases(Temp)])

Ozone <- data[data$Month == "5",]$Ozone
sort(Ozone[complete.cases(Ozone)],decreasing = T)
