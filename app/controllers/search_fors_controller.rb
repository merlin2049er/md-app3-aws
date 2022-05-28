class SearchForsController < ApplicationController
  before_action :set_search_for, only: %i[ show destroy ]
  include Pagy::Backend

  # GET /search_fors or /search_fors.json
  def index
      add_breadcrumb 'Search'
    @search_fors = SearchFor.all
      @pagy, @search_fors = pagy(SearchFor.all.order("created_at DESC"))
  end

  def show
    add_breadcrumb 'Search'
  end

  # GET /search_fors/new
  def new
    add_breadcrumb 'New Search Keyword'
      @search_for = SearchFor.new
  end

  # POST /search_fors or /search_fors.json
  def create

    @search_for = SearchFor.new(search_for_params)
    respond_to do |format|
      if @search_for.save
        format.html { redirect_to @search_for, notice: "Search for was successfully created." }
        format.json { render :show, status: :created, location: @search_for }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_for.errors, status: :unprocessable_entity }
      end
    end

  end



  # DELETE /search_fors/1 or /search_fors/1.json
  def destroy

    @search_for.destroy
    respond_to do |format|
      format.html { redirect_to search_fors_url, notice: "Search for was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def set_search_for
      @search_for = SearchFor.find(params[:id])
     end

    # Only allow a list of trusted parameters through.
    def search_for_params
      params.require(:search_for).permit(:searchterm)
    end
end
