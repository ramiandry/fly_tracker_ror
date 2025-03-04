class Api::V1::MailsController < ApplicationController
  def send_welcome_email
    @user = params[:email]
    UserMailer.welcome_email(@user).deliver_now
    render json: { succes: @user }
  end
end
