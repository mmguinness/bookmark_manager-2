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
			conn = PG.connect( dbname: 'bookmark_manager_test' ) 
		else
    	conn = PG.connect( dbname: 'bookmark_manager' ) 
		end
    result = conn.exec("SELECT * FROM bookmarks")
    result.map do |bookmark| 
			Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
		end
  end

	def self.create(url:, title:)

		if ENV['RACK_ENV'] == 'test'
			conn = PG.connect( dbname: 'bookmark_manager_test' ) 
		else
    	conn = PG.connect( dbname: 'bookmark_manager' ) 
		end

	# 	a hash of the form:
	# 	{:value  => String (value of bind parameter)
	# 	 :type   => Integer (oid of type of bind parameter)
	# 	 :format => Integer (0 for text, 1 for binary)
	# 	}
	# or, it may be a String. If it is a string, that is equivalent to the hash:
	# 	{ :value => <string value>, :type => 0, :format => 0 }


    result = conn.exec_params("INSERT INTO bookmarks (title, url) VALUES($1, $2) RETURNING id, url, title;", [title, url])
		Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
	end

end