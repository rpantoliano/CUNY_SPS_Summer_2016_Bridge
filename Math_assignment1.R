#Richard Pantoliano
#CUNY SPS Data Analytics Summer Bridge
# Math Assignment 1
install.packages("Deriv")
install.packages("rootSolve")
install.packages("mosaic")
install.packages("pracma")
library(pracma)
library(Deriv)
library(rootSolve)
library(mosaic)

# Problem 18
fx = function(x){(x^3)/3340000 - (7*x^2)/9475 + (42417727*x)/1265860000 + 1/33}
s = seq(1,30)
a = fx(s)
print(max(a))    # Max number of packages delivered
match (max(a),a) # Day max number delivered

# Problem 20
fx = function(x){-6*x^3 + 27*x^2 + 180*x}
fpx = Deriv(fx)
fppx = Deriv(fpx)
roots = uniroot.all(fpx, c(-100,100)) # determine x coords of critical points
print(roots)
fx(roots) # Show critical points

# problem 22
cx = function(x){8*x^2 + 221184 / x} # Cost function with one variable
dx = Deriv(cx)
roots = uniroot.all(dx, c(0,10000))
print(dx)
print(roots) # Gives critical points
ddx = Deriv(dx)
ddx(roots) # Positive; shows that it is a minimum
print(18432/roots^2) # Give missing height dimension using the volume equation

# Problem 23
cx = function(x){ 28.8* x + 52.8 * (1056 / x)}
dx = Deriv(cx)
print(dx) # Shows a non-quadratic as first derivative, so no roots to check, must solve to find critical point at dx = 0

# Problem 24
a = 67000
x = 7
x1 = 9
y = 37000
r = 1 - exp(1)^(log(y/a)/x)
print(r)
y1 = a * (1 - r) ^ x1
print(y1)


#Problem 27
antiD(380 - 4 * x ~ x) # Gives the integral
c = 1700 - 380*38 + 2*(38^2) # Calculate the constant from the integral
px = function(x){ 380 * x - 2*x^2 + c}
px(56) 

#problem 29
pt = function(t){ 75 - 9 * t^.5}
integrate(pt,0,9)


#problem 30
x = function(x){6*sqrt(x) - 6*x^2} #Bounded area = integral of (higher function - lower function) 
integrate(x,0,1) #region bounded between 0 and 1, where both functions intersect

#problem 32
fx = function(x){x*sqrt(x+7)}
integrate(fx,-7,2)

#problem 33
fx = function(x){46 * ((1-.22^x)/(1-.22))}
fx(20) #Finds the sum up to the 20th term of the geometric sum
46 / (1-.22) #Finds the infinite some of the geometric series

#problem 34
fx = function(x){3*exp(1)^(5*x-3)}
taylor(fx, 4, 5)

