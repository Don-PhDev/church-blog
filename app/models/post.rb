class Post < ApplicationRecord
  validates :title, :body, presence: true, allow_blank: false

  has_rich_text :body

  scope :by_recently_updated, -> { order(updated_at: :desc) }
end
