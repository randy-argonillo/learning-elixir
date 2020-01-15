defmodule EnchanterShop do
  @enchanter_name "Randy"

  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  def enchant_for_sale([]), do: []

  def enchant_for_sale([enchant = %{magic: true} | incoming]) do
    [enchant | enchant_for_sale(incoming)]
  end

  def enchant_for_sale([%{title: title, price: price} | incoming]) do
    new_enchant = %{
      title: "#{@enchanter_name}'s #{title}",
      price: price * 3,
      magic: true
    }

    [new_enchant | enchant_for_sale(incoming)]
  end
end
