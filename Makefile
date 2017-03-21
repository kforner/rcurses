PKG=Rcurses
FILTER=

roxy:
	Rscript -e 'roxygen2::roxygenise("$(PKG)")'

check-man: roxy
	Rscript -e 'devtools::check_man("$(PKG)")'

check: roxy
	Rscript -e 'devtools::check("$(PKG)")'
	
test: roxy
	Rscript -e 'devtools::test("$(PKG)", filter = "$(FILTER)")'
