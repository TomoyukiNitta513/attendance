class Admin::DetailsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  before_action :set_detail, only: [:edit, :update, :destroy]

  def index
    @details = Detail.all
  end

  def show
    @user = User.find(params[:id])
    @detail = @user.details.where(registration_date: Date.today.beginning_of_month..Date.today.end_of_month)
  end

  def new
    @detail = Detail.new
    @detail.user_id = params[:d_id]
  end

  def create
    @detail = Detail.new(detail_params)
    # binding.pry
    if @detail.save
      redirect_to admin_detail_path(@user.id), flash: {success: '登録されました。'}
    else
      flash[:danger] = '登録出来ませんでした。'
      render :new
    end
  end

  def edit
  end

  def update
    if @detail.update(detail_params)
      redirect_to admin_detail_path, flash: {success: '更新されました。'}
    else
      flash[:danger] = '更新できませんでした。'
      render :edit
    end
  end

  def destroy
  end

  private

    def detail_params
      params.permit(:user_id, :registration_date, :carfare, :income_tax)
    end

    def set_detail
      @detail = Detail.find(params[:id])
    end

end
