class Dog
  attr_accessor :name, :breed, :id

  def initialize(id:nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
    )
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS dogs"

    DB[:conn].execute(sql)
  end

  # def save
  #   if self.id
  #     self.update
  #   else
  #     sql = <<-SQL
  #     INSERT INTO dogs(name, breed) VALUES (?, ?)
  #     SQL
  #
  #     DB[:conn].execute(sql, self.name, self.breed)
  #     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  #   end
  # end

  def self.create(name:, breed:)

  end

  def self.new_from_db(row)
    new_dog = Dog.new(row[0], row[1], row[2])
    new_dog
  end




end
