

makeCacheMatrix <- function(x= matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse, 
       getinverse = getinverse)
}


cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  # return matrix from cache and skip the calculation if the inverse of the matrix has already been calculated
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  # if not, proceed to calculating inverse
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  return(m)
}
