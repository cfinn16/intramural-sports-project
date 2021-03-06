class ApplicationController < ActionController::Base
  helper_method :current_user, :is_logged_in

  def current_user
    @current_user = Player.find_by({ id: session[:user_id] })
  end

  def is_logged_in
    current_user != nil
  end

end
