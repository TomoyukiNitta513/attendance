class DepartmentsController < ApplicationController
  before_action :logged_in?
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to @department, notice: '部門を登録しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      redirect_to @department, notice: '部門を編集しました'
    else
      render :edit
    end
  end

  def destroy
  end

  private

    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name, :sakujo)
    end
end
