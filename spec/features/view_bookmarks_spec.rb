feature "View bookmarks" do
  
  scenario "see all bookmarks" do

    Bookmark.create('http://www.makersacademy.com')
    Bookmark.create('http://www.google.com')

    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.makersacademy.com")

  end

end
