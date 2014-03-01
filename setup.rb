module DatabaseConnection

  require 'pg'
  require 'csv'


  DATABASE_NAME = 'flashcard_racer'

  ignore_errors = "/dev/null 2>&1" # this is a little helper for the line below

  `createdb #{DATABASE_NAME} #{ignore_errors}`

  DB = PG.connect( dbname: DATABASE_NAME )

  DB.exec("drop table if exists flashcards;")

  DB.exec(<<-SQL
    create table flashcards
    (
      id SERIAL,
      question  varchar(500),
      answer varchar(255)
    );
    SQL
  )

  # Creates the database from flash_card.csv file
  options = {:col_sep => "\n", :row_sep => "\n\n", :quote_char => "*"}
  CSV.foreach("flash_cards.csv", options) do |row|
    question = row[0].gsub("'", "''")
    answer = row[1]

    DB.exec(<<-SQL
    insert into flashcards (question, answer)
    values ('#{question}', '#{answer}');
    SQL
    )

  end

end



# db_connection.exec(<<-SQL
#   insert into students
#   values ('Lubaway', 'Topher', 'Fence Lizard', 14);
#   SQL
# )