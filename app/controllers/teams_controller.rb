class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)

    if @team.valid?
      redirect_to @team
    else
      @errors = @team.errors.full_messages
      render :new
    end
  end

  def payment
    @team = Team.find(params[:id])

    @team.update(paid: true)

    redirect_to @team
  end

  def join_league
    @league = League.find(params[:id])
    @team = Team.new

    render :join

    if @team.valid?
      redirect_to @team
    else
      @errors = @team.errors.full_messages
    end
  end

  def add_to_teams
    @team = Team.find(params[:id])
    @player = Player.find(session[:user_id])
    @player.teams << @team
    redirect_to player_path(@player)
  end

  private

  def team_params
    params.require(:team).permit(:name, :paid, :league_id)
  end

end
