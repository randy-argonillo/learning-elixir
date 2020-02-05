defmodule TestNum2 do
  def test(0), do: :zero
  def test(n) when is_number(n) and n < 0, do: :negative
  def test(n) when is_number(n) and n > 0, do: :positive
end
