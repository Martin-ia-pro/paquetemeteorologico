# Contribuciones a paquetemeteorologico

Esta guía describe cómo proponer cambios a paquetemeteorologico. Para obtener información detallada sobre cómo contribuir a este y otros paquetes de tidyverse, consulte la [guía de contribución para desarrolladores](https://tidyverse.org/contribute/) y nuestros [principios de revisión de código](https://code-review.tidyverse.org/).

## Corrección de errores tipográficos

Puedes corregir errores tipográficos, ortográficos o gramaticales en la documentación directamente mediante la interfaz web de GitHub, siempre que los cambios se realicen en el archivo fuente. Esto generalmente significa que tendrás que editar los [comentarios de roxygen2](https://roxygen2.r-lib.org/articles/roxygen2.html) en un archivo `.R`, no en un archivo `.Rd`. Puedes encontrar el archivo .R que genera el archivo `.Rd` leyendo el comentario de la primera línea.

## Cambios importantes

Si quieres realizar un cambio importante, es recomendable que primero abras un ticket y te asegures de que alguien del equipo esté de acuerdo en que es necesario. Si has encontrado un error, abre un ticket que lo describa con un [ejemplo reproducible mínimo](https://tidyverse.org/help/#reprex) (esto también te ayudará a escribir una prueba unitaria, si fuera necesario). Consulta nuestra guía sobre [cómo crear un buen ticket](https://code-review.tidyverse.org/issues/) para obtener más información.

## Proceso de solicitud de extracción

-   Haga un fork del paquete y clónelo en su computadora. Si no lo ha hecho antes, le recomendamos usar `usethis::create_from_github("Martin-ia-pro/paquetemeteorologico", fork = TRUE)`.

-   Instala todas las dependencias de desarrollo con `devtools::install_dev_deps()` y, a continuación, asegúrate de que el paquete supera la comprobación de R CMD ejecutando `devtools::check()`. Si la comprobación de R CMD no se supera correctamente, es recomendable pedir ayuda antes de continuar.

-   Crea una rama de Git para tu solicitud de extracción (PR). Recomendamos usar `usethis::pr_init(``"brief-description-of-change"``)`.

-   Realiza los cambios, confirma los cambios en Git y luego crea una PR ejecutando `usethis::pr_push()` y siguiendo las instrucciones en tu navegador. El título de tu PR debe describir brevemente el cambio. El cuerpo de tu PR debe contener: `Fixes #issue-number`

-   Para los cambios visibles para el usuario, agregue una viñeta en la parte superior de NEWS.md (es decir, justo debajo del primer encabezado). Siga el estilo descrito en <https://style.tidyverse.org/news.html>.

## Estilo de código

-   El código nuevo debe seguir la [guía de estilo](https://style.tidyverse.org/) de tidyverse. Puedes usar [Air](https://posit-dev.github.io/air/) para aplicar este estilo, pero por favor, no modifiques el estilo del código que no esté relacionado con tu solicitud de extracción.

-   Usamos [roxygen2](https://cran.r-project.org/web/packages/roxygen2/index.html), con [sintaxis Markdown](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), para la documentación.

-   Usamos [testthat](https://cran.r-project.org/web/packages/testthat/index.html) para las pruebas unitarias. Las contribuciones con casos de prueba incluidos son más fáciles de aceptar.

## Código de Conducta

Ten en cuenta que el proyecto paquetemeteorologico se publica con un Código de Conducta para Colaboradores. Al contribuir a este proyecto, aceptas cumplir con sus términos.
