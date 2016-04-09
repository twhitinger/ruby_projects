class Employee
# We need to create attr writer methods manually
# so we can validate the data. We can create reader
# methods automatically, though.
# The "name" attribute is inherited by both SalariedEmployee
# and HourlyEmployee
  attr_reader :name

  def name=(name)
    if name == ""
# Report an error if the name is blank
      raise "Name can't be blank!"
    end
# if no error store the name in the instance variable
    @name = name
  end
# The "initialize" methods of both SalariedEmployee and HourlyEmployee
# will call this method via "Super"
  def initialize(name = "Anonymous")
    self.name = name
  end
# The "print_pay_stub" methods of both SalariedEmployee and HourlyEmployee
# will call this method
  def print_name
    puts "Name: #{name}"
  end

end

class SalariedEmployee < Employee
# This attribute is specific to salaried employees
  attr_reader :salary

  def salary=(salary)
    if salary < 0
# report an error if the salary is negative
      raise "A salary of #{salary} isn't valid!"
    end
# if no error store the name in the instance variable
    @salary = salary
  end

  def initialize(name = "Anonymous", salary = 0.0)
    # Employee saftey with "initialize", will let us set up @name, @salary
    # before any other instance methods are called
    super(name) # Call the superclass's "initialize" method passing only the name
    self.salary = salary # Set the salary ourselves, since it is specific to this class
  end

  def print_pay_stub
# print the employeee name
    print_name
# calculate 14 day portion of salary(simple)
    pay_for_period = (@salary / 365.0) * 14
# Get a string with the pay amound rounded to 2 decimal places
    formatted_pay = format("%.2f", pay_for_period)
# print the amount paid
    puts "Pay this Period: $#{formatted_pay}"
  end
end

class HourlyEmployee < Employee

  def self.security_guard(name) # Define a new class method
#Create a new instance with the specified name, and a predefined hourly wage
# and hours per week.
    HourlyEmployee.new(name, 19.25, 30)
  end
  def self.cashier(name)
    HourlyEmployee.new(name, 12.75, 25)
  end
  def self.janitor(name)
    HourlyEmployee.new(name, 10.50, 20)
  end
  # These attributes are specific to hourly employees
  attr_reader :hourly_wage, :hours_per_week

  def hourly_wage=(hourly_wage)
    if hourly_wage < 0
      raise "An hourly wage of #{hourly_wage} isn't valid!"
  end
  @hourly_wage = hourly_wage
end

  def hours_per_week=(hours_per_week)
    if hours_per_week < 0
      raise "#{hours_per_week} hours per week isn't valid!"
    end
    @hours_per_week = hours_per_week
  end
# Called when we call "HourlyEmployee.new"
  def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0)
# Employee saftey with "initialize", will let us set up @name, @hourly_wage
# @hours_per_week before any other instance methods are called
    super(name) # call the superclass's "initialize" method. passing only the name
# set these ourself because they are specific to the class
    self.hourly_wage = hourly_wage
    self.hours_per_week = hours_per_week
  end

  def print_pay_stub
    print_name # Have the superclass print the name
    pay_for_period = hourly_wage * hours_per_week * 2 # calc two weeks pay
    formatted_pay = format("$%.2f", pay_for_period) # formate the pay 2 decimals
    puts "Pay This Period: #{formatted_pay}"
  end

end
