defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count >= 1 do
    Stream.iterate(2, &next_prime/1)
    |> Stream.take(count)
    |> Enum.to_list()
    |> List.last()
  end

  defp prime?(n) do
    Enum.all?(1..div(n, 2), &(&1 == 1 or rem(n, &1) != 0))
  end

  defp next_prime(n) do
    if prime?(n + 1), do: n + 1, else: next_prime(n + 1)
  end
end
