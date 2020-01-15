defmodule Sort do
  def ascending([]), do: []
  def ascending([a]), do: [a]

  def ascending(list) do
    half_size = Enum.count(list) |> div(2)
    { list_a, list_b } = Enum.split(list, half_size)
    merge(
      ascending(list_a),
      ascending(list_b)
    )
  end

  def merge(list_a, []), do: list_a
  def merge([], list_b), do: list_b
  def merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b  do
    [head_a | merge(tail_a, list_b)]
  end
  def merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
    [head_b | merge(tail_b, list_a)]
  end
end
