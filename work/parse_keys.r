# generate/parse key constants
library(stringr)
CURSES <- '/usr/include/ncurses.h'
lines <- readLines(CURSES)
lines <- grep('#define KEY_', lines, value = TRUE)


keys <- na.omit(str_extract(lines, 'KEY_\\w+\\s+\\d+'))
keys <- str_split(keys, '\\s+')

key_names <- lapply(keys, getElement, 1)
key_names <- sub('KEY_', '', key_names)
key_codes <- lapply(keys, getElement, 2)
key_codes <- as.integer(key_codes)
keys <- setNames(as.list(key_codes), key_names)
dput(keys)