class Admin::CategoriesController < ApplicationController
  before_action :find_category, only: [:destroy, :edit, :update]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def destroy
    @category = Category.find_by id: params[:id]
    if @category.present?
      @category.destroy
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      flash[:danger] = t ".danger"
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = t ".success"
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  private

  def find_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit :name
  end
end
