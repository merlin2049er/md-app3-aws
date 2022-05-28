# frozen_string_literal: true

class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: %i[destroy]
  include Pagy::Backend
  before_action :authenticate_user!

  # GET /watchlist
  # GET /watchlist.json
  def index
    add_breadcrumb 'Watch list'
    @watchlists =  Watchlist.where('user_id =?', current_user.id).order('created_at DESC')
    @pagy, @watchlists = pagy(@watchlists)
  end

  # GET /watchlists/new

  def new
    @watchlist = Watchlist.new

    if params and params[:user_id] and params[:product_id]

      @watchlist.user_id = params[:user_id]
      @watchlist.product_id = params[:product_id]

     if Watchlist.where(user_id: params[:user_id], product_id: params[:product_id]).exists?
       flash.now[:error] = "Already watching this..."
     else
      if @watchlist.save
        flash.now[:notice] = 'Item was added to watch list.'

      end
    end
    end
  end

  # DELETE /watchlists/1
  # DELETE /watchlists/1.json
  def destroy
    @watchlist.destroy
    respond_to do |format|
      format.html do
        redirect_to watchlists_url,
                    notice: 'Watch item was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def watchlist_params
    params.require(:watchlist).permit(
      :user_id,
      :product_id
    )
  end
end
