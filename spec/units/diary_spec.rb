require 'diary'
require 'pg'

describe Diary do
  subject { Diary.new }

  it 'should return the titles of the databse' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries (title) VALUES('title test 1');")
    expect(subject.view_titles).to include("title test 1")
  end

end
