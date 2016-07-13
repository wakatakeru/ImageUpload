# coding: utf-8
class UsersController < ApplicationController

  def index
<<<<<<< HEAD
    @users = User.all
=======
    @user = User.all
>>>>>>> 727ba3fde0d7823374f28d858e4b27f8c72ebfa5
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
