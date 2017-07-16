require_relative('../db/sql_runner')

class Screening

  attr_reader :id
  attr_accessor :show_time, :seats_availble

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @show_time = options['show_time']
    @seats_available = options['seats_availble'].to_i
  end

def save
  sql = "INSERT INTO screenings (show_time, seats_availble) VALUES ('#{@show_time}', '#{@seats_availble}') RETURNING id;"
  screening = SqlRunner.run(sql).first
  @id = screening['id'].to_i
end 

def update()
   sql = "UPDATE screening SET (show_time, seats_availble)= ( '#{@show_time}', '#{@seats_availble}') WHERE id = #{@id};"
    update = SqlRunner.run(sql)
 end

 def delete()
   sql = "DELETE FROM screenings where id = #{@id}"
   delete = SqlRunner.run(sql)
 end

end 