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

end
    