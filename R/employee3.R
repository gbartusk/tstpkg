# S3 implementation of employee class

#' constructor
#'
#' @param fname first name
#' @param lname last name
#' @return S3 class object
#' @export
employee3 <- function(fname, lname) {
  # create class instance
  e <- list()
  class(e) <- "employee3"  # or: attr(e,"class") <- "employee3"
  # build the object (ie set member variables)
  e$fname = fname
  e$lname = lname
  e$salary = 100
  e$union = TRUE
  # return the object
  return(e)
  # can create and assign class in one step: structure(list(), class = "foo")
}


#' print method for employee class
#' print() is a generic function and thus we can take advantage of polymorphism
#'
#' @param wrkr employee object
#' @return print to screen
print.employee3 <- function(wrkr) {
  if (class(wrkr)[1] == "employee3") {
    cat("employee3",wrkr$fname,wrkr$lname,"has a salary of",wrkr$salary,"\n")
  } else {
    # this will never be called if print.tmpemployee3 is defeined
    cat("temp employee3",wrkr$fname,wrkr$lname,"has a salary of",wrkr$salary,"\n")
  }
}


#' temp employee constructor
#' inherits from employee super class
#'
#' @param fname first name
#' @param lname last name
#' @return S3 class object
#' @export
tmpemployee3 <- function(fname, lname) {
  e <- list(fname = fname, lname = lname, salary = 50, union = T, tmp = T)
  # R looks for methods in the order in which they appear in the class vector
  class(e) <- c("tmpemployee3","employee3")
  return(e)
}


#'
#'
#'
print.tmpemployee3 <- function(wrkr) {
  cat(wrkr$fname,wrkr$lname,"is a temp worker with salary: ",wrkr$salary,"\n")
}


#' generic function for raise
#' method dispatch starts with the generic function that decides which specific
#' method to dispatch to.
#'
raise <- function(x, ...) {
  # generic method all have the same form -- specify the generic name and the
  # object to dispatch on
  UseMethod("raise", x)
}


#'
#'
#'
raise.employee3 <- function(x, amt) {
  n <- x$salary + amt
  cat("new salary amt for",x$fname,x$lname,"is:",n,"\n")
  x$salary <- n
}


