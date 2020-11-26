require "prawn"
class PdfsController < ApplicationController
  def show
    respond_to do |format|
     		# format.html
     		format.pdf { prawnto :prawn => {
          :page_layout => :landscape, # 縦:portrait、 横:landscape
          :page_size => 'A4',
          :left_margin => 20,
          :right_margin => 20,
          :top_margin => 20,
          :bottom_margin => 20
      	} ,
      	:inline => false
    	}
  	end
  end
end
