require 'json'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(option = {})
    {
      title: @title,
      author: @author
    }.to_json(option)
  end
end
