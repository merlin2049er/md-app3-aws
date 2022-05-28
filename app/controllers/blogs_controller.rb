class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
  include Pagy::Backend
  # GET /blogs or /blogs.json
  def index
    add_breadcrumb 'Blogs'
    @blogs = Blog.all
    @pagy, @blogs = pagy(Blog.all.order(:created_at))
  end

  # GET /blogs/1 or /blogs/1.json
  def show
      add_breadcrumb 'Blogs'
  end

  # GET /blogs/new
  def new
      add_breadcrumb 'New Blog'
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
      add_breadcrumb 'Edit Blog'
  end

  # POST /blogs or /blogs.json
  def create
      add_breadcrumb 'New Blog'
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
      add_breadcrumb 'Blogs'

    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :description, :content)
    end
end
