class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.create(league_params)

    if @league.valid?
      redirect_to @league
    else
      @errors = @league.errors.full_messages
      render :new
    end
  end

  def show
    @league = League.find(params[:id])
  end

  def new_in_city
    @city = City.find(params[:id])
    @league = League.new

    render :new_in_city

    if @league.valid?
      redirect_to @league
    else
      @errors = @league.errors.full_messages
    end
  end

  def popular
    @league = League.most_popular

    redirect_to @league
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])

    if @league.valid?
      @league.update(league_params)
      redirect_to @league
    else
      @errors = @league.errors.full_messages
      render :edit
    end
  end

  def destroy
    @league = League.find(params[:id])
    @city = @league.city
    @league.delete

    redirect_to city_path(@city)
  end

  private

  def league_params
    params.require(:league).permit(:name, :sport, :day_of_week, :cost, :level, :city_id)
  end


end
