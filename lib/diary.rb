require 'pg'
require 'sinatra'
require_relative 'entry'

class Diary

  def self.all
    con = set_database
    entries = con.exec "SELECT * FROM entries"
    entries.map { |entry| Entry.new(entry['id'], entry['title'], entry['body'], entry['date'], entry['tag']) }
  end

  def self.find_by_id(id)
    all.each { |entries| @entry = entries if entries.id == id }
    @entry
  end

  def self.add(title, body, date, tag)
    con = set_database
    entries = con.exec "INSERT INTO entries (title, body, date, tag) VALUES('#{title}', '#{body}', '#{date}', #{tag})"
  end

  def self.set_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => "Diary_Test"
    else
      PG.connect :dbname => "Diary"
    end
  end

end
