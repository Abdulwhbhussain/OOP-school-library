require_relative 'nameable'
# Person Class

class Person < Nameable
  attr_reader :rentals, :parent_permission
  attr_accessor :name, :age, :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Public Methods
  # def add_rental(rental)
  #   @rentals << rental
  #   rental.person = self
  # end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # Private Methods
  private

  def of_age?
    @age >= 18
  end
end
