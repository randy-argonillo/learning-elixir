defmodule Sum do
  def upto(n), do: upto_tr(n, 0)

  defp upto_tr(0, acc), do: acc
  defp upto_tr(n, acc) when n > 0 do
    upto_tr(n - 1, acc + n)
  end
end

defmodule Math do
  def sum(items), do: sum_tr(items, 0)

  def sum_tr([], acc), do: acc
  def sum_tr([head | tail], acc), do: sum_tr(tail, head + acc)
end

defmodule Sort do
  def merge(list_a, list_b), do: merge_tr(list_a, list_b, [])

  def merge_tr([], list_b, acc), do: [acc | list_b]
  def merge_tr(list_a, [], acc), do: [acc | list_a]
  def merge_tr([head_a | remaining_a], list_b = [head_b | _], acc) when head_a <= head_b do
    merge_tr(remaining_a, list_b, [acc | head_a])
  end
  def merge_tr(list_a = [head_a | _], [head_b, remaining_b], acc) when head_a > head_b do
    merge_tr(list_a, remaining_b, [acc | head_b])
  end
end

Sum.upto(9)
|> IO.puts

Math.sum([1,2,3,4,5,6,7,8,9])
|> IO.puts

Sort.merge([5,3,7,2], [9,1,4,6])
|> inspect
|> IO.puts
