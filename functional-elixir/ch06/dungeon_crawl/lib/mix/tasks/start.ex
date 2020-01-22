defmodule Mix.Tasks.Start do
  def run(_), do: DungeonCrawl.Cli.Main.start()
end
