# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[show edit update destroy]
  include Pagy::Backend
  before_action :authenticate_user!

  def index
    add_breadcrumb 'Todo list'
    @todo_lists = TodoList.all
    @pagy, @todo_lists = pagy(TodoList.all.order(:created_at))
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    add_breadcrumb 'Todo list'
  end

  # GET /todo_lists/new
  def new
    add_breadcrumb 'New Todo list'
    @todo_list = TodoList.new
  end

  # GET /todo_lists/1/edit
  def edit
    add_breadcrumb 'Edit Todo list'
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
        add_breadcrumb 'New Todo list'
    @todo_list = TodoList.new(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html do
          redirect_to @todo_list, notice: 'Todo list was successfully created.'
        end
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new , status: :unprocessable_entity }
        format.json do
          render json: @todo_list.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
        add_breadcrumb 'Todo list'

    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html do
          redirect_to @todo_list, notice: 'Todo list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @todo_list.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html do
        redirect_to todo_lists_url,
                    notice: 'Todo list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_list_params
    params.require(:todo_list).permit(
      :title,
      :description,
      :priority,
      :completed
    )
  end
end
