require('spec_helper')

describe(Expense) do
  describe(".all") do
    it("returns an array of all Expenses") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the name of the expense") do
      name = Expense.new({:id => nil, :name => "Barlow Tavern", :cost => 34.56, :timestamp => "2009-05-17 00:00:00", :description => "Good times"})
      expect(name.name()).to(eq("Barlow Tavern"))
    end
  end

  describe("#save") do
    it("saves a particular expense to table 'expenses'") do
      test_expense = Expense.new({:id => 1, :name => "Barlow Tavern", :cost => 34.56, :timestamp => "2009-05-17 00:00:00", :description => "Good times"})
      test_expense.save()
      expect(Expense.all).to(eq([test_expense]))
    end
  end

  describe("#==") do
    it("treats two expenses with the same id and name as equal to each other") do
      test_1 = Expense.new({:id => @id, :name => "Barlow Tavern", :cost => 34.56, :timestamp => "2009-05-17 00:00:00", :description => "Good times"})
      test_2 = Expense.new({:id => @id, :name => "Barlow Tavern", :cost => 34.56, :timestamp => "2009-05-17 00:00:00", :description => "Good times"})
      expect(test_1).to(eq(test_2))
    end
  end

end
