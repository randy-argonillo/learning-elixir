defmodule Excercise_3 do
  @moduledoc """
    Create a function that calculates income tax following these rules:
    a salary equal or below $2,000 pays no tax;
    below or equal to $3,000 pays 5%;
    below or equal to $6,000 pays 10%;
    everything higher than $6,000 pays 15%.
  """

  def income_tax(amount) do
    cond do
      amount <= 2000 -> :no_tax
      amount <= 3000 -> amount * 0.05
      amount <= 6000 -> amount * 0.10
      amount > 6000 -> amount * 0.15
    end
  end
end
