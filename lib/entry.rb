require 'sinatra'

class Entry

  attr_reader :id, :title, :body, :date, :tag

  def initialize(id, title, body, date, tag)
    @id = id
    @title = title
    @body = body
    @date = date
    @tag = tag
  end

end
