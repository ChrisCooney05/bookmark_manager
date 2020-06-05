require 'pg'

class Bookmark

  attr_reader :url, :title, :id

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title 
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |row| 
      Bookmark.new(row["id"], row["url"], row["title"])
    end 
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == "test"
      con = PG.connect( dbname: 'bookmark_manager_test' )
    else
      con = PG.connect( dbname: 'bookmark_manager' )
    end  
    con.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}','#{title}')")
  end

  def self.delete(title)
    if ENV['ENVIRONMENT'] == "test"
      con = PG.connect( dbname: 'bookmark_manager_test' )
    else
      con = PG.connect( dbname: 'bookmark_manager' )
    end
    con.exec("DELETE FROM bookmarks WHERE title= '#{title}';")
  end
end