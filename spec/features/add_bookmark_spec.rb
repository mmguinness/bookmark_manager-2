feature "Add bookmark" do

  scenario "user can add a bookmark to their list" do
    visit('/bookmarks/new')
    fill_in :url, with: 'http://www.google.com'
    fill_in :title, with: 'google website'
    click_on 'Add'

    expect(page).to have_link('google website', href: 'http://www.google.com')
  end

end
