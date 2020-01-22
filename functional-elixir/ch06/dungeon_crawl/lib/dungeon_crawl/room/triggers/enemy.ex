defmodule DungeonCrawl.Room.Triggers.Enemy do
  alias DungeonCrawl.Room
  alias Mix.Shell.IO, as: Shell
  @behaviour Room.Trigger

  def run(character, %Room.Action{id: :forward}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepared and attack first.")

    {character_after_fight, _enemy} = DungeonCrawl.Battle.fight(character, enemy)
    {character_after_fight, :forward}
  end
end
