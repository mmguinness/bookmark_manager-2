require 'pg'

def setup_test_database
  p "setting up test database..."

  conn = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the bookmarks table
  conn.exec("TRUNCATE bookmarks;")
end
