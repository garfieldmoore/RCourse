## Improves performance of matrix inversion by providing 
## a new matrix type that can caches it's inverse.  The inverse of a matrix
## is only calculated once.
##

## Creates an object that can cache the inverse of a matrix. 
## Parameters: x - An invertible matrix. Defaults to an empty matrix
## It provides the following methods:
##		set(matrix) - sets the matrix on the object
##		get() - returns the matrix
##		setInverse(invertedMatrix) - stores the inverse of the matrix
##		getInverse() - returns the inverse of the matrix from the cache
## Returns: An instance of a CacheMatrix
makeCacheMatrix <- function(x = matrix()) {
	cachedInverse <-NULL

	# sets the matrix and removes any cached inversion
	set <-function(m){
		x<<-m
		cache <<-NULL
	}

	# method to return the matrix
	get <-function(){
		x
	}

	# method to set cached inverted matrix
	setinverse<-function(inverse){
		cachedInverse <<-inverse		
	}

	# method to return the cachedInverse
	getinverse <- function(){
		cachedInverse
	}

	# create new object with the above methods
	list(set=set, get=get, getInverse=getinverse, setInverse=setinverse)
}


## This function calculates the inverse of a CachedMatrix.
## this improves performance by caching the inverse after it has been calculated
## It assumes the matrix is invertible.
cacheSolve <- function(x, ...) {
        ## get the cached matrix that is the inverse of 'x'
		inverse <-x$getInverse()

		# if it isn't null then return the cached value otherwise calculate
		# the inverse and cache it.
		if (!is.null(inverse)){
			message("Getting cached inverse")
			return (inverse)
		}
		else{			
			message("Calculating inverse")
			data <- x$get()
			inverted <- solve(data)
			x$setInverse(inverted)
	   		inverted
		}
}


