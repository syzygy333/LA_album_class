require_relative "../../lib/album"

describe Album do
  let (:album) { album = Album.new(42378942, "The Biz", "The Sea and Cake", 46.33) }

  describe '#duration_min' do
    it 'has a duration > 0' do
      expect(album.duration_min).to be > 0
    end
  end

  describe '#summary' do
    it 'returns a multi-line string' do
      expect(album.summary).to be String
    end
  end
end
