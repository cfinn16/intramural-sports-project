class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)

    if @player.valid?
      session[:user_id] = @player.id
      redirect_to @player
    else
      @errors = @player.errors.full_messages
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def current_player
    @player = Player.find_by({ id: session[:user_id] })
    render :show
  end

  private

  def player_params
    params.require(:player).permit(:name, :email, :team_ids)
  end

end
