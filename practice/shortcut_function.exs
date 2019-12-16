add_one = &(&1 + 1)
speak = &IO.puts(&1)

IO.puts(add_one.(45))
IO.puts(speak.("hi"))
