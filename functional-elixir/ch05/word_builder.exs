defmodule WordBuilder do
  def build(word, positions) do
    positions
    |> Enum.map(&String.at(word, &1))
    |> Enum.join
  end
end

WordBuilder.build("world", [4,1,1,2])
|> IO.puts
