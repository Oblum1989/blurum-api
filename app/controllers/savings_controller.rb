class SavingsController < ApplicationController
  before_action :authorize_request
  before_action :set_saving, only: %i[ show update destroy ]

  # GET /savings
  # GET /savings.json
  def index
    @savings = @current_user.savings
  end

  # GET /savings/1
  # GET /savings/1.json
  def show
  end

  # POST /savings
  # POST /savings.json
  def create
    @saving = Saving.new(saving_params)
    @saving.user = User.find_by(username: params[:user_username])

    if @saving.save
      render :show, status: :created, location: @saving
    else
      render json: @saving.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /savings/1
  # PATCH/PUT /savings/1.json
  def update
    if @saving.update(saving_params)
      render :show, status: :ok, location: @saving
    else
      render json: @saving.errors, status: :unprocessable_entity
    end
  end

  # DELETE /savings/1
  # DELETE /savings/1.json
  def destroy
    @saving.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving
      @saving = @current_user.savings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saving_params
      params.require(:saving).permit(:name, :total)
    end
end
