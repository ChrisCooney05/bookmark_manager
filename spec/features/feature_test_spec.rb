require 'pg'

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

feature 'Add bookmark' do
  scenario 'it should allow user input' do
    visit '/addbookmark'
    expect(page).to have_content "Add bookmark:"
    expect(page).to have_field "url"
    expect(page).to have_field "title"
  end
end
  

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit '/addbookmark'
    fill_in 'url', with: 'https://www.bbc.co.uk/'
    fill_in 'title', with: 'BBC'
    click_button 'Submit'
    visit '/addbookmark'
    fill_in 'url', with: 'http://www.makersacademy.com'
    fill_in 'title', with: 'Makers'
    click_button 'Submit'

    expect(page).to have_content "BBC"
    expect(page).to have_link 'Makers', href: 'http://www.makersacademy.com'
  end
end
