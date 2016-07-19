# coding: utf-8
class UsersController < ApplicationController

  before_filter :login_check, :except => ['new', 'create']
  
  def index
    session_id = session[:user_id]
    user = User.find(session_id.to_i)
    redirect_to images_path, :notice => "該当ページを表示する権限がありません" if user[:is_admin] != true
    @users = User.all
  end

  def show
    @param = params[:id].to_i
    @userimg = Array.new
    @params = @param.to_i
    @user = User.find(@params)
    @username = @user['login_id']
    @userbio  = @user['bio']
    @session_id = session[:user_id]
    @user_id    = @params
    
    Image.all.each do |item|
      if item[:author_id] == @param 
        @userimg.push(item)
      end
    end
    
  end
    
  def new
    @user = User.new
    flash[:notice] = "このアカウントには管理者権限が付与されます" if User.all.empty?
  end

  def create
    user = User.create
    user.login_id = params['user']['login_id']
    user.email    = params['user']['email']
    user.password = params['user']['password']
    user.bio      = params['user']['bio']
    if User.all.empty? == false
      user.is_admin = false
      message = ""
    else
      user.is_admin = true
      message = "アカウント #{user.login_id} に管理者権限を付与しました"
    end
    
    if user.save
      redirect_to login_path, :notice => "正常に登録しました！#{message}"
    else
      redirect_to new_user_path, :notice => "入力内容に不備がありました。もう一度入力してください。"
    end
  end

  def edit
    redirect_to images_path, :notice => "該当ページを表示する権限がありません" if session[:user_id].to_s != params[:id] 
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(
         login_id: params['user']['login_id'],
         email:    params['user']['email'],
         password: params['user']['password'],
         bio:      params['user']['bio']
       )
      redirect_to images_path, :notice => "ユーザ情報は正常に更新されました。"
    else
      @user = user
      redirect_to edit_user_path, :notice => "ユーザ情報の更新に失敗しました。入力内容に不備があります。"
    end
  end

  def destroy
    # 応急的な削除処理
    img = Image.all
    img.each do |item|
      item.delete if item[:author_id].to_i == params[:id].to_i
    end

    User.find(params[:id]).delete
    redirect_to images_path, :notice => "ユーザの削除を完了しました"
  end
  
  private
  
  def login_check
    is_login
  end
  
end
