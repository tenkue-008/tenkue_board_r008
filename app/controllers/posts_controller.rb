class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

  def index
    @post = Post.all.order(params[:id])
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
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
       @post.destroy
       redirect_to action: :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end
end
