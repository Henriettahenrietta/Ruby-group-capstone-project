module ListMusicAlbums
  def list_music_albums
    puts "\nALBUMS LIST:\n"

    if @music_albums.empty?
      puts 'No music albums available.'
    else
      @music_albums.each_with_index do |album, index|
        genre_name = album.genre&.name || 'Unknown'
        label_title = album.label&.title || 'Unknown'
        author_name = if album.author
                        "#{album.author.first_name} #{album.author.last_name}"
                      else
                        'Unknown'
                      end

        puts "#{index + 1}. Published on #{album.publish_date}, " \
             "#{album.on_spotify ? 'Available on Spotify' : 'Not available on Spotify'}, " \
             "Genre: #{genre_name}, Label: #{label_title}, Author: #{author_name}"
      end
    end
  end
end