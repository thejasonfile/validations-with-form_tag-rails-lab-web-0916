class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post = Post.create(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end

  end

  def update
    @post_test = Post.new(post_params)

    if @post_test.valid?
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      @post_test.id = params[:id]
      @post = @post_test
      render :edit
    end
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
