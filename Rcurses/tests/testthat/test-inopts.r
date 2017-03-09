context('inopts')


.inopts <- function() {
  skip_if_not(interactive(), 'need interactive')

  with_initscr({
    expect_error(raw(), NA)
    expect_error(noraw(), NA)

    expect_error(cbreak(), NA)
    expect_error(nocbreak(), NA)

    expect_error(echo(), NA)
    expect_error(noecho(), NA)

    expect_error(qiflush(), NA)
    expect_error(noqiflush(), NA)

    expect_error(intrflush(TRUE), NA)
    expect_error(intrflush(FALSE), NA)

    expect_error(keypad(bf = TRUE), NA)
    expect_error(keypad(bf = FALSE), NA)

    expect_error(meta(TRUE), NA)
    expect_error(meta(FALSE), NA)

    expect_error(timeout(1), NA)
    expect_error(timeout(-1), NA)

  })
}
test_that('inopts', .inopts())



.halfdelay <- function() {
  skip_if_not(interactive(), 'need interactive')

  with_initscr({
    expect_true(halfdelay(1))
    nocbreak()
  })
}
test_that('halfdelay', .halfdelay())
