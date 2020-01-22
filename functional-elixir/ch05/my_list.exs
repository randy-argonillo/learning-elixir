defmodule MyList do
  def test_data do
    [
      %{title: "Edwin's Longsword", price: 150},
      %{title: "Healing Potion", price: 60},
      %{title: "Edwin's Rope", price: 30},
      %{title: "Dragon's Spear", price: 100}
    ]
  end

  def each([], _func), do: nil

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def map([], _func), do: []

  def map([head | tail], func) do
    new_item = func.(head)
    [new_item | map(tail, func)]
  end

  def reduce([], acc, _func), do: acc

  def reduce([head | tail], acc, func) do
    reduce(tail, func.(head, acc), func)
  end
end

MyList.test_data()
|> MyList.each(&IO.puts("%{title: #{&1.title}, price: #{&1.price}}"))

MyList.test_data()
|> MyList.map(&%{title: &1.title, price: &1.price * 0.10 + &1.price})
|> IO.inspect()

MyList.test_data()
|> MyList.reduce(0, &(&2 + &1.price))
|> (&IO.puts("sum: #{&1}")).()
