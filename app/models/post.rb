class Post < ApplicationRecord
  validates :title, :body, presence: true, allow_blank: false

  scope :by_recently_updated, -> { order(updated_at: :desc) }
end
