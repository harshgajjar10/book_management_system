class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully added.'
    else
      redirect_to new_category_path, errors: @category.errors.full_messages
    end
  end

  private

  def category_params
    params.require(:category).permit(:id, :name)
  end
end