# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, { only: %i[edit update destroy] }

  def index
    @post = Post.find_by(id: params[:id])
    @posts = Post.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
    if @current_user.nil?
      flash[:notice] = 'ログインして下さい'
      redirect_to('/login')
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id

    if @post.save
      redirect_to('/posts/index')
      flash[:notice] = '投稿しました'
    else
      render('/posts/new')
      flash[:notice] = '投稿失敗'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.user_id = @current_user.id

    if @post.update(post_params)
      redirect_to('/posts/index')
      flash[:notice] = '投稿の編集をしました'
    else
      redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/posts/index')
    flash[:notice] = '削除しました'
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = 'ユーザーが一致しません'
      redirect_to('/posts/index')
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  end
end
