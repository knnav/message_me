class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def index
  end

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to root_path
    else
      flash[:error] = "Incorrect credentials"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      redirect_to root_path
    end
  end
end