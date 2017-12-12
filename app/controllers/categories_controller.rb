class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      flash[:failure] = "#{@category.title} already exists, try again."
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    # @category.update(category_params)
    # if @company.save
    #   flash[:success] = "#{@category.title} updated!"


  end



  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
