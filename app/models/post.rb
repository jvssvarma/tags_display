class Post < ApplicationRecord
  default_scope { includes(:tags) }
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :body, presence: true

  def posted_on
    created_at.strftime "Posted on %B %d, %Y"
  end

  def str_tags=(input_tags)
    self.tags = input_tags.split(/\W+/).map do |tag|
      Tag.find_or_create_by(name: tag.downcase)
    end
  end

  def str_tags
    tags.map(&:name).join(', ')
  end
end
