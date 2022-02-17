require 'pg'

class Bookmark 
    
  def self.all
		
		if ENV['RACK_ENV'] == 'test'
			conn = PG.connect( dbname: 'bookmark_manager_test' ) 
		else
    	conn = PG.connect( dbname: 'bookmark_manager' ) 
		end

    rs = conn.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| bookmark['url'] }

  end

	def self.create(url, title)

		if ENV['RACK_ENV'] == 'test'
			conn = PG.connect( dbname: 'bookmark_manager_test' ) 
		else
    	conn = PG.connect( dbname: 'bookmark_manager' ) 
		end

    conn.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
		conn.exec("INSERT INTO bookmarks (title) VALUES ('#{title}');")
	end

end