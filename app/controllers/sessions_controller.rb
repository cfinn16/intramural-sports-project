class SessionsController < ApplicationController
  def new

  end

  def create

    @player = Player.find_by(name: params[:session][:name])
    if params[:session][:email] == @player.email
      session[:user_id] = @player.id
      redirect_to player_path(@player)
    else
      flash[:danger] = 'Invalid name/email combination'
      render 'new'
    end
  end

  def destroy
    session.delete :username, :email
  end

end
