defmodule MyList do
  @moduledoc """
    Write two recursive functions: one that finds the biggest element of a list and another that finds the smallest. You should use them like this:

    MyList.max([4, 2, 16, 9, 10])
    # => 16
      MyList.min([4, 2, 16, 9, 10])
    # => 2
  """

  def max([number | others]) do
    get_max(others, number)
  end

  defp get_max([], current_max), do: current_max
  defp get_max([number | rest], current_max) when number > current_max do
    get_max(rest, number)
  end
  defp get_max([number | rest], current_max) when number < current_max do
    get_max(rest, current_max)
  end

  def min([number | others]) do
    get_min(others, number)
  end

  defp get_min([], current_min), do: current_min
  defp get_min([number | rest], current_min) when number < current_min do
    get_min(rest, number)
  end
  defp get_min([number | rest], current_min) when number > current_min do
    get_min(rest, current_min)
  end
end

IO.puts MyList.max([4, 2, 16, 9, 10])
IO.puts MyList.min([4, 2, 16, 9, 10])
