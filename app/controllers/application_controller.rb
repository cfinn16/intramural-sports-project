class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    Player.find_by({ id: session[:user_id] })
  end

end
