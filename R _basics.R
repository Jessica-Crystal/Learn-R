#Decision making in R
x<-24
if(x>10){
  print("x is greater than 10")
}else{
  print("x is less than 10")
}
x<-7
if(x==0){
  print("Zero")
}else if(x%%2==0){
  print("Even")
}else{
  print("Odd")
}

num <-3
result <-switch(num,
                "One",
                "Two",
                "Three",
)
print(result)

x <- "c"
result <- switch(
  x,
  'a' = 'One',
  'b' = 'Two',
  'c' = 'Three',
  'd' = 'Four',
)
print(result)

#loop
#While condition
i<-1
while(i<10){
  print(i)
  i<-i + 1
}
x<-10
while(x>0){
  print(x)
  x <- x - 2
}


#for loop
for(x in 1:10){
  print(x)
}


#for loop
sum<-0
for(x in 1:1000){
  if(x%%3==0){
    sum <-sum + x
  }
  
}
print(sum)

#break
i<-8
while(i>0){
  print(i)
  i<-i-1
  if(i==4){
    break
  }
}


#next
for(x in 1:15){
  if(x == 13){
    next
  }
  print(x)
}

#next
res <-1
for(x in 1:10000){
  res<-res*x
  if(res>1000){
    break
  }
}
print(res)
#function in R
res <- max(8,3,12,88)
print(res)


#User defined functions
pow<- function(x,y){
  result <- x^y
  print(result)
}
pow(3,5)

########################################################

#function in R
test <- function(a,b=4){
  result <-(a+b)*3
  print(result)
}
test(1)


for(x in 8:2){
  print(x)
}

cal<-function(a,b){
  res<-0
  for(x in a:b){
    res <- res + x
  }
  return(res)
}
print(cal(4,7))
############################################################
sum<-function(x){
  res<-1
  for(val in 1:x){
    if(val==3){
      break
    }
    res<-res*val
    
  }
  return(res)
}
sum(5)
sum(7)
###############################################################
#vector
names <-c("James","John" ,"Ben")
print(names[2])#R is a little bit different wrt python, this gives "John" in R but "Ben" in python
#filtering
x<-seq(1,100,by=2)
print(x)

#######################################################
#vector arithmetics#
v1<-c(1,2,3,4,6)
v2<-c(6,7,8,9,1)
#addition
print(v1+v2)

#substraction
print(v1-v2)

#multiplication
print(v1*v2)

#division

print(v1/v2)

#mean
print(mean(v1))

#median
print(median(v1))

#####################################################

#liste

liste1 <- list(TRUE, FALSE, 1,2, NA, "mary")
print(liste1[[5]])

#########################################################

