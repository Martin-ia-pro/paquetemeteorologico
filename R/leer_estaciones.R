#' Descarga y lee los datos de archivos de estaciones meteorológicas
#'
#' Descarga un archivo formato CSV con  datos de una estación meteorológica
#' específica y lo guarda en una ruta local. Si el archivo ya existe en la ruta especificada, la función lo lee directamente
#' sin volver a descargarlo.
#'
#' Requiere los paquetes `glue`, `readr` y `cli`.
#'
#' @param id_estacion ID de la estación cuyos datos se quieren leer.
#' @param ruta Ruta o directorio en donde se descargarán y leerán los datos
#'
#' @returns Los datos en formato CSV para poder almacenarlos en una variable y utilizarlos posteriormente.
#'
#' @importFrom readr read_csv
#' @importFrom cli cli_inform
#'
#' @examples
#' leer_estaciones("NH0437","datos/NH0437.csv")
#' leer_estaciones("NH0910","datos/NH0910.csv")
#'
#' @export
leer_estaciones <- function(id_estacion, ruta){
  url <-  glue::glue("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/{id_estacion}.csv")

  if (!file.exists(ruta)) {
    cli_inform("El archivo no existe en la ruta indicada. Descargando...")
    download.file(url, ruta, mode = "wb")
    cli_inform("Descarga completada.")
  } else {
    cli_inform("El archivo ya existe en la ruta indicada. Leyendo archivo...")
  }

  datos <- read_csv(ruta)
  cli_inform("Lectura completada. El dataset tiene {nrow(datos)} filas y {ncol(datos)} columnas.")

  return(datos)
}
