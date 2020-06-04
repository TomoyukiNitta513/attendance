class AttendanceManagementsController < ApplicationController
  before_action :logged_in?
  before_action :set_attendance_management, only: [:edit, :update, :destroy]

  def index
    @attendance_managements = AttendanceManagement.where(attendance_date: Date.today.next_month.beginning_of_month..Date.today.next_month.end_of_month)
  end

  def show
    @attendance_management = AttendanceManagement.where(id: params[:user_id])
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
    @attendance_managements = AttendanceManagement.where(attendance_date: Date.today.next_month.beginning_of_month..Date.today.next_month.end_of_month)
  end

  def approval_all
    @attendance_managements = AttendanceManagement.where(attendance_date: Date.today.next_month.beginning_of_month..Date.today.next_month.end_of_month)
    @attendance_managements.update_all(approval_flag: true)
    redirect_to shift_attendance_managements_path
  end

  def destroy
    @attendance_management.destroy
    flash.now[:danger] = "シフトを削除しました。"
    redirect_to attendance_managements_path
  end

  private

    def set_attendance_management
      @attendance_management = AttendanceManagement.find(params[:id])
    end

    def attendance_management_params
      params.require( :attendance_management ).permit(
        :sch_attendance, :sch_leaving, :res_attendance, :res_break_in,
        :res_break_out, :res_leaving, :user_id, :delete_flag, :attendance_date,
        :approval_flag)
    end
end
