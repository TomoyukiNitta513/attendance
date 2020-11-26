class Admin::AttendanceManagementsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  before_action :set_attendance_management, only: [:destroy]

  # 実績一覧
  def index
    @s_month = params[:s_month]
    @s_date = Date.today
    @name = params[:name]
    unless @s_month.blank?
      if @s_month == 'previous'
        @s_date = @s_date.last_month
      elsif @s_month == 'next'
        @s_date = @s_date.next_month
      end
    end
    unless @name.blank?
      @user = User.where(name: @name).first
      @attendance_managements = AttendanceManagement.where(attendance_date: @s_date.beginning_of_month..@s_date.end_of_month).where(user_id: @user.id)
    else
      @attendance_managements = AttendanceManagement.where(attendance_date: @s_date.beginning_of_month..@s_date.end_of_month)
    end
  end

  # 給与明細
  def show
    @user = User.find(params[:id])
    @attendance_management = @user.attendance_managements.where(attendance_date: Date.today.beginning_of_month..Date.today.end_of_month)
    @total_time = 0
    @total_pay = 0
    @attendance_management.each do |a|
      working = (a.res_leaving - a.res_attendance - (a.res_break_out - a.res_break_in)) / 60 / 60
      @total_time = @total_time.to_i + working.to_i
      @total_pay = @total_pay.to_i + a.user.payment.to_i * working.to_i
    end
    respond_to do |format|
      format.html
      format.pdf { prawnto :prawn => {
        :page_layout => :landscape, # 縦:portrait、 横:landscape
        :page_size => 'A4',
        :left_margin => 20,
        :right_margin => 20,
        :top_margin => 20,
        :bottom_margin => 20
        } ,
      :inline => true
      }
    end
  end

  # シフト編集
  def shift
    @s_date = Date.today.next_month
    @name = params[:name]
    unless @name.blank?
      @user = User.where(name: @name).first
      @attendance_managements = AttendanceManagement.where(attendance_date: @s_date.beginning_of_month..@s_date.end_of_month).where(user_id: @user.id)
    else
      @attendance_managements = AttendanceManagement.where(attendance_date: @s_date.beginning_of_month..@s_date.end_of_month)
    end
  end

  # シフト確定
  def approve
    @approval_flag_all = params[:approval_flag_all]
    @date = Date.today.next_month
    if @approval_flag_all == "true"
      @attendance_managements = AttendanceManagement.where(attendance_date: @date.beginning_of_month..@date.end_of_month)
      @attendance_managements.update_all(approval_flag: true)
      flash[:success] = "シフトを確定しました。"
      redirect_to shift_admin_attendance_managements_path
    else
      flash[:danger] = "シフトの確定に失敗しました。"
      redirect_to shift_admin_attendance_managements_path
    end
  end

  def destroy
    @attendance_management.destroy
    flash.now[:success] = "シフトを削除しました。"
    redirect_to attendance_managements_path
  end

  private

    def set_attendance_management
      @attendance_management = AttendanceManagement.find(params[:id])
    end

    def attendance_management_params
      params.require( :attendance_management ).permit(
        :sch_attendance, :sch_leaving, :res_attendance, :res_break_in,
        :res_break_out, :res_leaving, :user_id, :attendance_date)
    end

end
