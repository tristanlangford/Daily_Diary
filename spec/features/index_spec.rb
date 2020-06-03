feature 'index page' do

  scenario 'it welcomes the user' do
    visit('/')
    expect(page).to have_content("Welcome to your Daily Diary")
  end

end
