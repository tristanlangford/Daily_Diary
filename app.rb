require 'sinatra/base'
require_relative './lib/diary'
require 'date'

class DailyDiary < Sinatra::Base

  get ('/') do
    erb(:index)
  end

  post ("/view") do
    redirect '/view_titles'
  end

  get ("/view_titles") do
    @entries = Diary.all
    erb(:view_titles)
  end

  post ('/new_entry') do
    redirect '/add_entry'
  end

  get ('/add_entry') do
    @today = Date.today
    erb(:add_entry)
  end

  post ('/add') do
    Diary.add(params[:title], params[:body], params[:date], params[:tag])
    redirect '/'
  end

  get "/view_entry" do
    @entry = Diary.find_by_id(params[:id])
    erb(:view_entry)
  end

  get "/edit_entry" do
    @entry = Diary.find_by_id(params[:id])
    erb(:edit_entry)
  end

  post "/edit" do
    Diary.edit(params[:id], params[:title], params[:body], params[:date], params[:tag])
    redirect "/view_entry?id=#{params[:id]}"
  end

  post "/delete" do
    Diary.delete(params[:id])
    redirect "/view_titles"
  end

end
