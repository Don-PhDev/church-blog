class Post < ApplicationRecord
  validates :title, :body, presence: true, allow_blank: false

  belongs_to :user

  has_rich_text :body
  has_many :comments, dependent: :destroy
end
