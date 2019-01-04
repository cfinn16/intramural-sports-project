class League < ApplicationRecord
  has_many :teams
  belongs_to :city

  validates(:name, {presence: true, uniqueness: true}
  )
  validates :sport, inclusion: { in: %w(Soccer Basketball Softball Kickball Dodgeball Volleyball Hockey Football)}

  validates :day_of_week, inclusion: { in: %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday), message: "%{value} is not a valid day of the week." }
  validates :cost, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1000 }
  validates :level, inclusion: { in: %w(Beginner Intermediate Experienced), message: " must be 'Beginner', 'Intermediate' or 'Experienced.'"}


end


# link: Rails.application message: "Sorry, we don't offer %{value}. See the full list of <a href="%{link}">eligible sports here</a>."}
