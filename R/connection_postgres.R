#' connection_postgres
#' @description  Adds the ability to re-try connections on failure and reads from pre-defined environment variables names.
#' @param POSTGRES_HOST Database hostname
#' @param POSTGRES_PORT Database port
#' @param POSTGRES_DB Database name
#' @param POSTGRES_PASSWORD Database password
#' @param n_connection_tries Number of attempts to connect
#' @export connection_postgres
connection_postgres <- function(POSTGRES_HOST = NULL,
                                POSTGRES_PORT = NULL,
                                POSTGRES_USER = NULL,
                                POSTGRES_PASSWORD = NULL,
                                POSTGRES_DB = NULL,
                                n_connection_tries = 5) {
  if (is.null(POSTGRES_HOST)) {
    POSTGRES_HOST <- Sys.getenv("POSTGRES_HOST")
  }

  if (is.null(POSTGRES_PORT)) {
    POSTGRES_PORT <- Sys.getenv("POSTGRES_PORT")
  }

  if (is.null(POSTGRES_USER)) {
    POSTGRES_USER <- Sys.getenv("POSTGRES_USER")
  }

  if (is.null(POSTGRES_PASSWORD)) {
    POSTGRES_PASSWORD <- Sys.getenv("POSTGRES_PASSWORD")
  }

  if (is.null(POSTGRES_DB)) {
    POSTGRES_DB <- Sys.getenv("POSTGRES_DB")
  }

  n <- 1
  message("First attempt at connection")
  repeat {

    connection <- try({
      dbConnect(RPostgres::Postgres(),
        host = POSTGRES_HOST,
        port = POSTGRES_PORT,
        user = POSTGRES_USER,
        password = POSTGRES_PASSWORD,
        dbname = POSTGRES_DB
      )
    })

    if (!inherits(connection, "PgConnection")) {
      break
    } else {
      if (n > n_connection_tries) {
        stop("Database connection failed")
      }
      n <- n + 1
      message(glue("Trying to connect: try {n}"))
    }
  }

  connection
}
