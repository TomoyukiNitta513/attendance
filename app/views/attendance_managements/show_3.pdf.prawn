pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
render :partial => 'show_3.pdf.prawn', :locals => { :p_pdf => pdf }
pdf.line_width = 0.1
width = 70
height = 13
font_size = 9
gyou_kankaku = 17
gyou_half = 7
y_tyousei = 11
y_tyousei_2 = 10
x = 0 #横
y = 520 #縦

pdf.fill_color "000000"

pdf.draw_text @shift_date.to_date.strftime("%Y年%m月%d日のシフト"), :at => [x, y]

x = 1
y = 475

@attendance_managements.each do |a|
  pdf.fill_color "000000"
  pdf.text_box a.user.name, :at => [x,y], :size => 9, :width => 70, :align => :center
  y += 2
  pdf.fill_color "c0c0c0"
  at = a.sch_attendance.hour
  lv = a.sch_leaving.hour - at
  x = 70 + 30 * at
  pdf.fill_rectangle [x, y], 30 * lv, 15
  x = 1
  y -= 22
end
