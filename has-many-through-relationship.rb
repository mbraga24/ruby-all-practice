class Waiter 
  attr_accessor :customer, :meal, :tip
  @@waiters = []

  def initialize(name, yrs_experience) 
    @name = name
    @yrs_experience = yrs_experience

    @@waiters << self
  end

  # (customer, waiter, meal, tip=0)
  def self.new_meal(customer, meal, tip)
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
  def self.new_meal(waiter, meal, tip)
    Meal.new(self, waiter, meal, tip)
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