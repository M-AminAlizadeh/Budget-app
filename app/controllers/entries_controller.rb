class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
    @entry = Entry.new
  end

  def index
    @category = Category.find(params[:category_id])
    @entries = @category.entries.order(created_at: :desc)
  end

  def create
    @entry = Entry.new(entry_params)
    @category = Category.find(params[:category_id])

    if @entry.save
      redirect_to category_entries_path(@category), notice: 'Entry created successfully.'
    else
      puts "Entry Errors: #{entry.errors.full_messages}"
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :amount, category_ids: [])
  end
end
