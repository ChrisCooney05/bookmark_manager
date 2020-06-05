require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/addbookmark' do
    erb :addbookmark
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/confirm' do
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  get '/delete' do 
    @bookmarks = Bookmark.all
    erb :delete
  end

  post '/confirm-delete' do
    Bookmark.delete(params[:delete]) 
    redirect '/bookmarks'
  end

  run! if app_file == $0

end