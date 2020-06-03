require 'sinatra/base'

class DailyDiary < Sinatra::Base

  get ('/') do
    erb(:index)
  end

end
