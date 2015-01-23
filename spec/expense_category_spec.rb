require('spec_helper')

describe(ExpenseCategory) do
  describe(".all") do
    it("returns an array of all rows in our expense_category table") do
      expect(ExpenseCategory.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("Saves an entry in our ExpenseCategory table.") do
      test_1 = Expense.new({:id => @id, :name => "Barlow Tavern", :cost => 34.56, :timestamp => "2009-05-17 00:00:00", :description => "Good times"})
      test_1.save()

      test_category = Category.new({:id => @id, :name => "Entertainment"})
      test_category.save()

      test_exp_cat = ExpenseCategory.new({:expense_id => test_1.id(), :category_id => test_category.id(), :id => nil})
      test_exp_cat.save()
      expect(ExpenseCategory.all()).to(eq([test_exp_cat]))
    end
  end

end
