defmodule Shop2 do
  def checkout do
    with quantity when is_number(quantity) <- ask_number("Quantity?"),
         price when is_number(price) <- ask_number("Price?") do
      quantity * price
    end
  end

  defp ask_number(message) do
    response = IO.gets("#{message} ") |> Integer.parse()

    case response do
      :error -> :error
      {number, _} -> number
    end
  end
end
