require 'pg'
require 'csv'

DATABASE_NAME = 'flashcard_racer'

ignore_errors = "/dev/null 2>&1" # this is a little helper for the line below

`createdb #{DATABASE_NAME} #{ignore_errors}`

db_connection = PG.connect( dbname: DATABASE_NAME )

db_connection.exec("drop table if exists flashcards;")

db_connection.exec(<<-SQL
  create table flashcards
  (
    id SERIAL,
    question  varchar(255),
    answer varchar(255)
  );
  SQL
)

options = {:col_sep => "\n", :row_sep => "\n\n", :quote_char => "*"}
CSV.foreach("flash_cards.csv", options) do |row|
  question = row[0]
  answer = row[1]

  db_connection.exec(<<-SQL
  insert into flashcards (question, answer)
  values ('#{question}', '#{answer}');
  SQL
  )

end

results = db_connection.exec("select * from flashcards;") # note that sometimes quotes are enough

puts "done."
puts "verifying selection ..."
puts



# db_connection.exec(<<-SQL
#   insert into students
#   values ('Lubaway', 'Topher', 'Fence Lizard', 14);
#   SQL
# )