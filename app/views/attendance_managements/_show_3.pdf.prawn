p_pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
#=======================================
#背景ページ(background)
#=======================================
p_pdf.stroke_axis
p_pdf.line_width = 0.2
font_size = 10
gyou_kankaku = 17
gyou_half = 7

x = 0 #横
y = 500 #縦

21.times do
  p_pdf.bounding_box([x, y], :width => 70, :height => 20) do
    p_pdf.stroke_bounds
  end
  y -= 20
end

x = 70
y = 500

21.times do
  24.times do
    p_pdf.bounding_box([x, y], :width => 30, :height => 20) do
      p_pdf.stroke_bounds
    end
    x += 30
  end
  x = 70
  y -= 20
end

p_pdf.fill_color "000000"

x = 22
y = 487

p_pdf.draw_text "氏  名", :at => [x, y], :size => font_size
24.times do |n|
  p_pdf.draw_text "#{n+1}:00", :at => [x + 55, y], :size => 8
  x += 30
end
