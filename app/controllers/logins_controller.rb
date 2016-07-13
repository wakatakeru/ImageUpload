# coding: utf-8
class LoginsController < ApplicationController
  def index
    render "index"
  end

  def show
    render "new"
  end

  def create
    user = User.find_by_login_id(params[:login_id])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = "認証エラー。もう一度入力してください"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end

end
