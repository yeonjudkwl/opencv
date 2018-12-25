class OpencvController < ApplicationController
  require 'opencv'
  include OpenCV
  
  def index
  end
  
  def view
    if ARGV.length < 2
      puts "Usage: ruby #{__FILE__} source dest"
      exit
    end
    
    data = '/usr/share/opencv/haarcascades/haarcascade_frontalface_alt.xml'
    detector = CvHaarClassifierCascade::load(data)
    image = CvMat.load(params[:photo].path)
    detector.detect_objects(image).each do |region|
      color = CvColor::Blue
      image.rectangle! region.top_left, region.bottom_right, :color => color
    end
    
    image.save_image("output.jpg")
    
    send_file("output.jpg",:disposition => 'inline')
  end
end
