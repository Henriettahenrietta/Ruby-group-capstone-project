# frozen_string_literal: true

class Source
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def to_h
    {
      id: @id,
      name: @name
    }
  end

  def self.from_h(data)
    new(data['id'], data['name'])
  end
end
