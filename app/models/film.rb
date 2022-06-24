class Film < ApplicationRecord
  validates :user_id, {presence: true}

  belongs_to :user, optional: true

  def user
    return Film.where(id: self.id)
  end


end