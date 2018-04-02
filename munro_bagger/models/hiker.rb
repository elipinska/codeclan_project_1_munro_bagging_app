require_relative( '../db/sql_runner' )

class Hiker

  attr_reader :first_name, :last_name, :age, :munro_goal

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



end
