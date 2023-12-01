class TransactionsController < ApplicationController
  before_action :set_category, only: [:new, :create]

  def new
    @transaction = Transaction.new
    @categories = Category.all
  end

  def index
    @transactions = Transaction.all
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to authenticated_root_path, notice: 'Transaction was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  def transactions
    @category = Category.find(params[:id])
    @transactions = @category.transactions
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, category_ids: [])
  end
end
