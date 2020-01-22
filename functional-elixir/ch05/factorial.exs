defmodule Factorial do
  def of(0), do: 1
  def of(n) when n >= 1 do
    Stream.iterate(1, &(&1 + 1))
    |> Enum.take(n)
    |> Enum.reduce(&(&1 * &2))
  end
end

Factorial.of(10000)
|> IO.inspect()
