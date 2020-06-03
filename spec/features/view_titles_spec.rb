feature 'display titles of diary entries' do

  scenario 'should return the titles of the database' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    visit('/view_titles')
    expect(page).to have_content("title test 1")
  end

  scenario 'should have a link on the titles of the database' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    visit('/view_titles')
    expect(page).to have_link('title test 1', href: '/view_entry?id=1')
  end

  scenario 'view entry should display entry of its id parametre' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    visit('/view_entry?id=1')
    expect(page).to have_content('some words about the day I just had')
  end

end
