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
    Bookmark.create(params[:url])
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0

end