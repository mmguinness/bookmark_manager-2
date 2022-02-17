require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      # Add the test data
      Bookmark.create('http://www.makersacademy.com', 'makers website')
      Bookmark.create('http://www.google.com', 'google website')

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("makers website")
      expect(bookmarks).to include("google website")
    end
  end
end