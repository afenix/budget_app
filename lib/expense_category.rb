
class ExpenseCategory
  attr_reader(:expense_id, :category_id, :id)

  define_method(:initialize) do |attributes|
    @expense_id = attributes.fetch(:expense_id)
    @category_id = attributes.fetch(:category_id)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expense_categories (expense_id, category_id) VALUES ('#{@expense_id}', '#{@category_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do

    returned_expense_categories = DB.exec("SELECT * FROM expense_categories;")
    expense_categories = []

    returned_expense_categories.each() do |category|
      expense_id = category.fetch("expense_id").to_i()
      category_id = category.fetch("category_id").to_i()
      id = category.fetch("id").to_i()
      expense_categories.push(ExpenseCategory.new({:expense_id => expense_id, :category_id => category_id, :id => id}))
    end

    expense_categories
  end
  #
  # define_singleton_method(:categories) do |id|
  #   returned_categories = DB.exec("SELECT * FROM categories;")
  #   categories = []
  #   returned_categories.each() do |category|
  #     if category.expense_id() == id
  #       categories.push(category)
  #     end
  #   end
  #   categories
  # end


  # define_singleton_method(:ralph) do |category_id|
  #   returned_categories = DB.exec("SELECT expenses.* FROM categories JOIN expense_categories ON (categories.id = expense_categories.category_id)
  #   JOIN expenses ON (expense_categories.expense_id = expenses.id) WHERE categories.id = #{category_id};")
  #   selected_categories = []
  #   returned_categories.each() do |category|
  #     expense_id = category.fetch("id").to_i()
  #
  #     if category.expense_id() == id
  #       categories.push(category)
  #     end
  #   end
  #   categories
  # end


  define_method(:==) do |another_expense_category|
    self.expense_id().==(another_expense_category.expense_id()).&(self.category_id().==(another_expense_category.category_id())).&(self.id().==(another_expense_category.id()))
  end

  # define_method(:add_category) do
  #   added_categories = []
  #   train = DB.exec("SELECT * FROM trains WHERE expense_id = #{@expense_id}")
  #   station = DB.exec("SELECT * FROM stations WHERE category_id = #{@category_id}")
  # end

end
