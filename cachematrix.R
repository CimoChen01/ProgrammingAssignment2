## Put comments here that give an overall description of what your
## functions fo

# Below are two functions that are used to create a special "matrix" object 
# and cache's its inverse of the matrix

## Write a short comment describing this function
# makeCacheMatrix creats a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse of the matrix
# 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function()
                x
        setsolve <- function(solve)
                m <<- solve
        getsolve <- function()
                m
        list( set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Write a short comment describing this function
# The following function returns the inverse of the matrix. 
# It first checks if the inverse has already been computed. 
# If so, it will get the results and skip the computation.
# If not, it will compute the inverse, set the value in the cache via setsolve function

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}

