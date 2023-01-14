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

  def index
    @reviews = Review.all
    if params[:tag_ids]
      @tweets = []
      params[:tag_ids].each do |key, value|
        @tweets += Tag.find_by(name: key).reviews if value == "1"
      end
      @reviews.uniq!
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end


end
