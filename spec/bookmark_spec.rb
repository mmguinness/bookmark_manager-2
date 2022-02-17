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

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark').first

      expect(bookmark['url']).to eq 'http://www.example.org'
      expect(bookmark['title']).to eq 'Test Bookmark'
    end
  end
end