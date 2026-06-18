defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)

  defp search(numbers, key, _low, high) when elem(numbers, high) == key, do: {:ok, high}
  defp search(numbers, key, low, _high) when elem(numbers, low) == key, do: {:ok, low}

  defp search(numbers, key, low, high) do
    mid = div(high - low, 2) + low
    val = elem(numbers, mid)

    cond do
      val == key -> {:ok, mid}
      mid == low or mid == high -> :not_found
      key < val -> search(numbers, key, low, mid)
      val < key -> search(numbers, key, mid, high)
    end
  end
end
