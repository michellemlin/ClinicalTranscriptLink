test_that("metadataExtract", {
  data <- data.frame(
    patient_ID = c("1", "2", "3", "4"),
    patient_positive = c("P", "N", "N", "P"),
    patient_age = c(1, 2, 3, 4)
  )
  expected <- data.frame(
    patient_ID = c("1", "2", "3", "4"),
    patient_age = c(1, 2, 3, 4)
  )

  calc <- metadataExtract(data, c("patient_ID", "patient_age"))
  expect_equal(calc, expected)
})


test_that("metadataExtract", {
  data <- data.frame(
    patient_ID = c("1", "2", "3", "4"),
    patient_positive = c("P", "N", "N", "P"),
    patient_age = c(1, 2, 3, 4)
  )
  expected <- data.frame(
    patient_ID = c("1", "2", "3", "4")
  )

  calc <- metadataExtract(data, c("patient_ID"))
  expect_equal(calc, expected)
})
