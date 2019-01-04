class Team < ApplicationRecord
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players

  validates :name, { presence: true, length: { minimum: 5} }

end
