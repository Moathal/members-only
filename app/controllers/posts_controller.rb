class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post is added successfully"
        format.html{ redirect_to posts_path }
    else
      flash[:alert] = @user.errors.full_messsage
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to new_post_path }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post is updated successfully"
      redirect_to post_path(@post)
    else
      respond_to do | format |
        format.turbo_stream
        format.html { resirect_to edit_post_path(@post) }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
