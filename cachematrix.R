## The following pair of functions caches the inverse of a matrix. 

## This function contains a list with functions to set the value of a matrix, get the value of the matrix, set the value of the inverse, and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function (y) {
    x <<- y
    i <<- NULL
  }
  get <- function () x
  setinverse <- function(solve) i <<- solve
  getinverse <- function () i
  list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function calculates the inverse of the matrix created with the above function. It first checks to see if the inverse has already been calculated. If yes, it gets the inverse from the cache and skips the computation. Else, it computes the inverse and sets the value of the inverse in the cache via the setinverse function. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(~is.null(i)) {
    message("Getting cached data")
    return (i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
