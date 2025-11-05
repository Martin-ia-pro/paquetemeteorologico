#' Descarga y lectura de datos meteorológicos de una estación
#'
#' Esta función descarga (si es necesario) y lee los datos de una estación meteorológica
#' específica en formato CSV. Si el archivo ya existe en la ruta indicada, se utiliza el
#' archivo local sin volver a descargarlo.
#'
#' Requiere los paquetes `glue`, `readr` y `cli`.
#'
#' @param id_estacion ID de la estación cuyos datos se quieren leer.
#' @param ruta Ruta o directorio en donde se descargarán y leerán los datos
#'
#' @return Los datos en formato CSV para poder almacenarlos en una variable y utilizarlos posteriormente.
#'
#' @examples
#' \dontshow{
#' ruta_temp1 <- file.path(tempdir(), "NH0437.csv")
#' ruta_temp2 <- file.path(tempdir(), "NH0910.csv")
#' }
#' leer_estaciones("NH0437", ruta_temp1)
#' leer_estaciones("NH0910", ruta_temp2)
#'
#' @export
leer_estaciones <- function(id_estacion, ruta){
  url <-  glue::glue("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/{id_estacion}.csv")

  if (!file.exists(ruta)) {
    cli::cli_inform("El archivo no existe en la ruta indicada. Descargando...")
    download.file(url, ruta, mode = "wb")
    cli::cli_inform("Descarga completada.")
  } else {
    cli::cli_inform("El archivo ya existe en la ruta indicada. Leyendo archivo...")
  }

  datos <- readr::read_csv(ruta)
  cli::cli_inform("Lectura completada. El dataset tiene {nrow(datos)} filas y {ncol(datos)} columnas.")

  return(datos)
}
