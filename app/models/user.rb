class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :films

  def self.guest
      find_or_create_by(email: 'guesr@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      end
  end

  def films
    return Film.where(user_id: self.id)
  end
end