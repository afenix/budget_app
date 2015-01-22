class Expense

attr_reader(:name, :cost, :date)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @cost = attributes[:cost]
    @date = attributes[:date]
  end

 define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      name = expense.fetch("name")
      id = expense.fetch("id").to_i()
      cost = expense.fetch("cost")
      date = expense.fetch("date")
      expenses.push(Expense.new({:id => id, :name => name, :cost => cost, :date => date}))
    end
    expenses
  end

end
