class Waiter 
  attr_accessor :name, :yrs_experience
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

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    best_tipped_meal = self.meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
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

  def waiters
    self.meals.map { |meal| meal.waiter }.uniq
  end

  def last_waiter 
    self.waiters.last.name
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
renan = Waiter.new("Renan", 10)

# CUSTOMER - # A Customer creates a Meal, passing in a Waiter instance
marlon.new_meal(lauro, 50, 10) 
marlon.new_meal(parafina, 20, 3)
marcelo.new_meal(parafina, 100, 40) 

# WAITER - # A Waiter creates a Meal, passing in a Customer instance
lauro.new_meal(marlon, 30, 5)  
lauro.new_meal(alexandra, 300, 100) 
renan.new_meal(marcelo, 400, 100) 
renan.new_meal(marcelo, 100, 25) 
puts "======================"
puts "Meal.all.length"
puts "======================"
p Meal.all.length
puts "======================"
puts "  Customer.meals"
puts "======================"
 alexandra.meals
puts ""
 marcelo.meals
puts ""
 marlon.meals
puts "======================"
puts "  Customer.waiter"
puts "======================"
p marlon.waiters
puts "======================"
puts "Customer.last_waiter"
puts "======================"
p marlon.last_waiter
puts "======================"
puts "======================"
puts "    Waiter.meals"
puts "======================"
p lauro.meals
puts ""
p renan.meals
puts "======================"
puts "  Waiter.best_tipper"
puts "======================"
p lauro.best_tipper