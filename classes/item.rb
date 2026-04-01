class Item
  attr_accessor :id, :publish_date, :archived, :genre, :author, :source, :label

  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    publish_date_obj = Date.parse(@publish_date)
    years_since_publish = (Date.today - publish_date_obj).to_i / 365
    
    years_since_publish >= 10
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
