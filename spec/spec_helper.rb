require('rspec')
require('pg')
require('pry')
require('expense')
require('category')
require('expense_category')

DB = PG.connect({:dbname => "budget_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    # DB.exec("ALTER SEQUENCE expenses_id_seq RESTART WITH 1;")

    DB.exec("DELETE FROM categories *;")
    # DB.exec("ALTER SEQUENCE categories_id_seq RESTART WITH 1;")

    DB.exec("DELETE FROM expense_categories *;")
    # DB.exec("ALTER SEQUENCE expense_categories_id_seq RESTART WITH 1;")
  end
end
