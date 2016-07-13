# coding: utf-8
class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @param = params[:id]
    @params = @param.to_i
    @user = User.find(@params)
    @username = @user['login_id']
    @userbio  = @user['bio']
  end
    
  def new
    @user = User.new
  end

  def create
    user = User.new
    user.login_id = params['user']['login_id']
    user.email    = params['user']['email']
    user.password = params['user']['password']
    user.bio      = params['user']['bio']
    user.save

    redirect_to images_path
  end
  
end
