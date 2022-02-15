feature "View bookmarks" do
  scenario "see all bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com/")
  end

end
