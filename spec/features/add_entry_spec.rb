feature 'add entry page' do

  scenario 'it tells the user about the page' do
    visit('/add_entry')
    expect(page).to have_content("Tell me about your day...")
  end

end
