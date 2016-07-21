## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get<- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list (set = set, get = get, setinverse = setinverse,
      getinverse = getinverse)  
  

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
                                     # Return a matrix that is the inverse of 'x'
      }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  
}


# Sample Output:

# > x = rbind(c(1, -2), c(-2, 1))
# > m = makeCacheMatrix(x)
# > m$get()
# [,1] [,2]
# [1,]    1   -2
# [2,]   -2    1
# > cacheSolve(m)
# [,1]       [,2]
# [1,] -0.3333333 -0.6666667
# [2,] -0.6666667 -0.3333333
# > cacheSolve(m)
# getting cached data
# [,1]       [,2]
# [1,] -0.3333333 -0.6666667
# [2,] -0.6666667 -0.3333333
