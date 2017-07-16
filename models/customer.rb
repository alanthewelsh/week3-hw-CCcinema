require_relative('../db/sql_runner')

class Customer 
  attr_reader :id
  attr_accessor :name, :cash

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @cash = options['cash']
  end 

  def save
    sql = "INSERT INTO customers (name, cash) VALUES ('#{@name}', #{@cash}) RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end 

  def update()
     sql = "UPDATE customers SET (name, cash) = ('#{@name}', #{@cash} ) WHERE id = #{@id};"
      update = SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM customers where id = #{@id}"
     delete = SqlRunner.run(sql)
   end

  def   films()
    sql = "SELECT films.* FROM films
          INNER JOIN tickets ON tickets.film_id = films.id
          WHERE customer_id = #{@id};"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film)}
    return result 
  end 

  def ticket_count
    ticket_number = films.count
    return ticket_number
  end 

  def transaction
    @cash -= films.price
    sql = "UPDATE customers SET cash = (#{@cash});"
    transaction = SqlRunner.run(sql)
  end 

  def self.all
    sql = "SELECT * FROM customers"
    return self.map_items(sql)
  end 

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customer = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end 

end 