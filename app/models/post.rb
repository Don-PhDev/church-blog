class Post < ApplicationRecord
  validates :title, :body, presence: true, allow_blank: false

  has_rich_text :body
  has_many :comments
end
