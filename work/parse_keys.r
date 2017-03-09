# generate/parse key constants
library(stringr)
CURSES <- '/usr/include/ncurses.h'
lines <- readLines(CURSES)
lines <- grep('#define KEY_', lines, value = TRUE)


keys <- na.omit(str_extract(lines, 'KEY_\\w+\\s+\\d+'))
keys <- str_split(keys, '\\s+')

key_names <- lapply(keys, getElement, 1)

### generate the C accessor functions
key_names <- unlist(key_names)
for (key in key_names) {
  cat(sprintf('void _%s(int *key) { *key = %s; }\n', key, key))
}


dput(key_names)

key_names <- sub('KEY_', '', key_names)
key_codes <- lapply(keys, getElement, 2)
key_codes <- as.integer(key_codes)
keys <- setNames(as.list(key_codes), key_names)
dput(keys)