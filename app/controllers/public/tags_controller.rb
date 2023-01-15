class Public::TagsController < ApplicationController

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to customer_path
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
