class ImagesController < ApplicationController
  def index
    @imgs = Image.limit(15)
    @userid = session[:user_id]
  end

  def show
    @sessionid = session[:user_id]
    @usersimg = Image.find_by_author_id(:all, @sessionid)
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
    
      img.title  = params['image']['title']
    
      File.open("public/img/#{Time.now.to_i}_#{session[:user_id]}.jpg", "wb") do |f|
        f.write(imgcontent)
      end
    end

    img.author_id = session[:user_id]
    
    img.save      
    redirect_to images_path
  end
end
