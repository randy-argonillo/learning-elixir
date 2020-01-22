defmodule Halloween do
  def give_candies(kids) do
    ~w(chocolate jelly mint)
    |> Stream.cycle
    |> Enum.zip(kids)
  end
end

Halloween.give_candies(~w(randy caroline annishka brielle))
|> IO.inspect
