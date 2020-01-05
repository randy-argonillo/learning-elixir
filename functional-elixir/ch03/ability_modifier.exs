user_ability_score = IO.gets("Enter you ability score: ")
{ ability_score, _ } = Integer.parse(user_ability_score)
ability_modifier = (ability_score - 10) / 2
IO.puts "Your ability modifier is #{ability_modifier}"
