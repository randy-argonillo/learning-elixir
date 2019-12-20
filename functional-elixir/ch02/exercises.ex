defmodule Ch02.Exercises do
  def question_1() do
    # Create an expression that solves the following problem:
    # Sarah has bought ten slices of bread for ten cents each, three bottles of
    # milk for two dollars each, and a cake for fifteen dollars.
    # How many dollars has Sarah spent?

    num_of_bread_slices = 10
    bread_slice_price = 0.10
    num_of_milk = 3
    milk_price = 2
    num_of_cake = 1
    cake_price = 15

    total =
      num_of_bread_slices * bread_slice_price * num_of_milk * milk_price * num_of_cake *
        cake_price

    IO.puts(total)
  end

  def question_2() do
    # Bob has traveled 200 km in four hours.
    # Using variables, print a message showing his travel distance, time,
    # and average velocity.

    distance = 200
    time = 4
    speed = distance / time
    IO.puts "\ndistance: #{distance}\ntime: #{time}\navgerage speed: #{speed} km/h\n"
  end

  def question_3() do
    # Build an anonymous function that applies a tax of 12% to a given price.
    apply_tax = fn price ->
      tax_rate = 12 / 100
      new_price = Float.round(price * (tax_rate + 1), 4)
      tax = Float.round(new_price - price, 4)

      IO.puts "Price: #{new_price} - Tax: #{tax}"
    end

    price_list = [12.5, 30.99, 250.49, 18.80]

    Enum.each price_list, apply_tax
  end
end
