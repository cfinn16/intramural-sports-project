class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    if params[:search]
      @leagues = League.all.where("city_id = ?", @city.id).where("sport LIKE ?", params[:search])
    else
      @leagues = @city.leagues
    end
  end

  def popular
    @city = City.find(params[:id])
    @league = @city.most_popular
    redirect_to @league
  end

end
