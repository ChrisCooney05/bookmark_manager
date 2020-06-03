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
  end
  
  scenario 'We should be able to see an added bookmark' do
    visit '/addbookmark'
    fill_in 'url', with: 'https://www.bbc.co.uk/'
    click_button 'Submit'
    expect(page).to have_content 'https://www.bbc.co.uk'
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit '/addbookmark'
    fill_in 'url', with: 'https://www.bbc.co.uk/'
    click_button 'Submit'
    visit '/addbookmark'
    fill_in 'url', with: 'http://www.makersacademy.com'
    click_button 'Submit'

    expect(page).to have_content "https://www.bbc.co.uk/"
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
