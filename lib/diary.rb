require 'pg'
require 'sinatra'
require_relative 'entry'

class Diary

  def self.all
    con = set_database
    entries = con.exec "SELECT * FROM entries ORDER BY date DESC"
    entries.map { |entry| Entry.new(entry['id'], entry['title'], entry['body'], entry['date'], entry['tag']) }
  end

  def self.find_by_id(id)
    all.each { |entries| @entry = entries if entries.id == id }
    @entry
  end

  def self.add(title, body, date, tag)
    con = set_database
    entries = con.exec "INSERT INTO entries (title, body, date, tag) VALUES ('#{title}', '#{body}', '#{date}', #{tag})"
  end

  def self.edit(id, title, body, date, tag)
    con = set_database
    entries = con.exec "UPDATE entries SET title = '#{title}', body = '#{body}', date = '#{date}', tag = #{tag} WHERE id = #{id}"
  end

  def self.delete(id)
    con = set_database
    con.exec "DELETE FROM entries WHERE id = #{id}"
  end

  def self.set_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => "Diary_Test"
    else
      PG.connect :dbname => "Diary"
    end
  end

end
