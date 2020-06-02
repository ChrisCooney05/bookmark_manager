feature 'Bookmark Manager' do
  scenario 'Loads page with Bookmark Manager text' do
    visit('/')
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'is there a bookmarks button' do
  scenario 'interacts with onscreen button' do
    visit('/')
    expect(page).to have_button('Bookmarks')
  end
end

feature 'shows page with Your Bookmarks' do
  scenario 'it displays users bookmarks' do
    visit('/')
    click_button 'Bookmarks'
    expect(page).to have_content("google.com")
  end
end
