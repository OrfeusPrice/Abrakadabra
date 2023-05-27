begin
  require 'sqlite3'
rescue LoadError
  raise "Sqlit3 is required, please install the gem as follows: sudo gem install 'sqlite3-ruby' -y"
end

class RwdStorage
  
  def initialize
    connect
    check_and_initialize
  end
  
  def show_tables
    @db.execute("SELECT name FROM SQLITE_MASTER where type='table'").flatten
  end
  
  def find_random_word
    @db.execute("SELECT word FROM wordlist ORDER BY random() LIMIT 1;").first.first
  end
  
  def find_word_of_length(length)
    row = @db.execute("SELECT word FROM wordlist WHERE length = #{length} ORDER BY random() LIMIT 1;")
    row.first ? row.first.first : nil
  end
  
  def drop_table
    @db.execute "DROP TABLE IF EXISTS wordlist;"
  end
  
  def setup_database
    connect
    drop_table
    create_schema
    load_words
  end
  
  protected
  
  def connect
    @db = SQLite3::Database.new( "#{File.dirname(__FILE__)}/wordlist.db" )
  end
  
  def create_schema
    @db.execute " CREATE TABLE wordlist ( idx INTEGER PRIMARY KEY, word VARCHAR(255), length INTEGER ); "
  end

  def load_words
    File.open(File.dirname(__FILE__) + "/wordlist.txt").each do |line|
        if line =~ /w+/
          word = line.gsub(/\r\n/, '')
          @db.execute( "insert into wordlist (word, length) VALUES " +  "( '#{word}', '#{word.size}');" )
          # puts line
        end
    end
  end
  
  def check_and_initialize
    unless show_tables.detect{|t| t == "wordlist" }
      p "creating the wordlist database..."
      setup_database
    end
  end
  
end