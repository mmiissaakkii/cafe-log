class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to new_admin_tag_path
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
