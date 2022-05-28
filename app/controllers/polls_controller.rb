class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]
  #before_action :voted_params
  #before_action :poll_count_params
  before_action :check_if_voted

  include Pagy::Backend
  before_action :authenticate_user!

  # GET /polls or /polls.json
  def index
      add_breadcrumb 'Polls list'
    @polls = Poll.all
    @pagy, @polls = pagy(Poll.all.order(:created_at))
  end

  # GET /polls/1 or /polls/1.json
  def show
    add_breadcrumb 'Poll'

    @polloption_total = Voted.where(poll_id: @poll.id).count
    #binding.pry

  end

  # GT /polls/new@poll.poll_options
  def new
      add_breadcrumb 'New Poll'
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
    add_breadcrumb 'Edit Poll'
  end

  # POST /polls or /polls.json
  def create
    add_breadcrumb 'New Poll'
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: "Poll was successfully created." }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update
      add_breadcrumb 'Edit Poll'
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: "Poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1 or /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: "Poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def vote

    @vote = Voted.new(voted_params)

    respond_to do |format|
      if @vote.save
        add_breadcrumb 'Thanks'
        format.html { render 'thank_you' }
        format.json { render :show, status: :created, location: @poll }
      else
        add_breadcrumb 'Error'
        format.html { render 'error' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

   def check_if_voted
     @current_user ||= User.find_by(id: session[:user_id])
     @voted = Voted.find_by(user_id: @current_user , poll_id: @poll ? @poll.id :  '')

    # binding.pry

    end

    # Only allow a list of trusted parameters through.
    def poll_params
      params.require(:poll).permit(:name, :description, :enabled, poll_options_attributes: [:poll, :description, :enabled, :poll_url_enabled, :poll_url, :id,:_destroy ])
    end

   def voted_params
     params.require(:poll).permit(:poll_id, :user_id, :polloption_id)
   end


end
