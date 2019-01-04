class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players

  validates :name, presence: true
  validates(:email, {presence: true, uniqueness: true})
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validate :check_for_full_name

  def check_for_full_name
    if name.split.size < 2
      errors.add(:name, "^Please write your full name")
    end
  end

end
