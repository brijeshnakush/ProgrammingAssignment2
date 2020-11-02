## makeCacheMatrix function creates a "matrix" object that can cashe its inverse.
makeCacheMatrix <- function(x = matrix()) {  
  inv <- NULL
        
## Function to set the matrix  
  set <- function(y){
              x <<- y
              inv <<- NULL
  }
  
## Function the get the matrix
   get <- function() {
    x
  }

## Function the Set the inverse of the matrix  
  setInverse <- function(inverse) {
              inv <<- inverse
  }
 
## Function the get the inverse of the matrix     
  getInverse <- function() {
              inv
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve function calculate the inverse of the special "matrix" returned by makeCacheMatrix function.

cacheSolve <- function(x, ...) {
        
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv      
}
