defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.Room.Triggers

  defstruct description: nil, actions: [], trigger: nil

  @type t :: %DungeonCrawl.Room{
          description: String.t(),
          actions: [Action.t()]
        }

  defimpl String.Chars do
    def to_string(room), do: room.description
  end

  def all,
    do: [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [Action.forward()],
        trigger: Triggers.Exit
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [Action.forward()],
        trigger: Triggers.Enemy
      }
    ]
end
