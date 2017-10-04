# frozen_string_literal: true

class ListsController < OpenReadController
  before_action :set_list, only: %i[show update destroy]

  # GET /lists
  def index
    # @lists = List.all
      @lists = current_user.lists
    render json: @lists
  end

  # GET /lists/1
  def show
    list = current_user.list.find(params[:id])
    render json: @list
  end

  # POST /lists
  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
  #  binding.pry
  #  @list = current_user.list.find(params[:id])
    if @list.update(list_params)
      #render json: @list
      head :no_content
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = current_user.lists.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:list).permit(:user_id, :name_list, :content, :date)
  end
end
