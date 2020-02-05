defmodule NaturalNumbers do
  def print(1), do: IO.puts 1
  def print(n) when is_number(n) and n > 1 do
    print(n-1)
    IO.puts n
  end
end
