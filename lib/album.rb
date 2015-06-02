class Album
  attr_reader :id, :album, :artists
  attr_writer :tracks, :duration
  def initialize(id, album, artists, duration)
    @id = id
    @album = album
    @artists = artists
    @duration = []
    @tracks = []
  end

  def duration
    @duration
  end

  def duration_min
    total_time = 0
    @duration.each do |time|
      total_time += time.to_i
    end
      all_seconds = total_time / 1000
      minutes = all_seconds / 60
      seconds = all_seconds % 60
      if seconds < 10
        seconds_s = "0" + seconds.to_s
        album_time = "#{minutes}:#{seconds_s}"
      else
        album_time = "#{minutes}:#{seconds}"
      end
      album_time
  end

  def tracks
    @tracks
  end

  def summary
<<-WHATEVER
Name: #{album}
Artist(s): #{artists}
Duration (min.): #{duration_min}
- #{tracks.join("\n- ")}
WHATEVER
  end
end
