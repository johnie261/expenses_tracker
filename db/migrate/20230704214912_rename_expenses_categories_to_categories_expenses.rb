class RenameExpensesCategoriesToCategoriesExpenses < ActiveRecord::Migration[6.0]
  def change
    rename_table :expenses_categories, :categories_expenses
  end
end
