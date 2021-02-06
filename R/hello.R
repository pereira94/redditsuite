# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

#' hello
#' @author me
#' @param name Someone's name
#' @examples
#' hello(name = "Pedro")
#' @export hello
hello <- function(name = 'world') {
  print(glue("Hello, {name}!"))
}
