class Resource < ActiveRecord::Base
  validates :name, :url, :category, presence: true
  validates :url, url: true

  def youtube_video?
    url.downcase.gsub(".", "").include?("youtube")
  end

  def pdf_document?
    url.downcase.include?(".pdf")
  end
end
