class StaticPagesController < ApplicationController

  skip_before_action :ensure_logged_in

  def home
  end

  def login
  	if params[:username] == 'user' && params[:password] == 'password'
  		session[:logged_in] = true
      redirect_to menucard_path
  	else
  		flash[:error] = "Incorrect username/password"
  		redirect_to root_path
  	end
  end
end
