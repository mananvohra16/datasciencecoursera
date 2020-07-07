## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    i <- NULL
    
    setMatrix <-  function(matrix){
        m <<- matrix
        i <<- NULL
    }
    
    getMatrix <- function(){
        m
    }
    
    setInverseMatrix(){
        i <<- inverse
    }
        
    getInverseMatrix(){
        i
    }
  
    list(set = setMatrix, get = getMatrix, setInverse = setInverseMatrix, getInverse = getInverseMatrix )
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- X$getInverse()
        if(!is.null(m)){
            return(m)
        }
        data <- x$getMatrix()
        m <- solve(data) %*% data
        x$setInverseMatrix(m)
        m
}
