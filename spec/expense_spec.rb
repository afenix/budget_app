require('spec_helper')

describe(Expense) do
  describe(".all") do
    it("returns an array of all Expenses") do
      expect(Expense.all()).to(eq([]))
    end
  end

end
