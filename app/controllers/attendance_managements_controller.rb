class AttendanceManagementsController < ApplicationController
  before_action :logged_in?
  before_action :set_attendance_management, only: [:show, :edit, :update, :destroy]

  def index
    attendance_managements = AttendanceManagement.where(attendance_date: Date.today.next_month.beginning_of_month..Date.today.next_month.end_of_month).order(:attendance_date)
    # binding.pry
    @h = Hash.new { |h, k| h[k] = [] }
    attendance_managements.each do |a|
      @h[a.attendance_date].push(a.id, a.sch_attendance, a.sch_leaving)
    end
    # binding.pry
  end

  def show
  end

  def new
    @attendance_management = AttendanceManagement.new
    @attendance_management.attendance_date = params[:clicked_date]
    respond_to do |format|
      # format.html
      format.js
    end
  end

  def create
    # @attendance_managements = AttendanceManagement.all
    @attendance_management = AttendanceManagement.new(attendance_management_params)
    # binding.pry
    respond_to do |format|
      if @attendance_management.save
        format.html
        format.js
        flash.now[:success] = "シフトを登録しました。"
        redirect_to attendance_managements_path(current_user.id)
      else
        format.js
        render 'new'
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @attendance_management.update_attributes(attendance_management_params)
      flash.now[:success] = "シフトを編集しました。"
      redirect_to attendance_managements_path
    else
      flash.now[:danger] = "シフトの編集が出来ませんでした。"
      redirect_to attendance_managements_path
    end
  end

  def shift
    select_month
  end

  def approval_all
    @approval_flag_all = params[:approval_flag_all]
    # binding.pry
    if @approval_flag_all == "true"
      select_month
      @attendance_managements.update_all(approval_flag: true)
      flash[:success] = "シフトを確定しました。"
      redirect_to shift_attendance_managements_path
    else
      flash[:danger] = "シフトの確定に失敗しました。"
      redirect_to shift_attendance_managements_path
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

    def select_month
      @s_month = params[:s_month]
      @s_date = Date.today.next_month
      unless @s_month.blank?
        if @s_month == 'previous'
          @s_date = @s_date.last_month
        elsif @s_month == 'next'
          @s_date = @s_date.next_month
        end
      end
      @attendance_managements = AttendanceManagement.where(attendance_date: @s_date.beginning_of_month..@s_date.end_of_month)
    end
end
