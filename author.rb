# frozen_string_literal: true

class Author
  attr_accessor :id, :first_name, :last_name

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
  end

  def to_h
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end

  def self.from_h(data)
    new(data['id'], data['first_name'], data['last_name'])
  end
end
