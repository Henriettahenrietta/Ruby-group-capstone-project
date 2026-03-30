# Base Item class for managing items with archiving functionality
class Item
  attr_accessor :id, :publish_date, :archived

  # Constructor for Item
  # @param id [Integer] Unique identifier
  # @param publish_date [String] Date of publication (format: YYYY-MM-DD)
  # @param archived [Boolean] Whether the item is archived (default: false)
  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  # Check if item can be archived
  # @return [Boolean] true if item meets archiving conditions
  def can_be_archived?
    # Verify that publish_date is in the past (at least 1 day old)
    publish_date_obj = Date.parse(@publish_date)
    days_since_publish = (Date.today - publish_date_obj).to_i
    
    days_since_publish >= 1
  end

  # Move item to archive
  # @return [Boolean] true if successfully archived, false otherwise
  def move_to_archive
    if can_be_archived? && !@archived
      @archived = true
      true
    else
      false
    end
  end

  # Convert item to hash for JSON serialization
  # @return [Hash] Item data as hash
  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
