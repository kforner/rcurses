.onLoad <- function(libname, pkgname) {
  ns <- getNamespace(pkgname)
  assign('ATTRIBUTES', attributes(), ns)
}
