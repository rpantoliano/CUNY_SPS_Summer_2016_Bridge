# Author: Richard Pantoliano
# Assignment: HW #3 Data Science Math

# Problem 1
print(round(pnorm(979,mean=1300,sd=sqrt(40000),lower.tail=FALSE ), 4) )

# Problem 2
print(round(pnorm(8340,mean=11000,sd=sqrt(1960000),lower.tail=FALSE ), 4) )

# Problem 3

sd1 <- 3000000
mean1 <- 80000000
prob <- pnorm(85000000, mean=mean1, sd=sd1) - pnorm(83000000, mean=mean1, sd=sd1)
print(round(prob, 4) )

# Problem 4
print(round(qnorm(.86, mean=456, sd=123)))

# Problem 5
# Lower bound
print(round(qnorm(.07, mean=6.13, sd=.06),2))

# Upper bound
print(round(qnorm(.93, mean=6.13, sd=.06),2))

# Problem 6
# lower bound
print(round(qnorm(.20, mean=78.8, sd=9.8)))

# Upper bound
print(round(qnorm(.45, mean=78.8, sd=9.8, lower.tail = FALSE)))

#Problem 7
print(round(qnorm(.45, mean=21.2, sd=5.4, lower.tail = FALSE),1))


#Problem 8
print(round(pbinom(11, 151,.09),4))

# Problem 9
print(round(pnorm(48.83,mean=48,sd=7/sqrt(147),lower.tail=FALSE ), 4) )

#Problem 10
print(round(pnorm(93.54,mean=91,sd=10/sqrt(68),lower.tail=FALSE ), 4) )


#Problem 11
print(round(qnorm(.45, mean=78.8, sd=9.8, lower.tail = FALSE)))

# Problem 12



# Problem 13
error <- qnorm(0.9, sd=.8)*.8/sqrt(209)

# Lower Bound
print(round(3.9 - error, 1))

#upper bound
print(round(3.9 + error,1))


# Problem 14
error <- qnorm(0.99, sd=11)*11/sqrt(7472)

# Lower Bound
print(round(16.6 - error),1)

#upper bound
print(round(16.6 + error),1)


# Problem 15
#Step 1: top-right pic
# Step 2:
print(qt(.05,df=2))

# Problem 16
#Step 1:
x <- c(383.6, 347.1, 371.9, 347.6, 325.8, 337)
smean <- mean(x)
print(round(smean, 2))

#Step 2:
sdev <- sd(x)
print(round(sdev,2))

#Step 3
error <- qnorm(0.95, sd=sdev)*sdev/sqrt(6)
print(round(error), 2)

#Step 4
# Lower Bound
print(round(smean - error), 2)

#upper bound
print(round(smean + error), 2)


#Problem 17
# Step 1:
smean <- 46.4
sdev <- 2.45
error <- qnorm(0.90, sd=sdev)*sdev/sqrt(16)
print(round(error), 2)

#Step 2
# Lower Bound
print(round(smean - error), 2)

#upper bound
print(round(smean + error), 2)


# Problem 18
sdev <- 1.9
error <- .13
cinterval <- .995
smean <- (qnorm(cinterval,sd=sdev)*sdev/error)^2
print(ceiling(smean))

# Problem 19
sdev <- sqrt(3.61)
error <- .19
cinterval <- .975
smean <- (qnorm(cinterval,sd=sdev)*sdev/error)^2
print(ceiling(smean))

# Problem 20
#Step 1
smean <- 1734/2089
print(round(smean,3))

# Step 2
sdev <-smean
error <- qnorm(0.99, sd=sdev)*sdev/sqrt(2089)
print(round(error), 2)

# Lower Bound
print(round(smean - error), 3)

#upper bound
print(round(smean + error), 3)

# Problem 21
#Step 1
smean <- 156/474
print(round(smean,3))

# Step 2
sdev <-smean
error <- qnorm(0.975, sd=sdev)*sdev/sqrt(474)
print(round(error), 2)

# Lower Bound
print(round(smean - error), 3)

#upper bound
print(round(smean + error), 3)
