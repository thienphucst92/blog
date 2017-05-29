class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:tag])
    @posts = @tag.posts
  end

  def search
    if params[:search].blank?
      @posts = Post.all.order("created_at DESC")
    else
      @posts = Tag.search(params[:search])
    end
  end
end
