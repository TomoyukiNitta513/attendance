pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
render :partial => 'show.pdf.prawn', :locals => { :p_pdf => pdf }
pdf.line_width = 0.1
width = 70
height = 13
font_size = 9
gyou_kankaku = 17
gyou_half = 7
y_tyousei = 11
y_tyousei_2 = 10
x = 0
y = 500
@attendance_management.each do |a|
  pdf.draw_text a.user.name, :at => [x,y]
  pdf.draw_text a.attendance_date.strftime("%Y年%m月%d日"), :at => [x + 100,y]
  pdf.draw_text a.res_attendance.strftime('%H:%M'), :at => [x + 200,y]
  pdf.draw_text a.res_break_in.strftime('%H:%M'), :at => [x + 250,y]
  pdf.draw_text a.res_break_out.strftime('%H:%M'), :at => [x + 300,y]
  pdf.draw_text a.res_leaving.strftime('%H:%M'), :at => [x + 350,y]
  working = (a.res_leaving - a.res_attendance - (a.res_break_out - a.res_break_in)) / 60 / 60
  pdf.draw_text working, :at => [x + 400,y]
  pdf.draw_text a.user.payment, :at => [x + 450,y]
  pdf.draw_text a.user.payment.to_i * working.to_i, :at => [x + 550,y]
  y -= 20
end
