pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
render :partial => 'show.pdf.prawn', :locals => { :p_pdf => pdf }
