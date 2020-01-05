user_response = IO.gets "Enter your ability score:\n"

message = case Integer.parse(user_response) do
  :error -> "Invalid ability score: #{user_response}."
  { ability_score, _ } when ability_score >= 10 ->
    ability_modifier = (ability_score - 10) / 2
    "You ability modifier is #{ability_modifier}"
end

IO.puts(message)
