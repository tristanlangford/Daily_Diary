require 'pg'
require 'sinatra'

class Diary

  def view_titles
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => "Diary_Test"
    else
      con = PG.connect :dbname => "Diary"
    end

    titles = con.exec "SELECT * FROM entries"

    titles.map { |entry| entry['title'] }
  end

end
