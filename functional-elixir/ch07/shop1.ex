defmodule Shop do
  def checkout do
    quantity = ask_number("Quantity?")
    price = ask_number("Price?")
    calculate(quantity, price)
  end

  defp calculate(:error, _), do: :error
  defp calculate(_, :error), do: :error
  defp calculate(quantity, price), do: quantity * price

  defp ask_number(message) do
    response = IO.gets("#{message} ") |> Integer.parse
    case response do
      :error -> :error
      { number, _ } -> number
    end
  end
end
