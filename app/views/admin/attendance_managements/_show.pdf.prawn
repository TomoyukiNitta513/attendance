p_pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
#=======================================
#　明細表の背景ページ(background)
#=======================================
p_pdf.stroke_axis
p_pdf.line_width = 0.2
font_size = 10
gyou_kankaku = 17
gyou_half = 7
x = 45 #横
y = 750 #縦
p_pdf.draw_text "給与明細書", :at => [x + 195, y], :size => 14
p_pdf.draw_text "部門", :at => [x, y - 80], :size => font_size
p_pdf.draw_text "従業員コード", :at => [x + 70, y - 80], :size => font_size
p_pdf.draw_text "時給", :at => [x + 140, y - 80], :size => font_size
p_pdf.draw_text "氏名", :at => [x + 210, y - 80], :size => font_size

4.times do
  p_pdf.bounding_box([x - 6, y - 66], :width => 70, :height => 20) do
      p_pdf.stroke_bounds
  end
  p_pdf.bounding_box([x - 6, y - 86], :width => 70, :height => 24) do
      p_pdf.stroke_bounds
  end
  x += 70
end

x = 45
y = 620
p_pdf.draw_text "勤怠", :at => [x, y - 10], :size => font_size
p_pdf.draw_text "出勤日数", :at => [x + 70, y], :size => font_size
p_pdf.draw_text "勤務時間", :at => [x + 140, y], :size => font_size

3.times do
  p_pdf.bounding_box([x - 6, y + 20], :width => 70, :height => 50) do
    p_pdf.stroke_bounds
  end
  y -= 50
end

x = 109
y = 640
3.times do
  p_pdf.bounding_box([x, y], :width => 70, :height => 25) do
    p_pdf.fill_color "0000ff"
    p_pdf.stroke_bounds
  end
  p_pdf.bounding_box([x, y - 25], :width => 70, :height => 25) do
    p_pdf.stroke_bounds
  end
  x += 70
end

x = 109
y = 590
2.times do
  6.times do
    p_pdf.bounding_box([x, y], :width => 70, :height => 25) do
      p_pdf.stroke_bounds
    end
    p_pdf.bounding_box([x, y - 25], :width => 70, :height => 25) do
      p_pdf.stroke_bounds
    end
    x += 70
  end
  x = 109
  y = 540
end

x = 459
y = 490
p_pdf.bounding_box([x, y], :width => 70, :height => 25) do
  p_pdf.stroke_bounds
end
p_pdf.bounding_box([x, y - 25], :width => 70, :height => 25) do
  p_pdf.stroke_bounds
end

x = 45
y = 570
p_pdf.draw_text "支給", :at => [x, y - 10], :size => font_size
p_pdf.draw_text "基本給", :at => [x + 70, y], :size => font_size
p_pdf.draw_text "特別手当", :at => [x + 140, y], :size => font_size
p_pdf.draw_text "交通費", :at => [x + 210, y], :size => font_size
p_pdf.draw_text "課税支給額", :at => [x + 280, y], :size => font_size
p_pdf.draw_text "非課税支給額", :at => [x + 350, y], :size => font_size
p_pdf.draw_text "総支給額", :at => [x + 420, y], :size => font_size
y = 520
p_pdf.draw_text "控除", :at => [x, y - 10], :size => font_size
p_pdf.draw_text "所得税", :at => [x + 70, y], :size => font_size
y = 470
p_pdf.draw_text "差引支給額", :at => [x + 420, y], :size => font_size
