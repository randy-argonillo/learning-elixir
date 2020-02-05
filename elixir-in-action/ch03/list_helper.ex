defmodule ListHelper do
  def sum(list, result \\ 0)
  def sum([], result), do: result
  def sum([head | tail], result), do: sum(tail, head + result)

  def calc_length(list, current_length \\ 0)
  def calc_length([], current_length), do: current_length
  def calc_length([_head | tail], current_length) do
    calc_length(tail, current_length + 1)
  end

  def range(from, to, result \\ [])
  def range(from, to, result) when from > to, do: result
  def range(from, to, result) do
   range(from, to - 1, [to | result])
  end

  def reverse(list, result \\ [])
  def reverse([], result), do: result
  def reverse([head | tail], result) do
    reverse(tail, [head | result])
  end

  def positive(list, result \\ [])
  def positive([], result), do: reverse(result)
  def positive([head | tail], result) when head <= 0 and is_number(head) do
    positive(tail, result)
  end
  def positive([head | tail], result) when head >= 0 and is_number(head) do
    positive(tail, [head | result])
  end
end
