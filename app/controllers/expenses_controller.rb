class ExpensesController < ApplicationController
  before_action :authorize_request
  before_action :set_expense, only: %i[ show update destroy ]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = @current_user.expenses
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user = User.find_by(username: params[:user_username])

    if @expense.save
      create_transaction(params[:movement_id])
      render :show, status: :created, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    if @expense.update(expense_params)
      render :show, status: :ok, location: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = @current_user.expenses.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Expense not found' }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :category, :total)
    end

    def create_transaction(movement_id)
      movement = @expense.user.send(@expense.category.pluralize).find(movement_id)
      movement.create_transaction(@expense.total, @expense.name)
    end
end
