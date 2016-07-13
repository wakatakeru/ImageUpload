# coding: utf-8
class UsersController < ApplicationController

  def index
    @user = "ほげほげ"
  end

  def new
    @user = User.new
  end
  
  def show
    @user = "ほげほげ"
  end
  
end
