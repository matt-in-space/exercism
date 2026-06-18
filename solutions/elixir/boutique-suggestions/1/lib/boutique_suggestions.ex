defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops, bottom <- bottoms do
      {top, bottom}
    end
    |> Enum.filter(fn {top, bottom} -> top.base_color != bottom.base_color end)
    |> maybe_filter(&filter_by_price/2, Keyword.get(options, :maximum_price, 100.00))
  end

  defp filter_by_price({top, bottom}, price) do
    top.price + bottom.price <= price
  end

  defp maybe_filter(items, filter, value) do
    case value do
      nil -> items
      _ -> Enum.filter(items, fn item -> filter.(item, value) end)
    end
  end
end
