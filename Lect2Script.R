#######################################################################
#                 Data Structures and Manipulation
#######################################################################
getwd()
setwd("C:\\Users\\Denisa\\Documents\\Rfolder")

# 1. Object creation:
#a. Expression
3+3
exp(2)
?exp
help(exp)
2*3
10/4
log(1)
2^3
sqrt(2)
#b. Assignment
a <- 3+3
b <- exp(2)
c=2*3
d=(10/4)^2
x <- Y <- 2
a
b
c
d
ls() # Lists all the elemnts of the workspace
#rm() removes element from the workspace
rm(a) #removes object from workspace; 

#Logical operators
x == 2 #(vs. x = 2)
x != 2
x < 2
x <= 2
x > 1
a1 <-  x == 2
a1
a2 <- (a1 & (Y >2)) #and
a3 <- (a1 | a2)     #or
A1 #why do we get an error here?

# 2. Vectors
# Sequences.
vec1=1:10  #the colon operator
vec1
vec2=1:-10
vec2
vec3=seq(0,5,by=.5)
vec3
vec4=seq(0,5,length=15)
vec4
# Vectors with no pattern
#Expression
c(1,2,3,4,5)
c(2,-1,7)
#Assignment
x <- c(1,2,3,4,5)
y <- c(2,-1,7,0,1)
length(y)
#Vectors of characters
char <- c("aa","bb", "cc", "dd")
pets <- c(Bolt = "dog", Garfield = "cat", 
       Sebastian = "crab")

pets

bol <- c(TRUE, TRUE, FALSE)
bol
#repeating values
rep1=rep(1,5)
rep1
rep2=rep("a",4)
rep2
rep3=rep(c(1,2,3),5)
rep3
rep4=rep(c("a","b"),c(5,2))
rep4
#Arithmetics with vectors 
x
sum.1 <- x+1
sum.1
2*x
x^2
2^x
y
x+y
x
y
x*y #Coordinate by coordinate product
x%*%y #Dot product
x<3 #Tells whether each value is less than 3
x==3 #Tells whether each value is exacty 3
length(x) # Gives the length of the vector. 
#Subsets
w=c(1:10)
w[3]
w[2:5]
w.1=c(10:20)
w[c(2,4,6)]
w.1[c(2,3,4)]
w.1[3]
# 3. Matrices
#Creation
mat1=matrix(c(1,2,3,4,5,6),nrow=2,ncol=3)
mat1
mat2=matrix(c(1,2,3,4,5,6),nrow=2,ncol=3,byrow=TRUE)
mat2
mat3=matrix(vec4,nrow=3,ncol= 5)
vec4
length(vec4)
mat3

#Functions with matrices
dim(mat1)
d <- dim(mat2)
d
d[1]
d[2]
dim(mat1)[1] #first dimension = num of rows
dim(mat3)
mat1
mat1[1,2]

c1 = c(1, 1, 2)
c2 = c(2, 2, 2)
c3 = c(0, 1, 0)
mat4=cbind(c1,c2,c3)
mat4

r1=c(0,1,1)
r2=c(0,0,2)
r3=c(1,1,1)
mat5=rbind(r1,r2,r3)

I4=diag(4)
mat6=2*I4
mat6
# Operations
           #addition
mat1+mat2
mat1+5
          #Subtraction
mat1-mat2
mat2-5   
           # Inverse
solve(I4)
solve(mat6)
          # Transpose
t(mat1)
t(mat2)
           #Element-wise multiplication
mat1
mat2
mat1*mat2

           # Matrix multiplication
t(mat1)%*%mat1
t(mat2)%*%mat2
           
           # Subsets
           #referencing a cell: 
mat1[1,1]
mat1[1,2]          
mat1[2,1]
mat1[2,2]
mat1[2,3]
           #referencing a row:
mat1[1,]
mat1[2,]
           #referencing a column:
mat1[,1]
mat1[,2]
mat1[,3]           
           
       