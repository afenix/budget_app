class Category

attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

 define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_expenses.each() do |category|
      name = category.fetch("name")
      id = category.fetch("id").to_i()
      categories.push(Category.new({:id => id, :name => name}))
    end
    categories
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |other_name|
    self.name().==(other_name.name()) && self.id().==(other_name.id())
  end

end
