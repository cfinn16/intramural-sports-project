class City < ApplicationRecord
  has_many :leagues

  def most_popular
    self.leagues.max_by{|l| l.teams.count}
  end
end
