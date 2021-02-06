library(redditsuite)

pg_connection <- dbConnect(
  drv = Postgres(),
  host = 'localhost',
  port = 5432,
  user = Sys.getenv("POSTGRES_USER"),
  password = Sys.getenv("POSTGRES_PASSWORD"),
  dbname = Sys.getenv("POSTGRES_DB")
)
