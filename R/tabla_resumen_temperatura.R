#' Tabla con un resumen numérico de las temperaturas de una estación
#'
#' La función tabla_resumen_temperatura devuelve un resumen numérico de las temperaturas de una estacion, la cual se pasa como parámetro. Esta tabla contiene: temperatura máxima, temperatura mínima, temperatura promedio y su desvio estandar.
#'
#' @param estacion tibble o data.frame con los datos a lo que se les va a realizar el resumen numérico
#'
#' @returns tibble o data.frame con el mínimo, máximo, promedio y desvio estandar de la temperatura
#'
#' @examples
#' tabla_resumen_temperatura(estacion_1) # estacion_1 <- read.csv("datos/estacion_1.csv")
#' tabla_resumen_temperatura(estacion_2) # estacion_2 <- read.csv("datos/estacion_2.csv")
#'
#' @export
tabla_resumen_temperatura <- function(estacion) {
  estacion |>
    group_by(id) |>
    summarise(Max = max(temperatura_abrigo_150cm, na.rm=TRUE),
              Min = min(temperatura_abrigo_150cm, na.rm=TRUE),
              Promedio = mean(temperatura_abrigo_150cm, na.rm=TRUE),
              temperatura_promedio_abrigo_150cm=sd(temperatura_abrigo_150cm, na.rm=TRUE))

}
