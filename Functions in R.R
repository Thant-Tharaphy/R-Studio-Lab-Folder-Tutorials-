# What is function ? 
# A function accepts input arguments and produces the output by executing valid R commands 
# that are inside the function.

# Parameters or Arguments in R Functions

# Parameters =  the variables defined in the function definition.
# Arguments =  the actual values passed to the function when it is called.

#Example
add_num <- function(a,b)
{
  sum_result <- a+b
  return(sum_result)
}
sum = add_num(35,34)

print(sum)

# Function Parameter Rules

# Syntax 

# function_name <- function(arg1, arg2, ... )
# { 
#  code 
# }

# Example :

calculate_square <- function(x) {
  result <- x^2
  return(result)
}

value1 <- 5
square1 <- calculate_square(value1)
print(square1)  

value2 <- -2.5
square2 <- calculate_square(value2)
print(square2)

# Function to Check if a Number is Divisible by 5

divisbleBy5 <- function(n){
  if(n %% 5 == 0)
  {
    return("number is divisible by 5")
  }
  else
  {
    return("number is not divisible by 5")
  }
}

# Function call
divisbleBy5(100)
divisbleBy5(4)
divisbleBy5(20.0)


# Adding Multiple Arguments in R

# Function definition
# To check a is divisible by b or not
divisible <- function(a, b){
  if(a %% b == 0)
  {
    return(paste(a, "is divisible by", b))
  }
  else
  {
    return(paste(a, "is not divisible by", b))
  }
}

# Function call
divisible(7, 3)
divisible(36, 6)
divisible(9, 2)


# Adding Default Value in R

# default value in a function is a value that is not required to specify each time 
# the function is called.

divisible <- function(a, b = 3){
  if(a %% b == 0)
  {
    return(paste(a, "is divisible by", b))
  }
  else
  {
    return(paste(a, "is not divisible by", b))
  }
}

# Function call
divisible(10, 5)
divisible(12)

# Function as Argument

# In R programming, functions can be passed to another functions as arguments.

# Function definition
# Function is passed as argument

fun <- function(x, fun2){
  return(fun2(x))
}

# sum is built-in function
fun(c(1:10), sum)

# mean is built-in function
fun(rnorm(50), mean)