require('spec_helper')

describe(Category) do
  describe(".all") do
    it("returns an array of all Categories") do
      expect(Category.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the name of the category") do
      name = Category.new({:id => nil, :name => "Entertainment"})
      expect(name.name()).to(eq("Entertainment"))
    end
  end

  describe("#save") do
    it("saves a particular category to table 'categories'") do
      test_category = Category.new({:id => 1, :name => "Entertainment"})
      test_category.save()
      expect(Category.all).to(eq([test_category]))
    end
  end

  describe("#==") do
    it("treats two categories with the same id and name as equal to each other") do
      test_1 = Category.new({:id => @id, :name => "Entertainment"})
      test_2 = Category.new({:id => @id, :name => "Entertainment"})
      expect(test_1).to(eq(test_2))
    end
  end

end
