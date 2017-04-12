library(devtools)
devtools::load_all('Rcurses')

example_hello()

test('Rcurses', 'coords')
test('Rcurses', 'attributes')

source('demo/gdc.r')
source('demo/echochar.r')