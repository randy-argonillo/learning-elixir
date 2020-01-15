defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def filter_items([], _is_magical), do: []

  def filter_items([item = %{magic: true} | others], magic: false) do
    filter_items(others, magic: false)
  end

  def filter_items([item = %{magic: false} | others], magic: true) do
    filter_items(others, magic: true)
  end

  def filter_items([item = %{magic: true} | other_items], magic: true) do
    [item | filter_items(other_items, magic: true)]
  end

  def filter_items([item = %{magic: false} | other_items], magic: false) do
    [item | filter_items(other_items, magic: false)]
  end
end

GeneralStore.filter_items(
  GeneralStore.test_data,
  magic: false
)
|> Enum.each(&IO.puts("title: #{&1.title}, price: #{&1.price}, magic: #{&1.magic}"))

# GeneralStore.test([%{test: true}], magic: true)
