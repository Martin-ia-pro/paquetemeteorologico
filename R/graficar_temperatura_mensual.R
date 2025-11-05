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
#' @examples
#' graficar_temperatura_mensual(NH0437,
#'                              c("green", "blue", "red","yellow","purple"),"Temperatura Promedio Mensual Estación NH0437")
#' graficar_temperatura_mensual(NH0910, ,"Temperatura Promedio Mensual Estación NH0910")
#' #se puede usar sin poner colores
#'
#' @export
graficar_temperatura_mensual <- function(datos, colores = c("green", "blue", "red","yellow","purple"), titulo = "Temperatura Mensual"){

  promedio_temp <- datos |>
    dplyr::group_by(id,meses = lubridate::floor_date(lubridate::date(fecha), "month")) |>
    dplyr::summarise(promedio_temp_mensual = mean(temperatura_abrigo_150cm, na.rm = TRUE))

  ggplot2::ggplot(data = promedio_temp)+
    ggplot2::aes(y = promedio_temp_mensual, x = meses, color = id)+
    ggplot2::scale_color_manual(values = colores)+
    ggplot2::geom_line(size = 0.7)+
    ggplot2::labs(title = titulo,x="Tiempo", y="Temperatura Promedio")
}
