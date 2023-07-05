class ExpensesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(created_at: :desc)
    @total_amount = @category.expenses.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build(expense_params)
    @expense.category_id = @category.id
    @expense.author = current_user

    if @expense.save
      redirect_to category_expenses_path(@category), notice: "Expense added successfully"
    
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
  end

end