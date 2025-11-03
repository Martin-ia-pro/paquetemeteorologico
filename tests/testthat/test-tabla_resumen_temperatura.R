test_that("tabla_resumen_temperatura funciona con NH0910", {

  resumen <- tabla_resumen_temperatura(NH0910)

  expect_true(all(c("id", "Max", "Min", "Promedio", "Desvio_Estandar") %in% colnames(resumen)))
  expect_equal(resumen$id, "NH0910")
  expect_false(any(is.na(resumen$Max)))
  expect_false(any(is.na(resumen$Min)))
  expect_false(any(is.na(resumen$Promedio)))
  expect_false(any(is.na(resumen$Desvio_Estandar)))

  expect_true(resumen$Max >= resumen$Promedio)
  expect_true(resumen$Promedio >= resumen$Min)
})
