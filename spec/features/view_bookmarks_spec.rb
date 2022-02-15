feature "View bookmarks" do
  scenario "see all bookmarks" do

    conn = PG.connect( dbname: 'bookmark_manager_test' ) 

    # Add the test data
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/bookmarks')
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.makersacademy.com")
  end

end
