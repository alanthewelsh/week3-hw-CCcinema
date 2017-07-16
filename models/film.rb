require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :genre, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @price = options['price'].to_f
  end

  def save
    sql = "INSERT INTO films (title, genre, price) VALUES ('#{@title}', '#{@genre}', #{@price}) RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end 

  def price
    return @price
  end 

  def update()
     sql = "UPDATE films SET (title, genre, price)= ( '#{@title}', '#{@genre}', #{@price} ) WHERE id = #{@id};"
      update = SqlRunner.run(sql)
   end

   def delete()
     sql = "DELETE FROM films where id = #{@id}"
     delete = SqlRunner.run(sql)
   end

  def customers()
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON tickets.customer_id = customers.id
          WHERE film_id = #{@id};"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result 
  end 

  def customer_count
    customer_number = customers.count
    return customer_number
  end 


  def self.all
    sql = "SELECT * FROM films"
    return self.map_items(sql)
  end 

  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    film = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film)}
    return result
  end 

end 