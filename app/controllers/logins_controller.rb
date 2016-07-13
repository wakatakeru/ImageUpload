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
      redirect_to images_path
    else
      redirect_to root_path, :notice => "認証エラー。 IDまたはパスワードが違います。"
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_path
  end

end
