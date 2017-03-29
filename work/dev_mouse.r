

'BUTTON1_PRESSED          mouse button 1 down
  BUTTON1_RELEASED         mouse button 1 up
  BUTTON1_CLICKED          mouse button 1 clicked
  BUTTON1_DOUBLE_CLICKED   mouse button 1 double clicked
  BUTTON1_TRIPLE_CLICKED   mouse button 1 triple clicked
  ---------------------------------------------------------------------
  BUTTON2_PRESSED          mouse button 2 down
  BUTTON2_RELEASED         mouse button 2 up
  BUTTON2_CLICKED          mouse button 2 clicked
  BUTTON2_DOUBLE_CLICKED   mouse button 2 double clicked


  BUTTON2_TRIPLE_CLICKED   mouse button 2 triple clicked
  ---------------------------------------------------------------------
  BUTTON3_PRESSED          mouse button 3 down
  BUTTON3_RELEASED         mouse button 3 up
  BUTTON3_CLICKED          mouse button 3 clicked
  BUTTON3_DOUBLE_CLICKED   mouse button 3 double clicked
  BUTTON3_TRIPLE_CLICKED   mouse button 3 triple clicked
  ---------------------------------------------------------------------
  BUTTON4_PRESSED          mouse button 4 down
  BUTTON4_RELEASED         mouse button 4 up
  BUTTON4_CLICKED          mouse button 4 clicked
  BUTTON4_DOUBLE_CLICKED   mouse button 4 double clicked
  BUTTON4_TRIPLE_CLICKED   mouse button 4 triple clicked
  ---------------------------------------------------------------------
  BUTTON5_PRESSED          mouse button 5 down
  BUTTON5_RELEASED         mouse button 5 up
  BUTTON5_CLICKED          mouse button 5 clicked
  BUTTON5_DOUBLE_CLICKED   mouse button 5 double clicked
  BUTTON5_TRIPLE_CLICKED   mouse button 5 triple clicked
  ---------------------------------------------------------------------
  BUTTON_SHIFT             shift was down during button state change
  BUTTON_CTRL              control was down during button state change
  BUTTON_ALT               alt was down during button state change
  ALL_MOUSE_EVENTS         report all button state changes
  REPORT_MOUSE_POSITION    report mouse movement' -> str


lines <- strsplit(str, '\n')[[1]]
lines <- lines[grepl('\\w+', lines)]
lines <- sub('^\\s+', '', lines)
events <- strsplit(lines, '\\s+')
events <- sapply(events, function(x) x[[1]])
cat(paste0(events, collapse = ',\n'))
# BUTTON1_PRESSED,
# BUTTON1_RELEASED,
# BUTTON1_CLICKED,
# BUTTON1_DOUBLE_CLICKED,
# BUTTON1_TRIPLE_CLICKED,
# BUTTON2_PRESSED,
# BUTTON2_RELEASED,
# BUTTON2_CLICKED,
# BUTTON2_DOUBLE_CLICKED,
# BUTTON2_TRIPLE_CLICKED,
# BUTTON3_PRESSED,
# BUTTON3_RELEASED,
# BUTTON3_CLICKED,
# BUTTON3_DOUBLE_CLICKED,
# BUTTON3_TRIPLE_CLICKED,
# BUTTON4_PRESSED,
# BUTTON4_RELEASED,
# BUTTON4_CLICKED,
# BUTTON4_DOUBLE_CLICKED,
# BUTTON4_TRIPLE_CLICKED,
# BUTTON5_PRESSED,
# BUTTON5_RELEASED,
# BUTTON5_CLICKED,
# BUTTON5_DOUBLE_CLICKED,
# BUTTON5_TRIPLE_CLICKED,
# BUTTON_SHIFT,
# BUTTON_CTRL,
# BUTTON_ALT,
# ALL_MOUSE_EVENTS,
# REPORT_MOUSE_POSITION


cat(paste0(sapply(events, function(x) paste0("'", x, "'")), collapse = ',\n'))
