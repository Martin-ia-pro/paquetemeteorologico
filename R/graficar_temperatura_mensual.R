#' Gráfico de Temperatura Promedio Mensual
#'
#' La función graficar_temperatura_mensual sirve para graficar el promedio de la temperatura mensual del dataset proporcionado
#'
#' @param datos tibble o dataset al cual se le quiere realizar el gráfico de la temperatura promedio mensual.
#' @param colores colores con los que se quiere que aparezca la temperatura en el gráfico de linea.
#' @param titulo frase o palabra que se desea poner de titulo en el gráfico.
#'
#' @returns imagen de un gráfico de lineas.
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
