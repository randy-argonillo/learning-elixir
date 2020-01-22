defmodule DungeonCrawl.Cli.RoomActionChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.BaseCommands

  def start(room) do
    Shell.info(room.description)

    chosen_action = room.actions
    |> BaseCommands.display_options
    |> BaseCommands.generate_question_and_prompt
    |> BaseCommands.parse_answer
    |> BaseCommands.find_options(room.actions)

    { room, chosen_action }
  end

end
