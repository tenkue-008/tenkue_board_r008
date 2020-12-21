class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :set_find, only:[:edit, :show, :destroy, :update]

  def index
    @post = Post.includes(:user).order(created_at: :DESC)
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
    if @post.user_id != current_user.id
      redirect_to action: :index
    end    
  end

  def update
    if @post.update(post_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    if @post.destroy!
      redirect_to action: :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
  def set_find
    @post = Post.find(params[:id])
  end
end
