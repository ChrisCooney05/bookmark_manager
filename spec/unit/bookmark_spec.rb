require 'bookmark'
require 'pg'

describe Bookmark do
  it 'is a instance of the class Bookmark' do
    expect(subject).to be_a_kind_of Bookmark
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      Bookmark.create('http://www.makersacademy.com')
      Bookmark.create('http://www.destroyallsoftware.com')
      Bookmark.create('http://www.google.com')
  
      bookmarks = Bookmark.all
  
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it "should insert a url into the database table" do
      Bookmark.create('https://www.bbc.co.uk/')
      expect(Bookmark.all).to include 'https://www.bbc.co.uk/'
    end
  end
end
