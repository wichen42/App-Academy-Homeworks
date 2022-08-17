require 'sqlite3'
require 'singleton'
require_relative 'plays.rb'


class PlayDBConnection < SQLite3::Database
    include Singleton
  
    def initialize
      super('plays.db')
      self.type_translation = true
      self.results_as_hash = true
    end
end


class PlayWright


    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM plays")
        data.map { |datum| Play.new(datum) }
    end

    def initialize
        @id = options['id']
        @title = options['title']
        @year = options['year']
        @playwright_id = options['playwright_id']
    end
    
    def create
        raise "#{self} already in database" if self.id
        PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
          INSERT INTO
            plays (title, year, playwright_id)
          VALUES
            (?, ?, ?)
        SQL
        self.id = PlayDBConnection.instance.last_insert_row_id
      end

    def update
        raise "#{self} not in database" unless self.id
        PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
            UPDATE
            plays
            SET
            title = ?, year = ?, playwright_id = ?
            WHERE
            id = ?
        SQL
    end

end
