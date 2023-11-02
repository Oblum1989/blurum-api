class CreditsController < ApplicationController
  before_action :authorize_request
  before_action :set_credit, only: %i[ show update destroy ]

  # GET /credits
  # GET /credits.json
  def index
    @credits = @current_user.credits
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(credit_params)
    @credit.user = User.find_by(username: params[:user_username])
    if @credit.save
      render :show, status: :created, location: @credit
    else
      render json: @credit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    if @credit.update(credit_params)
      render :show, status: :ok, location: @credit
    else
      render json: @credit.errors, status: :unprocessable_entity
    end
  end
  # DELETE /credits/1

  # DELETE /credits/1.json
  def destroy
    @credit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = @current_user.credits.find(params[:id])
    end

    def credit_params
      params.require(:credit).permit(:name, :debt, :fee)
    end
end
