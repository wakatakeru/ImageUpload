# coding: utf-8
class UsersController < ApplicationController

  def index
    @user = "ほげほげ"
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    user.login_id = params['user']['login_id']
    user.email    = params['user']['email']
    user.password = params['user']['password']
    user.save

    redirect_to images_path
  end
  
  def show

  end
  
end
