# frozen_string_literal: true

class CategoriesController < ApplicationController
  include Pagy::Backend

  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories
  # GET /categories.json
  def index
    add_breadcrumb 'categories'
    @categories = Category.all
    @pagy, @categories = pagy(Category.order(:name))
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    # begin
    add_breadcrumb 'categories', :categories_path
    add_breadcrumb @category.name

    require 'time'

    todaydate = Time.new # set 'todaydate' equal to the current date/time.

    todaydate = "#{todaydate.year}-#{todaydate.month}-#{todaydate.day}"

    @title = @category.name
    #puts @category.products.inspect

    @pagy, @products =
      pagy(
        @category.products.where(
          'draft = ? and active = ? and funded = ? and startdate <= ? and enddate >= ? ',
          false,
          true,
          false,
          todaydate,
          todaydate
        )
      )

  end

  # GET /categories/new
  def new
        add_breadcrumb 'New Category'
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
        add_breadcrumb 'Edit Category'
  end

  # POST /categories
  # POST /categories.json
  def create
        add_breadcrumb 'New category'
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html do
          redirect_to @category, notice: 'Category was successfully created.'
        end
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
        add_breadcrumb 'Edit category'

    respond_to do |format|
      if @category.update(category_params)
        format.html do
          redirect_to @category, notice: 'Category was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @category.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html do
        redirect_to categories_url,
                    notice: 'Category was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :picurl)
  end
end
