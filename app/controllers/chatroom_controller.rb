class ChatroomController < ApplicationController
  def index
    unless session[:user_id]
      flash[:error] = "Only authenticated users are allowed to see this."
      redirect_to login_path
    end
    @messages = Message.all
  end
end