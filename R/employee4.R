# S4 implementation of employee class

#' constructor
#'
#' @param fname first name
#' @param lname last name
#' @return S4 class object
#' @export
employee4 <- function(fname, lname) {
  setClass("employee4",
    representation(
      fname="character",
      lname="character",
      salary="numeric",
      union="logical")
  )
}
