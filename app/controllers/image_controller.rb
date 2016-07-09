class ImageController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    redirect_to :index
  end
  
end
