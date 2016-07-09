class ImagesController < ApplicationController
  def index
    @imgs = Image.limit(15)
  end

  def show
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
      img.path = "/img/#{Time.now.to_i}.jpg"
    
      img.title  = params['image']['title']
    
      File.open("public/img/#{Time.now.to_i}.jpg", "wb") do |f|
        f.write(imgcontent)
      end
    end
    
    img.save      
    redirect_to images_path
  end
end
