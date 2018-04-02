require_relative( '../db/sql_runner' )

class Hiker

  attr_accessor :first_name, :last_name, :age, :munro_goal
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @first_name = options['first_name']
      @last_name = options['last_name']
      @age = options['age'].to_i
      @munro_goal = options['munro_goal'].to_i if options['munro_goal']
  end

  def save()
    sql = "INSERT INTO hikers
    (
      first_name,
      last_name,
      age,
      munro_goal
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @age, @munro_goal]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM hikers"
    results = SqlRunner.run( sql )
    return results.map { |hiker| Hiker.new(hiker) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM hikers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Hiker.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM hikers"
    SqlRunner.run( sql )
  end

  def update()
     sql = "UPDATE hikers
            SET (first_name, last_name, age, munro_goal) = ($1, $2, $3, $4)
            WHERE id = $5"
     values = [@first_name, @last_name, @age, @munro_goal, @id]
     SqlRunner.run(sql, values)
   end

   def delete()
     sql = "DELETE FROM hikers
            WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
   end



end
