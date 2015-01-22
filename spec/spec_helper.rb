require('rspec')
require('pg')
require('pry')
require('expense')
#require('category')
#require('expense-category')

DB = PG.connect({:dbname => "budget_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expense *;")
    DB.exec("DELETE FROM category *;")
    DB.exec("DELETE FROM expense-category *;")
  end
end
