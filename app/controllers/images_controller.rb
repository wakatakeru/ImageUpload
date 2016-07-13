# coding: utf-8
require 'bundler'
Bundler.require

class ImagesController < ApplicationController

  before_action :login_check

  def index
    @imgs = Image.all
    @userid = session[:user_id]
    # redirect_to root_path if @userid == nil
  end

  def show
    @img = Image.find_by_id(params[:id])
  end
  
  def new
    @img = Image.new
  end

  def create
    img = Image.new
    actionfile = params['image']['file']
    content = {}

    if actionfile != nil
      imgcontent = actionfile.read
      img.path = "/img/#{Time.now.to_i}_#{session[:user_id]}.jpg"
      img.thumbnail_path = "/img/#{Time.now.to_i}_#{session[:user_id]}_thumbnail.jpg"
      
      img.title  = params['image']['title']
    
      File.open("public/img/#{Time.now.to_i}_#{session[:user_id]}.jpg", "wb") do |f|
        f.write(imgcontent)
      end

      File.open("public/img/#{Time.now.to_i}_#{session[:user_id]}_thumbnail.jpg", "wb") do |f|
        thumb = Magick::Image.from_blob(imgcontent).shift
        f.write(thumb.resize_to_fill!(120, 120).to_blob)
      end
    end

    img.author_id = session[:user_id]
    
    if img.save      
      redirect_to images_path, :notice => "投稿に成功しました。"
    else
      redirect_to new_image_path, :notice => "投稿内容に不備があります。"
    end
  end

  def login_check
    is_login
  end
  
end
