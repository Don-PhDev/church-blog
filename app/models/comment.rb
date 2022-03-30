class Comment < ApplicationRecord
  validates :body, presence: true, allow_blank: false

  belongs_to :post
  belongs_to :user
  broadcasts_to :post

  def commented_time_ago
    posted_time_passed.downcase.split(" ").drop(1).join(" ")
  end
end
