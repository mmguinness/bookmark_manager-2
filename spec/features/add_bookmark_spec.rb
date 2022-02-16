feature "Add bookmark" do

  scenario "user can add a bookmark to their list" do
    
    visit('/bookmarks')

    fill_in :url, with: 'http://www.google.com'
    click_on 'Add'

    expect(page).to have_content("http://www.google.com")

  end

end