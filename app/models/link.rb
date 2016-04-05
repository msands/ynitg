class Link < ActiveRecord::Base
  mount_uploader :snapshot, SnapshotUploader
  after_create :generate_slug, :screenshot_scrape

  # Display entire shortened URL
  def display_slug
    ENV['BASE_URL'] + self.slug
  end

  # Create link slug after base URL
  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  # Get screenshot and title page
  def screenshot_scrape
    Screenshot.perform_async(self.id)
    Scrape.perform_async(self.id)
  end

end
