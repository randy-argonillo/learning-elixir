defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def fight(
        character_a = %{hit_points: hit_points_a},
        character_b = %{hit_points: hit_points_b}
      )
      when hit_points_a === 0 or hit_points_b === 0,
      do: {character_a, character_b}

  def fight(character_a, character_b) do
    character_b_after_attack = attack(character_a, character_b)
    character_a_after_attack = attack(character_b_after_attack, character_a)

    fight(character_a_after_attack, character_b_after_attack)
  end

  defp attack(
         %{hit_points: hit_points_attacker},
         attackee
       )
       when hit_points_attacker === 0,
       do: attackee

  defp attack(attacker, attackee) do
    damage = Character.get_damage(attacker)
    attackee_after_damage = Character.take_damage(attackee, damage)

    attacker
    |> attack_message(damage)
    |> Shell.info()

    attackee_after_damage
    |> receive_message(damage)
    |> Shell.info()

    attackee_after_damage
  end

  defp attack_message(attacker = %{name: "You"}, damage) do
    "You attack with #{attacker.attack_description} " <> "and deal #{damage} damage."
  end

  defp attack_message(attacker, damage) do
    "#{attacker.name} attacks with " <>
      "#{attacker.attack_description} and " <>
      "deals #{damage} damage."
  end

  defp receive_message(attackee = %{name: "You"}, damage) do
    "You receive #{damage}. Current HP: #{attackee.hit_points}."
  end

  defp receive_message(attackee, damage) do
    "#{attackee.name} receives #{damage}. " <>
      "Current HP: #{attackee.hit_points}."
  end
end
