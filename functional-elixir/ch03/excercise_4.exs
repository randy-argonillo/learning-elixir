# Create an Elixir script where users can type their salary and see the income tax
# and the net wage. You can use the module from the previous exercise,
# but this script should parse the user input and display a message when users
# type something that is not a valid number.


defmodule TaxCalculator do
  def calculate_income_tax(salary) when salary <= 2000, do: 0
  def calculate_income_tax(salary) when salary <= 3000, do: salary * 0.05
  def calculate_income_tax(salary) when salary <= 6000, do: salary * 0.10
  def calculate_income_tax(salary) when salary > 6000, do: salary * 0.15
end

input = IO.gets("Enter you salary: ") |> Integer.parse()

result = case input do
  { salary, _ } ->
    income_tax = TaxCalculator.calculate_income_tax(salary)
    net = salary - income_tax
    "income_tax: #{income_tax}, net_wage: #{net}"
  :error -> "Please enter an amount."
end

IO.puts(result)
