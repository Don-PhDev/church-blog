class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments, dependent: :destroy

  def username
    if name.nil? || name == ""
      email_to_name
    else
      name
    end
  end

  private

  def email_to_name
    email.split("@").first.capitalize
  end
end
