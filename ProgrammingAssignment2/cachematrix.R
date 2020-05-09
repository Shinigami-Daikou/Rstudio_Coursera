##makeCacheMatrix is a function which returns a list of functions:
##set to initialise variable s to NULL and set x
##get returns matrix x
##setinvesre set s to the argument inv
##getinverse returns s

makeCacheMatrix <- function(x = matrix(sample(1:50,9),ncol = 3,nrow = 3)) {
      s <- NULL
      set <- function(y){
            s <<- NULL
      }
      
      get <- function() x
      
      setinverse <- function(inv) s <<- inv
      
      getinverse <- function() s
      
      list(set = set, get = get, setinverse = setinverse, 
           getinverse = getinverse)
}


## cacheSolve first checks for the inverse of matrix
##if inverse exists it returns it else calculates the inverse and cache it

cacheSolve <- function(x,...) {
        ## Return a matrix that is the inverse of 'x'
      i <- x$getinverse()
      if(!is.null(i)){
            message('Getting Cached Data')
            return(i)
      }
      
      message('Inverse Not Cached, Calculating... ')
      data <- x$get()
      i <- solve(data,...)
      x$setinverse(i)
      i
}
