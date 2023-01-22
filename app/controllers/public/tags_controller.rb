class Public::TagsController < ApplicationController
  before_action :authenticate_customer!


  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to new_tag_path
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
