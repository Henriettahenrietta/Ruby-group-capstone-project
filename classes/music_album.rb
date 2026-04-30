# classes/music_album.rb
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(*args, on_spotify: false, archived: false, **_kwargs)
    publish_date = args[0]
    on_spotify = args[1] || on_spotify

    super(publish_date, id: rand(1..1000), archived:)

    @on_spotify = on_spotify
  end

  def can_be_archived?
    super || !@on_spotify
  end
end
