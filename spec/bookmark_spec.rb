require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      # Add the test data
      Bookmark.create('http://www.makersacademy.com')
      Bookmark.create('http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end