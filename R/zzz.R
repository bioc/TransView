
.onAttach <- function(libname, pkgname) {
	
	packageStartupMessage("Welcome to TransView version ", packageDescription("TransView", fields="Version"))

    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.23")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}
