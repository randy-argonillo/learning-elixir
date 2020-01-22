defmodule ScrewFactory do
  def process_eager(pieces) do
    pieces
    |> Enum.map(&attach_thread/1)
    |> Enum.map(&attach_head/1)
  end

  def process_lazy(pieces) do
    pieces
    |> Stream.map(&attach_thread/1)
    |> Stream.map(&attach_head/1)
  end

  def process_high_volume(pieces) do
    pieces
    |> Stream.chunk_every(50)
    |> Stream.flat_map(&attach_thread_high_volume/1)
    |> Stream.chunk_every(100)
    |> Stream.flat_map(&attach_head_high_volume/1)
  end

  def process_and_pack(pieces) do
    pieces
    |> process_high_volume
    |> Stream.chunk_every(30)
    |> Stream.flat_map(&pack/1)
  end

  def output(screws) do
    Enum.each(screws, &IO.inspect(&1))
  end

  defp attach_thread(piece) do
    Process.sleep(50)
    piece <> "--"
  end

  defp attach_head(piece) do
    Process.sleep(50)
    "o" <> piece
  end

  defp attach_thread_high_volume(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &(&1 <> "--"))
  end

  defp attach_head_high_volume(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &("o" <> &1))
  end

  defp pack(screws) do
    Process.sleep(70)
    Enum.map(screws, &("|#{&1}|"))
  end
end

# Stream.cycle(["-"])
# |> Enum.take(1000)
# |> ScrewFactory.process_and_pack
# |> ScrewFactory.output

Stream.cycle(["-"])
|> Enum.take(100)
|> ScrewFactory.process_lazy
|> ScrewFactory.output
