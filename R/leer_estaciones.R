#' Lee archivos sobre estaciones meteorológicas
#'
#' La funcion leer_estaciones sirve para descargar y leer los datos de estaciones a partir de su ID. Tambien debe proporcionarse la ruta en donde se descargara el archivo de los datos de la estacion
#'
#' @param id_estacion ID de la estación cuyos datos se quieren leer
#' @param ruta Ruta o directorio en donde se descargarán y leeran los datos
#'
#' @returns Los datos en forma de .csv para poder almacenarlos en una variable y utilizarlos
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
