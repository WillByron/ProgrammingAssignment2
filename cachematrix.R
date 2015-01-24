## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is a function which takes in a matrix and has 4 functions defined in it
## One for setting the value of the matrix in its own environment
## One for being able to get the matrix from the environement
## one for setting the inverse value of the matrix
## one fo r getting the inverse value back

## cacheSolve takes in a matrix and passes it to makeCacheMatrix by calling its
##sub functions . It checks if the inverse has already been solved before computing it

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}

cacheSolve <- function(x=matrix(), ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}