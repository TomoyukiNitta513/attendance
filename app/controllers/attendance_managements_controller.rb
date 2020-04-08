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
  end

  def create
    @attendance_management = AttendanceManagement.new(attendance_management_params)
    binding.pry
    if @attendance_management.save
      flash[:success] = "シフトを登録しました。"
      redirect_to @attendance_management
    else
      render 'new'
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
