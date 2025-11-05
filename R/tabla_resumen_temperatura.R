#' Resumen Estadístico de Temperaturas por Estación
#'
#' Calcula un resumen estadístico clave para la columna de temperatura
#' (`temperatura_abrigo_150cm`) en el conjunto de datos de una o varias estaciones.
#'
#' La tabla de salida incluye la temperatura máxima, mínima, promedio y la
#' desviación estándar. Los cálculos se agrupan por el identificador de la
#' estación (`id`).
#'
#' Esta función requiere el paquete `dplyr` para la manipulación de datos.
#'
#' @param estacion El conjunto de datos de estaciones
#'   meteorológicas o de una estacion en especifico. Se utilizaran las columnas:
#'   \itemize{
#'     \item `id`: Identificador de la estacion.
#'     \item `temperatura_abrigo_150cm`: Columna con los valores de temperatura
#'           utilizados para los cálculos.
#'   }
#'
#' @returns Un objeto tibble que contiene una fila por
#'   cada estación (`id`) con las siguientes columnas de resumen:
#'   `id`, `Max`, `Min`, `Promedio`, y `Desvio_Estandar`.
#'
#' @examples
#' \dontshow{
#' ruta_temp1 <- file.path(tempdir(), "NH0437.csv")
#' ruta_temp2 <- file.path(tempdir(), "NH0910.csv")
#'
#' NH0437 <- leer_estaciones("NH0437", ruta_temp1)
#' NH0910 <- leer_estaciones("NH0910", ruta_temp2)
#' }
#'
#' tabla_resumen_temperatura(NH0437)
#' tabla_resumen_temperatura(NH0910)
#'
#' @export
tabla_resumen_temperatura <- function(estacion) {
 estacion |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      Max = max(temperatura_abrigo_150cm, na.rm = TRUE),
      Min = min(temperatura_abrigo_150cm, na.rm = TRUE),
      Promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      Desvio_Estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE)
    )
}
