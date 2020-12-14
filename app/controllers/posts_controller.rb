class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  before_action :set_find, only:[:show, :edit, :update, :destroy]

  def index
    @post = Post.all.includes(:user).order(created_at: "DESC")
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @post = Post.update(post_params)
    redirect_to action: :index
  end

  def destroy
    if @post.user_id == current_user.id
       @post.destroy
       redirect_to action: :index
    end
  end

  private
  def set_find
    @post = Post.find(params[:id])
  end 
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
end
