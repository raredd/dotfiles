.First <- function() {
  options(
    prompt = 'R> ',
    continue = '... ',
    repos = list(CRAN = 'https://cran.r-project.org/')
    # error = function() {
    #   calls <- sys.calls()
    #   if (length(calls) >= 2L) {
    #     sink(stderr())
    #     on.exit(sink(NULL))
    #     cat('Calls:\n')
    #     calls <- calls[-length(calls)]
    #     for (ii in seq_along(calls))
    #       cat(ii, ': ', deparse(calls[[ii]], nlines = 1L), '\n', sep = '')
    #   }
    #   if (!interactive())
    #     q(status = 1)
    #   }
    )
}

if (Sys.getenv('RSTUDIO') %in% c('', 'dumb')) {
  suppressPackageStartupMessages(
    try(require('colorout', quietly = TRUE, character.only = TRUE),
        silent = TRUE)
  )
}

.q <- function(save = 'no', status = 0, runLast = TRUE) {
  .Internal(quit(save, status, runLast))
}
