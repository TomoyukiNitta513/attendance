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
x = 45
y = 700
# @attendance_management.each do |a|
#   pdf.draw_text a.user.name, :at => [x,y]
#   pdf.draw_text a.attendance_date.strftime("%Y年%m月%d日"), :at => [x + 100,y]
#   pdf.draw_text a.res_attendance.strftime('%H:%M'), :at => [x + 200,y]
#   pdf.draw_text a.res_break_in.strftime('%H:%M'), :at => [x + 250,y]
#   pdf.draw_text a.res_break_out.strftime('%H:%M'), :at => [x + 300,y]
#   pdf.draw_text a.res_leaving.strftime('%H:%M'), :at => [x + 350,y]
#   working = (a.res_leaving - a.res_attendance - (a.res_break_out - a.res_break_in)) / 60 / 60
#   pdf.draw_text working, :at => [x + 400,y]
#   pdf.draw_text a.user.payment, :at => [x + 450,y]
#   pdf.draw_text a.user.payment.to_i * working.to_i, :at => [x + 550,y]
#   y -= 20
# end
pdf.draw_text @attendance_management.first.attendance_date.strftime("%Y年%m月分"), :at => [x, y]
pdf.draw_text @user.section, :at => [x, y - 50]
pdf.draw_text @user.employee_code, :at => [x + 70, y - 50]
pdf.draw_text @user.payment, :at => [x + 140, y - 50]
pdf.draw_text @user.name, :at => [x + 210, y - 50]
y = 600
pdf.draw_text @attendance_management.count, :at => [x + 70, y]
pdf.draw_text @total_time, :at => [x + 140, y]
y = 550
pdf.draw_text @total_pay, :at => [x + 70, y]
pdf.draw_text @carfare, :at => [x + 210, y]
pdf.draw_text @total_pay, :at => [x + 280, y]
pdf.draw_text @carfare, :at => [x + 350, y]
pdf.draw_text @total_pay + @carfare, :at => [x + 420, y]
y = 500
pdf.draw_text @tax.round(-1), :at => [x + 70, y]
y = 450
total_pay = 0
total_pay = @total_pay + @carfare - @tax.round(-1)
pdf.draw_text total_pay, :at => [x + 420, y]
