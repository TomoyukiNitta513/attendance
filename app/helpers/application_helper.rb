require 'date'

module ApplicationHelper

  def make_calender(year, month)
    first_date = Date.new(year, month,1) #指定した月の1日をDateオブジェクトとして保存
    last_date = Date.new(year, month,-1) #指定した月の最終日をDateオブジェクトとして保存

    calender_size = last_date.day + first_date.wday - last_date.wday + 6 #テーブルのカラム数を保存

    calender = "" #この変数にtableの中身を追加していく
    calender << '<caption>' + first_date.strftime('%Y年%m月') + '</caption>' + "\n"
    calender << "\t" + '<tr><th>日</th><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th>土</th></tr>' + "\n"

    #n週目まである月はn回<tr>タグを出力
    (calender_size / 7).times do |n|
      calender << "\t" + '<tr>'
      #<td>タグを7回出力
      7.times do |i|
        cal_count = n*7 + i #cal_countは直後に出力する<td>タグが全カラムのうち何番目かを保存(0から開始)
        calender << '<td>'
        calender << (cal_count - first_date.wday + 1).to_s if first_date.wday <= cal_count && last_date.day > cal_count - first_date.wday
        calender << '</td>'
      end
      calender << '</tr>'
    end

    return calender
  end

end
