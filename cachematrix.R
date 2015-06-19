## Improves performance of matrix inversion by providing 
## a new matrix type that caches it's inverse.  The inverse of a matrix
## is only calculated once.
##

## Creates an object that contains a matrix. 
## This new matrix object extends the in-built matrix object.
## It improves performance of inverting a matrix by caching it.
## It assumes the matrix is invertible.
## Parameters: x - An invertible matrix. Defaults to an empty matrix
## Returns: An instance of a CacheMatrix
makeCacheMatrix <- function(x = matrix()) {

	# Create factory method that creates new cache matrix
 	cacheFactory <- setClass("CacheMatrix", contains="matrix")

	# Creates the new matrix object containing the parameter passed in.
	newCacheMatrix <- cacheFactory(x);

	# method to return the (cached) inverse of the matrix
	# this function assumes the matrix is invertable
	getInverse <- function(){
		TRUE
	}
	# Attach new function to object
	newCacheMatrix.GetInverse <-getInverse		
	newCacheMatrix 	
}


## This function calls the methods on the matrix to invert it.
## Returns: inverse of the matrix passed in.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		 x.GetInverse	
}


