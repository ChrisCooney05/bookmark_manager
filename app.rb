require './lib/bookmark'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmark' do
    @bookmarks = Bookmark.new.bookmarks
    erb :bookmark
  end

  run! if app_file == $0

end
