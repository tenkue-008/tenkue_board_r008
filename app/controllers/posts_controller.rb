class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
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
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
  def set_find
    @post = Post.find(params[:id])
  end
end
