module ApplicationHelper
  def latest_album
    Rails.cache.fetch("albums", expires_in: 1.hour) do
      @latest_albums ||= Album.latest.first(2)
    end
  end
end