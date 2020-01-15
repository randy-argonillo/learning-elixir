defmodule Navigator do
  @max_depth 2

  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir], 0)
  end

  defp go_through([], _depth), do: nil
  defp go_through(_dir, depth) when depth > @max_depth, do: nil

  defp go_through([dir | rest], depth) do
    print_and_navigate(dir, File.dir?(dir), depth)
    go_through(rest, depth)
  end

  defp print_and_navigate(_dir, is_directory, _depth) when is_directory === false, do: nil

  defp print_and_navigate(dir, is_directory, depth) when is_directory === true do
    IO.puts(dir)
    childrent_dirs = File.ls!(dir)
    expanded_dirs = expand_dirs(childrent_dirs, dir)

    go_through(expanded_dirs, depth + 1)
  end

  defp expand_dirs([], _relative_dir), do: []

  defp expand_dirs([dir | rest], relative_dir) do
    expanded_dir = Path.expand(dir, relative_dir)
    [expanded_dir | expand_dirs(rest, relative_dir)]
  end
end

Navigator.navigate("../../")
