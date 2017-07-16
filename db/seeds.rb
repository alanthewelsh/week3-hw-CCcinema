require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )
require_relative( '../models/screening' )


require( 'pry-byebug' )

# Visit.delete_all()
# Location.delete_all()
# User.delete_all()

customer1 = Customer.new({ 'name' => 'film McMovie', 'cash' => 18.66 })
customer1.save
customer2 = Customer.new({ 'name' => 'movie McFilm', 'cash' => 29.44 })
customer2.save

film1 = Film.new({ 'title' => 'Kill Bill - volume 1', 'genre' => 'Action',  'price' => 9.50})
film1.save
film2 = Film.new({ 'title' => 'Star Wars - A Last Hope', 'genre' => 'Sci-Fi',  'price' => 10.66})
film2.save

# screening1 = Screening.new({ 'show_time' => '14:55', 'seats_avialble' => 12 })
# screening1.save

# screening2 = Screening.new({ 'show_time' => '17:50', 'seats_avialble' => '18' })
# screening2.save

# screening3 = Screening.new({ 'show_time' => '15:25', 'seats_avialble' => '9' })
# screening3.save

# screening4 = Screening.new({ 'show_time' => '18:26', 'seats_avialble' => '21' })
# screening4.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })
ticket2.save

ticket3 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })
ticket3.save

binding.pry
nil