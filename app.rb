require 'sinatra/base'

class DailyDiary < Sinatra::Base

  get ('/') do
    erb(:index)
  end

  post ("/view") do
    redirect '/view_titles'
  end

  get ("/view_titles") do
    erb(:view_titles)
  end

  post ('/new_entry') do
    redirect '/add_entry'
  end

  get ('/add_entry') do
    erb(:add_entry)
  end

end
