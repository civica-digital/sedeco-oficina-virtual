class Resource < ActiveRecord::Base
  validates :name, :url, :category, presence: true
  validates :url, url: true
end
