class Item
  attr_accessor :id, :publish_date, :archived

  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    days_since_publish = (Date.today - publish_date_obj).to_i
    
    days_since_publish >= 1
  end

  def move_to_archive
    if can_be_archived? && !@archived
      @archived = true
      true
    else
      false
    end
  end

  def to_h
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
