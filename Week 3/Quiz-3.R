#Q1

library(datasets)
data(iris)
?iris
x <- iris[which(iris$Species == "virginica"),]
round(mean(x$Sepal.Length))

#Q2
apply(iris[, 1:4], 2, mean)

#Q3
library(datasets)
data(mtcars)

tapply(mtcars$mpg,mtcars$cyl, mean)
sapply(split(mtcars$mpg,mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))

#Q4
hp_mean <- tapply(mtcars$hp,mtcars$cyl, mean)
round(abs(hp_mean[1]-hp_mean[3]))

#Q5
debug(ls)
ls
