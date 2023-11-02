class CreditCardsController < ApplicationController
  before_action :authorize_request
  before_action :set_credit_card, only: %i[ show update destroy ]

  # GET /credit_cards
  # GET /credit_cards.json
  def index
    @credit_cards = @current_user.credit_cards
  end

  # GET /credit_cards/1
  # GET /credit_cards/1.json
  def show
  end

  # POST /credit_cards
  # POST /credit_cards.json
  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.user = User.find_by(username: params[:user_username])

    if @credit_card.save
      render :show, status: :created, location: @credit_card
    else
      render json: @credit_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /credit_cards/1
  # PATCH/PUT /credit_cards/1.json
  def update
    if @credit_card.update(credit_card_params)
      render :show, status: :ok, location: @credit_card
    else
      render json: @credit_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /credit_cards/1
  # DELETE /credit_cards/1.json
  def destroy
    @credit_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card
      @credit_card = @current_user.credit_cards.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credit_card_params
      params.require(:credit_card).permit(:name, :debt, :fee, :space, :payment)
    end
end
