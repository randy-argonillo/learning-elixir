# In RPGs, players have points to spend on their character attributes.
# Create a function that returns the total number of points players have spent on their characters.
# The function will receive a map containing the strength, dexterity, and intelligence values.
# Each point in strength should be multi- plied by two, and dexterity and intelligence should be multiplied by three.

defmodule Excercise1 do
  def total_points(%{strength: strength, dexterity: dexterity, intelligence: intelligence}) do
    strength_points = strength * 2
    dexterity_points = dexterity * 3
    intelligence_points = intelligence * 3

    strength_points + dexterity_points + intelligence_points
  end
end
