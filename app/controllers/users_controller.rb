class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}



  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "できません"
      redirect_to("/login")
    end
  end


  def index
    @users = User.all.order(created_at: :desc)
  end


  def show
    @user = User.find_by(id: params[:id])
  end


  def new
    @user = User.new
  end



  def login_guest
    @user = User.find_by(
      email: "guest_user@example.com",
      password_digest: "$2a$12$0WLm3TI1BuR3ywbetTqdNOpH.oLCn.QgOgtfXI2r0U8wP0xv3FbhC"
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ゲストユーザーとしてログインしました"
      redirect_to("/posts/index")
    end
  end


  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "ユーザー登録完了"
        redirect_to("/users/#{@user.id}")
      else
        flash[:notice] = "ユーザー登録失敗"
        render("users/new")
      end
  end


  def login_form
    @user = User.new
  end


  def login
    @user = User.find_or_initialize_by(email: user_params[:email])

      if @user.persisted? && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "ログイン成功"
        redirect_to("/posts/index")
      else
        render("users/login_form")
      end
  end


  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end


  def edit
      @user = User.find_by(id: params[:id])
  end


  def update
    @user = User.find_by(id: params[:id])
      if @user.update(user_params)
        flash[:notice] = "ユーザー情報を変更しました"
        redirect_to("/users/#{@user.id}")
      else
        render("/users/edit")
      end
  end


  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/users/index")
    flash[:notice] = "削除しました"
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :image)
    end

end
