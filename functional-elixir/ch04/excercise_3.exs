defmodule Sort do
  @moduledoc """
    We’ve created a function that sorts the items of a list in ascending order. Now create a Sort.descending/1 function that sorts the elements in descending order.
  """

  def descending([]), do: []
  def descending([a]), do: [a]
  def descending(items) do
    half_size = Enum.count(items)
                |> div(2)

    { list_a, list_b } = Enum.split(items, half_size)

    merge(
      descending(list_a),
      descending(list_b)
    )
  end

  defp merge([], []), do: []
  defp merge([], list_b), do: list_b
  defp merge(list_a, []), do: list_a
  defp merge([head_a | remaining_a], list_b = [ head_b | _ ]) when head_a >= head_b do
    [head_a | merge(remaining_a, list_b)]
  end
  defp merge(list_a = [head_a | _], [head_b | remaining_b]) when head_a < head_b do
    [head_b | merge(remaining_b, list_a)]
  end
end

Sort.descending([1,2,3,4,11,5,6,7,8,9,12])
|> Enum.reduce("", &("#{&2}#{&1}, "))
|> String.trim_trailing(", ")
|> IO.puts
