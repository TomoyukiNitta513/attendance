class Admin::DetailsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  def index
    @details = Detail.all
  end

  def show
  end

  def new
    @detail = Detail.new
    @detail.user_id = params[:did]
  end

  def create
    @detail = Detail.new(detail_params)
    binding.pry
    if @detail.save
      redirect_to @detail, notice: '登録されました。'
    else
      render :new, alert: '登録出来ませんでした。'
    end
  end

  def edit
  end

  def update
    if @detail.update(detail_params)
      redirect_to @detail, notice: '更新されました。'
    else
      render :edit, alert: '更新できませんでした。'
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
