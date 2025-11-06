# Contribuciones a paquetemeteorologico

Esta guía describe cómo proponer cambios a paquetemeteorologico. Para obtener información detallada sobre cómo contribuir a este y otros paquetes de tidyverse, consulte la [guía de contribución para desarrolladores](https://tidyverse.org/contribute/) y nuestros [principios de revisión de código](https://code-review.tidyverse.org/).

## Corrección de errores tipográficos

Puedes corregir errores tipográficos, ortográficos o gramaticales en la documentación directamente mediante la interfaz web de GitHub, siempre que los cambios se realicen en el archivo fuente. Esto generalmente significa que tendrás que editar los [comentarios de roxygen2](https://roxygen2.r-lib.org/articles/roxygen2.html) en un archivo `.R`, no en un archivo `.Rd`. Puedes encontrar el archivo .R que genera el archivo `.Rd` leyendo el comentario de la primera línea.

## Cambios importantes

Si quieres realizar un cambio importante, es recomendable que primero abras un ticket y te asegures de que alguien del equipo esté de acuerdo en que es necesario. Si has encontrado un error, abre un ticket que lo describa con un [ejemplo reproducible mínimo](https://tidyverse.org/help/#reprex) (esto también te ayudará a escribir una prueba unitaria, si fuera necesario). Consulta nuestra guía sobre [cómo crear un buen ticket](https://code-review.tidyverse.org/issues/) para obtener más información.

Proceso de solicitud de extracción

Haga un fork del paquete y clónelo en su computadora. Si no lo ha hecho antes, le recomendamos usar...

-    `usethis::create_from_github("Martin-ia-pro/paquetemeteorologico", fork = TRUE)`.

-   Install all development dependencies with `devtools::install_dev_deps()`, and then make sure the package passes R CMD check by running `devtools::check()`. If R CMD check doesn't pass cleanly, it's a good idea to ask for help before continuing.

-   Create a Git branch for your pull request (PR). We recommend using `usethis::pr_init("brief-description-of-change")`.

-   Make your changes, commit to git, and then create a PR by running `usethis::pr_push()`, and following the prompts in your browser. The title of your PR should briefly describe the change. The body of your PR should contain `Fixes #issue-number`.

-   For user-facing changes, add a bullet to the top of `NEWS.md` (i.e. just below the first header). Follow the style described in <https://style.tidyverse.org/news.html>.

### Code style

-   New code should follow the tidyverse [style guide](https://style.tidyverse.org). You can use [Air](https://posit-dev.github.io/air/) to apply this style, but please don't restyle code that has nothing to do with your PR.

-   We use [roxygen2](https://cran.r-project.org/package=roxygen2), with [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), for documentation.

-   We use [testthat](https://cran.r-project.org/package=testthat) for unit tests. Contributions with test cases included are easier to accept.

## Code of Conduct

Please note that the paquetemeteorologico project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project you agree to abide by its terms.
