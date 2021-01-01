p_pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
#=======================================
#　明細表の背景ページ(background)
#=======================================
# p_pdf.stroke_axis
p_pdf.line_width = 0.2
font_size = 10
gyou_kankaku = 17
gyou_half = 7

x = 39 #横
y = 684 #縦

p_pdf.fill_color "f0f0f0"

4.times do
  p_pdf.fill_rectangle [x, y], 70, 25
  x += 70
end

x = 109
y = 634

p_pdf.fill_rectangle [x - 70, y], 70, 50

3.times do
  p_pdf.fill_rectangle [x , y], 70, 25
  x += 70
end

x = 109
y = 584

p_pdf.fill_rectangle [x - 70, y], 70, 50

6.times do
  p_pdf.fill_rectangle [x , y], 70, 25
  x += 70
end

x = 109
y = 534

p_pdf.fill_rectangle [x - 70, y], 70, 50

6.times do
  p_pdf.fill_rectangle [x , y], 70, 25
  x += 70
end

x = 459
y = 484

p_pdf.fill_rectangle [x, y], 70, 25

p_pdf.fill_color "000000"

x = 45
y = 750
p_pdf.draw_text "給与明細書", :at => [x + 195, y], :size => 14

p_pdf.draw_text "部門", :at => [x + 18, y - 82], :size => font_size
p_pdf.draw_text "従業員コード", :at => [x + 70, y - 82], :size => font_size
p_pdf.draw_text "時給", :at => [x + 159, y - 82], :size => font_size
p_pdf.draw_text "氏名", :at => [x + 229, y - 82], :size => font_size

4.times do
  p_pdf.bounding_box([x - 6, y - 66], :width => 70, :height => 25) do
      p_pdf.stroke_bounds
  end
  p_pdf.bounding_box([x - 6, y - 91], :width => 70, :height => 25) do
      p_pdf.stroke_bounds
  end
  x += 70
end

x = 45
y = 617
p_pdf.draw_text "勤怠", :at => [x + 19, y - 11], :size => font_size
p_pdf.draw_text "出勤日数", :at => [x + 79, y], :size => font_size
p_pdf.draw_text "勤務時間", :at => [x + 149, y], :size => font_size

x = 39
y = 634

3.times do
  p_pdf.bounding_box([x, y], :width => 70, :height => 50) do
    p_pdf.stroke_bounds
  end
  y -= 50
end

x = 109
y = 634
3.times do
  p_pdf.bounding_box([x, y], :width => 70, :height => 25) do
    p_pdf.stroke_bounds
  end
  p_pdf.bounding_box([x, y - 25], :width => 70, :height => 25) do
    p_pdf.stroke_bounds
  end
  x += 70
end

x = 109
y = 584
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
  y = 534
end

x = 459
y = 484

p_pdf.bounding_box([x, y], :width => 70, :height => 25) do
  p_pdf.stroke_bounds
end
p_pdf.bounding_box([x, y - 25], :width => 70, :height => 25) do
  p_pdf.stroke_bounds
end

x = 45
y = 568

p_pdf.draw_text "支給", :at => [x + 19, y - 12], :size => font_size
p_pdf.draw_text "基本給", :at => [x + 85, y], :size => font_size
p_pdf.draw_text "特別手当", :at => [x + 150, y], :size => font_size
p_pdf.draw_text "交通費", :at => [x + 225, y], :size => font_size
p_pdf.draw_text "課税支給額", :at => [x + 285, y], :size => font_size
p_pdf.draw_text "非課税支給額", :at => [x + 350, y], :size => font_size
p_pdf.draw_text "総支給額", :at => [x + 430, y], :size => font_size

y = 518

p_pdf.draw_text "控除", :at => [x + 19, y - 12], :size => font_size
p_pdf.draw_text "所得税", :at => [x + 85, y], :size => font_size

y = 468

p_pdf.draw_text "差引支給額", :at => [x + 425, y], :size => font_size
