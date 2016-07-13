# coding: utf-8
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @param = params[:id]
    @userimg = Array.new
    @params = @param.to_i
    @user = User.find(@params)
    @username = @user['login_id']
    @userbio  = @user['bio']

    Image.all.each do |item|
      if item[:author_id] == @param 
        @userimg.push(item)
      end
    end
    
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
    if user.save
      redirect_to login_path
    else
      redirect_to new_user_path, :notice => "入力内容に不備があります"
    end
  end
  
end
