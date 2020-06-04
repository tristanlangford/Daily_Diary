feature 'allows the user to edit an entry' do

  xscenario 'fills the form with the entry' do
    connection = PG.connect(dbname: 'Diary_Test')

    # Add the test data
    connection.exec("INSERT INTO entries VALUES(1, 'title test 1', 'some words about the day I just had', '2020-01-09', 5);")
    visit('/view_entry?id=1')
    click_on('Edit')
    expect(page).to have_content("some words about the day I just had")
  end

end
