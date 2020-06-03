feature 'display titles of diary entries' do

  it 'should return the titles of the database' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    visit('/view_titles')
    expect(page).to have_content("title test 1")
  end

end
