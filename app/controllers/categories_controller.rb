class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all.order(created_at: :asc)
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.transactions
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to authenticated_root_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon_url)
  end
end
