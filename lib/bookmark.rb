require 'pg'

class Bookmark 
    
  def self.all
    conn = PG.connect( dbname: 'bookmark_manager' ) 
    rs = conn.exec "SELECT * FROM bookmarks"
    rs.map { |bookmark| bookmark['url'] }

  end

end

# rs.each do |row|
#   puts "%s %s" % [ row['id'], row['url'] ]
# end
    