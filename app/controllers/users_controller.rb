class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録が完了しました！"
      log_in @user
      redirect_to @user
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to users_path
  end

  private

      def user_params
        params.require(:user).permit(:name, :email, :password,
              :password_confirmation)
      end

        #before_action

      def logged_in_user
        unless logged_in?
          flash[:danger] = "ログインが必要です"
          redirect_to new_session_path
        end
      end

      def correct_user
        @user = User.find(params[:id])
        unless current_user?(@user)
          flash[:danger] = "権限がありません"
          redirect_to root_url
        end
      end

      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end


end
