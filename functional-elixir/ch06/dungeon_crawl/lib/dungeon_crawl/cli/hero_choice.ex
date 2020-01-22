defmodule DungeonCrawl.Cli.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Heroes
  alias DungeonCrawl.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = Heroes.all()

    heroes
    |> BaseCommands.display_options
    |> BaseCommands.generate_question
    |> Shell.prompt
    |> BaseCommands.parse_answer
    |> BaseCommands.find_options(heroes)
    |> confirm
  end

  defp confirm(hero) do
    Shell.cmd("clear")
    Shell.info(hero.description)
    if Shell.yes?("Confirm?"), do: hero, else: start()
  end
end
