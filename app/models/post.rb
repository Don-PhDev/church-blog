class Post < ApplicationRecord
  validates :title, :body, presence: true, allow_blank: false

  has_rich_text :body
  has_many :comments

  scope :by_recently_updated, -> { order(updated_at: :desc) }
end
