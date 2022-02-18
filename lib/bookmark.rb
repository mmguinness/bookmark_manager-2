require 'pg'

class Bookmark 
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
		  @id = id
		  @title = title
		  @url = url
  end

  def self.all
		  if ENV['RACK_ENV'] == 'test'
  			 conn = PG.connect(dbname: 'bookmark_manager_test') 
  		else
      conn = PG.connect(dbname: 'bookmark_manager') 
  		end
    result = conn.exec("SELECT * FROM bookmarks")
    result.map do |bookmark| 
  			 Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  		end
  end

	 def self.create(url:, title:)
 		 if ENV['RACK_ENV'] == 'test'
  			 conn = PG.connect(dbname: 'bookmark_manager_test') 
  		else
      conn = PG.connect(dbname: 'bookmark_manager') 
  		end
    result = conn.exec_params(
 "INSERT INTO bookmarks (title, url) VALUES($1, $2) RETURNING id, url, title;", [title, url])
 		 Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
 	end

	 def self.delete(id:)
 		 if ENV['RACK_ENV'] == 'test'
  			 conn = PG.connect(dbname: 'bookmark_manager_test') 
  		else
      conn = PG.connect(dbname: 'bookmark_manager') 
  		end
 		 conn.exec_params("DELETE FROM bookmarks WHERE id = $1;", [id])
 	end

end
