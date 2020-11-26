p_pdf.font "#{Rails.root}/vendor/font_ttf/ipaexg.ttf"
#=======================================
#　明細表の背景ページ(background)
#=======================================
p_pdf.line_width = 0.2
font_size = 11
gyou_kankaku = 17
gyou_half = 7
x = 0
y = 540
p_pdf.fill_color "0033ff"
p_pdf.draw_text "勤怠実績一覧", :at => [x + 200, y + 5], :size => 14
y = 520
p_pdf.fill_color "000000"
p_pdf.draw_text "名前", :at => [x, y], :size => font_size
p_pdf.draw_text "出勤日", :at => [x + 100, y], :size => font_size
p_pdf.draw_text "出勤時間", :at => [x + 200, y], :size => font_size
p_pdf.draw_text "休憩入", :at => [x + 250, y], :size => font_size
p_pdf.draw_text "休憩戻", :at => [x + 300, y], :size => font_size
p_pdf.draw_text "退勤時間", :at => [x + 350, y], :size => font_size
p_pdf.draw_text "労働時間", :at => [x + 400, y], :size => font_size
p_pdf.draw_text "時給", :at => [x + 450, y], :size => font_size
p_pdf.draw_text "支給額", :at => [x + 550, y], :size => font_size
