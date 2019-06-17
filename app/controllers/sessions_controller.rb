class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      flash[:success] = "ログインしました"
      redirect_to user
    else
      flash.now[:danger] = "メールアドレスかパスワードが正しくありません"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
