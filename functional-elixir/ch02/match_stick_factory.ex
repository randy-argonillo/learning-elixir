defmodule MatchStickFactory do
  @big_size 50
  @medium_size 20
  @small_size 5

  def boxes(matches) do
    calculate_matches = fn matchsticks, size ->
      number_of_boxes = div(matchsticks, size)
      remaining = rem(matchsticks, size)

      {number_of_boxes, remaining}
    end

    { big, remaining } = calculate_matches.(matches, @big_size)
    { medium, remaining } = calculate_matches.(remaining, @medium_size)
    { small, remaining } = calculate_matches.(remaining, @small_size)

    %{big: big, medium: medium, small: small, remaining_matchsticks: remaining}
  end
end
