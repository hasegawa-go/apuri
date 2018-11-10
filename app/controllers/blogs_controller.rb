class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blogs = Blog.new
  end

  def create
    Blog.create(text: blog_params[:text],user_id: current_user.id)
    redirect_to controller: :blogs, action: :index

  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
      blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.update(text: params[:text])
      end
  end

  private
  def blog_params
      params.require(:blog).permit(:text)
  end

end
