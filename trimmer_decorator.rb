require './decorator'

# TrimmerDecorator class
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10) if @nameable.correct_name.length > 10
  end
end
