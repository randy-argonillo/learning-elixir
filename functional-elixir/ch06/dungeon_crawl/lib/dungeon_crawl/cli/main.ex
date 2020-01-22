defmodule DungeonCrawl.Cli.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Room
  alias DungeonCrawl.Cli, as: CLI
  alias DungeonCrawl.Character

  def start() do
    welcome_message()
    Shell.prompt("Press enter to continue...")
    crawl(hero_choice(), Room.all())
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice do
    hero = CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(%{hit_points: hit_points}, _) when hit_points === 0 do
    Shell.info("Unfortunately your wounds are too many to keep walking.")
    Shell.info("You fall onto the floor without strength to carry on.")
    Shell.info("Game over!")
    Shell.prompt("")
  end

  defp crawl(hero, rooms) do
    Shell.cmd("clear")
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")
    Shell.info(Character.stats(hero))

    rooms
    |> Enum.random()
    |> CLI.RoomActionChoice.start()
    |> trigger_action(hero)
    |> handle_action_result
  end

  def trigger_action({room, action}, character) do
    # Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  def handle_action_result({_, :exit}),
    do: Shell.info("You found the exit. You won the game. Congratulations!")

  def handle_action_result({character, _}) do
    Shell.prompt("Please press enter to continue...")
    crawl(character, Room.all())
  end
end
