require 'date'

# Item is the base class for items that can be archived
class Item
  attr_accessor :id, :publish_date, :archived, :label

  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  # Determine whether the item is old enough to archive
  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    years_since_publish = (Date.today - publish_date_obj).to_f / 365.25
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
