test_that("leer_estaciones descarga y lee correctamente", {
  ruta_temp <- tempfile(fileext = ".csv")

  id_estacion <- "NH0910"

  datos <- leer_estaciones(id_estacion, ruta_temp)

  expect_s3_class(datos, "data.frame")
  expect_true(file.exists(ruta_temp))
  expect_gt(nrow(datos), 0)
})

test_that("leer_estaciones descarga correctamente si el archivo no existe", {
  ruta_temp <- tempfile(fileext = ".csv")
  id_estacion <- "NH0910"
  datos <- leer_estaciones(id_estacion, ruta_temp)

  expect_s3_class(datos, "data.frame")
  expect_equal(ncol(datos), 35)
})
