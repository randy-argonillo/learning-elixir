defmodule Excercise_2 do
  @moduledoc """
  # Create a function that returns Tic-Tac-Toe game winners.
  # You can represent the board with a tuple of nine elements, where each group of three items is a row.
  # The return of the function should be a tuple. When we have a winner,
  # the first element should be the atom :winner, and the second should be the player.
  # When we have no winner, the tuple should contain one item that is the atom :no_winner. It should work like this:


  TicTacToe.winner({
    :x, :o, :x,
    :o, :x, :o,
    :o, :o, :x
  })
  # {:winner, :x}

  TicTacToe.winner({
    :x, :o, :x,
    :o, :x, :o,
    :o, :x, :o
  })
  # :no_winner
  """

  def winner({
    a1, b1, c1,
    a2, b2, c2,
    a3, b3, c3
  }) do

    row_1 = { a1, b1, c1 }
    row_2 = { a2, b2, c2 }
    row_3 = { a3, b3, c3 }

    col_1 = { a1, a2, a3 }
    col_2 = { b1, b2, b3 }
    col_3 = { c1, c2, c3 }

    cross_1 = { a3, b2, c1 }
    cross_2 = { a1, b2, c3 }

    combinations = [
      row_1, row_2, row_3,
      col_1, col_2, col_3,
      cross_1, cross_2
    ]

    Enum.map(combinations, &determine_winner/1)
    |> Enum.find(&(&1 !== :no_winner))
    |> formalize_result
  end

  def formalize_result(result) do
    case result do
      { :winner, _ } -> result
      _ -> :no_winner
    end
  end

  defp determine_winner({x, x, x}), do: { :winner, x }
  defp determine_winner(_cells), do: :no_winner
end
