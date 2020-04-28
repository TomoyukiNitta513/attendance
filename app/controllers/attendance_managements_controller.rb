class AttendanceManagementsController < ApplicationController
  before_action :logged_in?

  def index
    @attendance_managements = AttendanceManagement.all
  end

  def show
    @attendance_management = AttendanceManagement.find(params[:id])
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
    @attendance_management = AttendanceManagement.new(attendance_management_params)
    # binding.pry
    respond_to do |format|
      if @attendance_management.save
        format.html
        format.js
        flash[:success] = "シフトを登録しました。"
        redirect_to @attendance_management
      else
        format.js
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    if @attendance_management.update_attributes(attendance_management_params)
      flash[:success] = "勤怠を登録しました。"
    else
      redirect_to @attendance_management
    end
  end

  private
    def attendance_management_params
      params.require( :attendance_management ).permit(
        :sch_attendance, :sch_leaving, :res_attendance, :res_break_in,
        :res_break_out, :res_leaving, :user_id, :delete_flag, :attendance_date )
    end
end
