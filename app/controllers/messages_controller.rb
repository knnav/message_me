class MessagesController < ApplicationRecord
  def index
    @messages = Message.all
  end
  def show
    @message = Message.find(params[:id])
  end
end