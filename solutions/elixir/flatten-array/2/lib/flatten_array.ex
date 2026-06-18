defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: do_flatten(list) |> Enum.filter(fn x -> x != nil end)

  defp do_flatten([]), do: []
  defp do_flatten(x) when not is_list(x), do: x
  defp do_flatten([h|t]) when is_list(h), do: flatten(h) ++ flatten(t)
  defp do_flatten([h | t]), do: [h | flatten(t)]
end
