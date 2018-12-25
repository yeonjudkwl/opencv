class NokogiriController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  
  def index
    @title = Array.new
    
    118145.downto(118135) do |c|
        doc = Nokogiri::HTML(
            open("http://www.slrclub.com/bbs/zboard.php?id=canon_d30_forum&page=#{c}")
            )
        doc.css(".sbj > a").each do |x|
           @title << x.inner_text if x.inner_text.include?("?")
        end
    end
  end
end
