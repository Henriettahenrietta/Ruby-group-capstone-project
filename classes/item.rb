require 'date'

# Item is the base class for items that can be archived
class Item
  attr_accessor :id, :publish_date, :archived, :label

  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = publish_date.to_s
    @archived = archived
  end

  # Determine whether the item is old enough to archive
  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    days_since_publish = (Date.today - publish_date_obj).to_i
    return false if days_since_publish < 1
    return true if days_since_publish <= 10

    years_since_publish = days_since_publish.to_f / 365.25
    years_since_publish >= 10
  end

  # Archive the item when conditions are met
  def move_to_archive
    return false if @archived

    if can_be_archived?
      @archived = true
      true
    else
      false
    end
  end

  # Convert item fields to a hash for JSON storage
  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
