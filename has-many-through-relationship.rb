class Waiter 
  attr_accessor :customer, :meal, :tip
  @@waiters = []

  def initialize(name, yrs_experience) 
    @name = name
    @yrs_experience = yrs_experience

    @@waiters << self
  end

  # (customer, waiter, meal, tip=0)
  def new_meal(customer, meal, tip)
    Meal.new(customer, self, meal, tip)
  end

  def self.all
    @@waiters
  end
end

class Customer
  attr_accessor :name, :age
  @@customers = []
  
  def initialize(name, age)
    @name = name
    @age = age

    @@customers << self
  end

  # (customer, waiter, meal, tip=0)
  def new_meal(waiter, meal, tip)
    Meal.new(self, waiter, meal, tip)
  end

  def meals
    Meal.all.select { |meal| meal.customer == self }
  end

  def self.all
    @@customers 
  end

end

class Meal
  attr_accessor :customer, :waiter, :meal, :tip
  @@meals = []

  def initialize(customer, waiter, meal, tip=0)
    @customer = customer
    @waiter = waiter
    @meal = meal
    @tip = tip

    @@meals << self
  end

  def self.all
    @@meals
  end
end 

alexandra = Customer.new("Alexandra", 30)
marcelo = Customer.new("Marcelo", 27)
marlon = Customer.new("Marlon", 27)
lauro = Waiter.new("Lauro", 2)
parafina = Waiter.new("Parafina", 5)

# CUSTOMER - # A Customer creates a Meal, passing in a Waiter instance
marlon.new_meal(lauro, 50, 10) 
marlon.new_meal(parafina, 20, 3) 
marcelo.new_meal(parafina, 100, 40) 

# WAITER - # A Waiter creates a Meal, passing in a Customer instance
lauro.new_meal(alexandra, 300, 100) 
lauro.new_meal(marlon, 30, 5)  
parafina.new_meal(marcelo, 15, 3) 

p alexandra.meals
puts ""
p marcelo.meals
puts ""
p marlon.meals
puts "==========="
p Meal.all.length