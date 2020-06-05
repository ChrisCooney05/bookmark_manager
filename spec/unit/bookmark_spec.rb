require 'bookmark'
require 'pg'

describe Bookmark do
  it 'is has a bookmark class ' do
    expect(Bookmark).to respond_to(:new)
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      Bookmark.create('http://www.makersacademy.com', 'Makers')
      Bookmark.create('http://www.destroyallsoftware.com', 'DAS')
      Bookmark.create('http://www.google.com', 'Google')
  
      bookmarks = Bookmark.all
  
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_instance_of(Bookmark)
    end
  end

  describe '.create' do
    it "should insert a url into the database table" do
      Bookmark.create("www.google.com", "Google")
      bookmark = Bookmark.all.first
      
      expect(bookmark.url).to eq "www.google.com"
      expect(bookmark.title).to eq "Google"
    end
  end

  describe '.delete' do
    it 'Should delete bookmarks using .delete' do
      Bookmark.create("www.amazon.co.uk", "Amazon")
      Bookmark.create("www.google.com", "Google")
      Bookmark.delete('Google')
      bookmark = Bookmark.all.last
      expect(bookmark.title).to eq('Amazon')
    end
  end
end
