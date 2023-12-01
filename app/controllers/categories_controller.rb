class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to authenticated_root_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show_transactions
    @category = Category.find(params[:id])
    @transactions = @category.transactions
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon_url)
  end
end
