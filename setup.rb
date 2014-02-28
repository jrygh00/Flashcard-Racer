require 'pg'

DATABASE_NAME = 'flashcard_racer'

ignore_errors = "/dev/null 2>&1" # this is a little helper for the line below

`createdb #{DATABASE_NAME} #{ignore_errors}`

db_connection = PG.connect( dbname: DATABASE_NAME )

db_connection.exec("drop table if exists flashcards;")

db_connection.exec(<<-SQL
  create table flashcards
  (
    lastname  varchar(255),
    firstname varchar(255),
    cohort    varchar(255),
    phase     int
  );
  SQL
)