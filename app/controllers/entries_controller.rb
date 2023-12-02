class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
    @entry = Entry.new
  end

  def index
    @entries = Entry.all
    @category = Category.find(params[:category_id])
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
    params.require(:entry).permit(:name, :amount)
  end
end
