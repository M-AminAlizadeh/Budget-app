class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @categories = Category.all
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

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, category_ids: [])
  end
end
