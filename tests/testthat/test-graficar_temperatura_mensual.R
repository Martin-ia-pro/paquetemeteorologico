test_that("graficar_temperatura_mensual funciona correctamente", {
    grafico <- graficar_temperatura_mensual(NH0910)

    expect_s3_class(grafico, "ggplot")

    expect_error(
      graficar_temperatura_mensual(
        datos = NH0910,
        titulo = "Temperaturas mensuales promedio",
        colores = c("red", "blue", "green")
      ),
      NA
    )

    expect_equal(grafico$labels$title, "Temperatura Mensual")
    expect_equal(grafico$labels$x, "Tiempo")
    expect_equal(grafico$labels$y, "Temperatura Promedio")

    expect_true(length(unique(grafico$data$id)) >= 1)
  })
