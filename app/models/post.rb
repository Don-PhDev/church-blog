class Post < ApplicationRecord
  validates :title, :body, presence: true, allow_blank: false

  belongs_to :user

  has_rich_text :body
  has_many :comments, dependent: :destroy

  def first_body
    body_text&.first.squish
  end

  def last_body
    return "" if body_text&.last.split("]").last.squish == first_body
  end

  private

  def body_text
    self.body.to_plain_text.squish.split("[")
  end
end
