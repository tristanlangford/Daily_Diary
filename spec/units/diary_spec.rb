require 'diary'
require 'pg'

describe Diary do

  it 'should return the titles of the databse' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    expect(Diary.all.first.title).to eq("title test 1")
  end

  it 'should add an entry to the data base' do
    Diary.add('title test 1', 'some words about the day I just had', '2020-01-09', 5)
    expect(Diary.all.first.title).to eq("title test 1")
  end

  it 'should edit an entry' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    Diary.edit(1, 'title test 2', 'some different words', '2020-01-09', '2')
    expect(Diary.all.first.title).to eq("title test 2")
  end

  it 'deletes from database' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    connection.exec("INSERT INTO entries VALUES(2, 'title test 2', 'some words about the day I just had', '2020-01-09', 5);")
    Diary.delete(1)
    expect(Diary.all.first.title).to eq("title test 2")
  end


end
