## makeCacheMatrix() creates a list of actions that is called upon by cacheSolve() when the latter is asked to perform a 
## matrix inversion. Within that list, the target of that matrix inversion is stored. cacheSolve() will first check to see
## if inversion has already been performed by looking for data stored in the Inv variable; if not, cacheSolve() will reference
## the original matrix from $get and perform the inversion, storing the product in $setInv afterward.

## The first function 1) creates a list of 'reference functions' that are called upon by cacheSolve(), 2) stores
## an input matrix to be inverted by cacheSolve(), and 3) stores the inversion of that matrix performed by cacheSolve() if 
## the inversion hasn't previously been performed.

makeCacheMatrix <- function(x = matrix()) {
  Inv <- NULL 
  get <- function() x 
  setInv <- function(inverse) Inv <<- inverse 
  getInv <- function() Inv
  list(get = get, setInv = setInv, getInv = getInv)
}

## When called for the output of makeCacheMatrix(), cacheSolve() will first test whether that output contains a previously
## generated matrix inversion. If so, cacheSolve() will return that inverted matrix, otherwise cacheSolve() will source
## the input matrix from makeCacheMatrix(), perform the inversion, and store that inversion in the makeCacheMatrix output.

cacheSolve <- function(x, ...) {
  Inv <- x$getInv() 
  if(!is.null(Inv)) { 
    message("getting cached data")
    return(Inv)
  }
  data <- x$get() 
  Inv <- solve(data, ...) 
  x$setInv(Inv) 
  Inv
}
