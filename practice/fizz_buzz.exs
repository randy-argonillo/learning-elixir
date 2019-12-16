fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

test = fn n ->
  a = rem(n, 3)
  b = rem(n, 5)
  c = n
  fizz_buzz.(a, b, c)
end

IO.puts(test.(10))
IO.puts(test.(11))
IO.puts(test.(12))
IO.puts(test.(13))
IO.puts(test.(14))
IO.puts(test.(15))
IO.puts(test.(16))
IO.puts(test.(17))
