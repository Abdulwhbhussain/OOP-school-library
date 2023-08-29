# Prepare TrimmerDecorator

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name.slice(0, 10) if @nameable.correct_name.size > 10

    @nameable.correct_name
  end
end
