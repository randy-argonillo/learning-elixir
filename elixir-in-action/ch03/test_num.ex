defmodule TestNum do
  def test(0), do: :zero
  def test(n) when n < 0, do: :negative
  def test(n) when n > 0, do: :positive
end
