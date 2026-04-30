module ListMusicAlbums
  def list_music_albums
    puts "\nALBUMS LIST:\n"
    return puts 'No music albums available.' if @music_albums.empty?

    @music_albums.each_with_index do |album, index|
      puts album_details(album, index)
    end
  end

  private

  def album_details(album, index)
    "#{index + 1}. Published on #{album.publish_date}, " \
      "#{spotify_status(album)}, " \
      "Genre: #{safe_name(album.genre, :name)}, " \
      "Label: #{safe_name(album.label, :title)}, " \
      "Author: #{author_name(album.author)}"
  end

  def spotify_status(album)
    album.on_spotify ? 'Available on Spotify' : 'Not available on Spotify'
  end

  def safe_name(object, field)
    object&.send(field) || 'Unknown'
  end

  def author_name(author)
    return 'Unknown' unless author

    "#{author.first_name} #{author.last_name}"
  end
end
