# frozen_string_literal: true
class InterestsController < ApplicationController

  def new
    @interests =  Interested.new

    if params and params[:user_id] and params[:product_id]

      @interests.user_id = params[:user_id]
      @interests.product_id = params[:product_id]

     if Interested.where(user_id: params[:user_id], product_id: params[:product_id]).exists?
       flash.now[:error] = "Already expressing interest in this..."
     else
      if @interests.save
        flash.now[:notice] = 'Thanks for expressing interest.'

      end
    end
    end
  end

  private

  # Only allow a list of trusted parameters through.

  def set_interests
    @interests = Interested.find(params[:id])
  end

  def interests_params
    params.require(:interests).permit(
      :user_id,
      :product_id
    )
  end

end
