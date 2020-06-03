require 'pg'

def empty_test_database
  p 'setting up database..'

      con = PG.connect :dbname => 'Diary_Test'

      p '.'

      con.exec "TRUNCATE TABLE entries"
end
