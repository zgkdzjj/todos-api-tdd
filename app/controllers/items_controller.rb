class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_todo_item, only: [:show, :update, :destroy]


  # GET /items
  def index
    json_response(@todo.items)
  end

  # POST /items
  def create
    @todo.items.create!(item_params)
    json_response(@todo, :created)
  end

  # GET /items/:id
  def show
    json_response(@item)
  end

  # PUT /items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private
  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_item
    @item = @todo.items.find_by!(id: params[:id]) if @todo
  end
end
