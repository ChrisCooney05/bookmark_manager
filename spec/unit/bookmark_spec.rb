require 'bookmark'

describe Bookmark do
  it 'is a instance of the class Bookmark' do
    expect(subject).to be_a_kind_of Bookmark
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end
end 