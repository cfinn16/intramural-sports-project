class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)

    if @player.valid?
      redirect_to @player
    else
      @errors = @player.errors.full_messages
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :team_ids)
  end

end
