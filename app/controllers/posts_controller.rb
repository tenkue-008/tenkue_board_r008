class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
