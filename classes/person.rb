# Person Class

class Person
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Getters and Setters

  def id
    @id
  end
  def name
    @name
  end
  def age
    @age
  end
  def name=(value)
    @name = value
  end
  def age=(value)
    @age = value
  end

  # Public Methods
  def can_use_services?
    of_age? || @parent_permission
  end

  # Private Methods
  private
  
  def of_age?
    @age >= 18
  end
end