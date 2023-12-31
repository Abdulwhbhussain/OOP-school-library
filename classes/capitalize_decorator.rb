require_relative 'base_decorator'

# Prepare CapitalizeDecorator

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
