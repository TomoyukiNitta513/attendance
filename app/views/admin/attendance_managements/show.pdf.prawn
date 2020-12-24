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
x = 45 #横
y = 700 #縦

pdf.fill_color "000000"
pdf.draw_text @attendance_management.first.attendance_date.strftime("%Y年%m月分"), :at => [x, y]

y = 652
pdf.text_box "#{number_with_delimiter(@user.section)}", :size => 12, :at => [x - 5, y], :width => 70, :align => :center
pdf.text_box "#{number_with_delimiter(@user.employee_code)}", :size => 12, :at => [x + 60, y], :width => 70, :align => :right
pdf.text_box "#{number_with_delimiter(@user.payment)}", :size => 12, :at => [x + 130, y], :width => 70, :align => :right
pdf.text_box "#{number_with_delimiter(@user.name)}", :size => 12, :at => [x + 205, y], :width => 70, :align => :center

y = 601

pdf.text_box "#{number_with_delimiter(@attendance_management.count)}", :size => 12, :at => [x + 60, y], :width => 70, :align => :right
pdf.text_box "#{number_with_delimiter(@total_time)}", :size => 12, :at => [x + 130, y], :width => 70, :align => :right

y = 546

pdf.text_box "#{number_with_delimiter(@total_pay)}", :size => 12, :at => [x + 60, y + 5], :width => 70, :align => :right
pdf.text_box "#{number_with_delimiter(@carfare)}", :size => 12, :at => [x + 200, y + 5], :width => 70, :align => :right
pdf.text_box "#{number_with_delimiter(@total_pay)}", :size => 12, :at => [x + 270, y + 5], :width => 70, :align => :right
pdf.text_box "#{number_with_delimiter(@carfare)}", :size => 12, :at => [x + 340, y + 5], :width => 70, :align => :right
total_pay_wo_tax = @total_pay + @carfare
pdf.text_box "#{number_with_delimiter(total_pay_wo_tax)}", :size => 12, :at => [x + 410, y + 5], :width => 70, :align => :right

y = 501

pdf.text_box "#{number_with_delimiter(@tax.round(-1))}", :size => 12, :at => [x + 60, y], :width => 70, :align => :right

y = 452

total_pay = 0
total_pay = @total_pay + @carfare - @tax.round(-1)
pdf.text_box "#{number_with_delimiter(total_pay)}", :size => 12, :at => [x + 410, y], :width => 70, :align => :right
