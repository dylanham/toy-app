class MicroPostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update]
  def index
    @micro_posts = MicroPost.all
  end

  def show
  end

  def new
    @micro_post = MicroPost.new
  end

  def create
    @micro_post = MicroPost.new(micro_post_params)
    if @micro_post.save
      flash[:notice] = "Post succsessfully created"
      redirect_to @micro_post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @micro_post.update(micro_post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to @micro_post
    else
      render :edit
    end
  end

  def destroy
    micropost = MicroPost.find(params([:id])
    micropost.destroy
    flash[:notice] = "Post sucessfully deleted"
    redirect_to micro_posts_path
  end

  private

  def micro_post_params
    params.require(:micro_post).permit(:content, :user_id)
  end

  def set_micro_post
    @micro_post = MicroPost.find(params[:id])
  end
  
end
