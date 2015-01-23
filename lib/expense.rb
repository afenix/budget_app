class Expense

attr_reader(:id, :name, :cost, :timestamp, :description)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @cost = attributes[:cost]
    @timestamp = attributes[:timestamp]
    @id = attributes[:id]
    @description = attributes[:description]
  end

 define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      name = expense.fetch("name")
      id = expense.fetch("id").to_i()
      cost = expense.fetch("cost")
      timestamp = expense.fetch("timestamp")
      description = expense.fetch("description")
      expenses.push(Expense.new({:id => id, :name => name, :cost => cost, :timestamp => timestamp, :description => description}))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (name, cost, timestamp, description) VALUES ('#{@name}', #{@cost}, '#{@timestamp}', '#{@description}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:add_category) do |category|
    puts(@id)
    result = DB.exec("INSERT INTO expense_categories (expense_id, category_id) VALUES (#{@id}, #{category.id()});")
    #@id = result.first().fetch("id").to_i()
  end

  define_method(:list_categories) do
    returned_categories = DB.exec("
    SELECT categories.* FROM
    expenses JOIN expense_categories ON (expenses.id = expense_categories.expense_id)
    JOIN categories ON (expense_categories.category_id = categories.id)
    WHERE expenses.id = #{self.id()};")

    binding.pry
    categories = []
    returned_categories.each() do |category|
      categories = categories.push(category.fetch("name"))
    end
    categories
   end



  define_method(:==) do |other_name|
    self.name().==(other_name.name()) && self.id().==(other_name.id())
  end

end
