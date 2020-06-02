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
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    visit('/bookmark')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
