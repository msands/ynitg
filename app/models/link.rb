class Link < ActiveRecord::Base

  # Display entire shortened URL
  def display_slug
    ENV['BASE_URL'] + self.slug
  end

  # Create link slug after base URL
  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

end
