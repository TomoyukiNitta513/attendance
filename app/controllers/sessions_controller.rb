class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message = "アカウントは有効化されませんでした"
        message += "eメールの有効化リンクを確認してください"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレスもしくはパスワード、またはその組み合わせが正しくありません'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash.now[:danger] = 'ログアウトしました'
    redirect_to root_url
  end
end
