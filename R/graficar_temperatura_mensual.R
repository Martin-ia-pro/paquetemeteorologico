#' Gráfico de Líneas de Temperatura Promedio Mensual
#'
#' Genera un gráfico de líneas (ggplot2) que visualiza la temperatura promedio
#' mensual a partir del conjunto de datos de estaciones meteorológicas proporcionados.
#'
#' Esta función agrupa los datos por estación (`id`) y mes, calcula el promedio
#' de la temperatura, y luego crea el gráfico.
#'
#' Requiere las librerías `dplyr` (para manipulacion de datos), `lubridate` (para
#' manejo de fechas) y `ggplot2` (para la creación del gráfico).
#'
#' @param datos Se hace uso de las siguientes columnas del dataset proporcionado:
#'   \itemize{
#'     \item `id`: Identificador de la estación.
#'     \item `fecha`: Fecha de la medición.
#'     \item `temperatura_abrigo_150cm`: Columna con los valores de temperatura.
#'   }
#' @param colores Un vector de colores que se utilizará para
#'   diferenciar las líneas de las estaciones (`id`). Por defecto, es un vector
#'   con cinco colores.
#' @param titulo La cadena de texto que se desea utilizar como
#'   título principal del gráfico generado.Por defecto, es "Temperatura Mensual".
#'
#' @return Un objeto de la clase `ggplot` que representa
#'   el gráfico de líneas de la temperatura promedio mensual. Este objeto puede
#'   ser impreso o guardado.
#'
#' @importFrom dplyr group_by summarise
#' @importFrom lubridate floor_date date
#' @importFrom ggplot2 ggplot aes scale_color_manual geom_line labs
#'
#' @examples
#' graficar_temperatura_mensual(estaciones_unidas,c("green", "blue", "red","yellow","purple"),"Temperatura Promedio Mensual Estación 1")
#' graficar_temperatura_mensual(estaciones_unidas,c("purple", "pink", "lightblue","orange","brown"),"Temperatura Promedio Mensual Estación de Argentina-Rosario")
#'
#' @export
graficar_temperatura_mensual <- function(datos, colores = c("green", "blue", "red","yellow","purple"), titulo = "Temperatura Mensual"){

  promedio_temp <- datos |>
    group_by(id,meses = floor_date(date(fecha), "month")) |>
    summarise(promedio_temp_mensual = mean(temperatura_abrigo_150cm, na.rm=TRUE))

  ggplot(data = promedio_temp)+
    aes(y = promedio_temp_mensual, x = meses, color = id)+
    scale_color_manual(values = colores)+
    geom_line(size = 0.7)+
    labs(title = titulo,x="Tiempo", y="Temperatura Promedio")
}
