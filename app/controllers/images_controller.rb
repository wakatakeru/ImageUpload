class ImagesController < ApplicationController
  def index
    @imgs = Image.all
  end

  def show
  end
  
  def new
    @img = Image.new
  end

  def create
    img = Image.new
    img.title = params['image']['title']
    img.file  = params['image']['file']
    img.save      
    redirect_to images_path
  end
end
