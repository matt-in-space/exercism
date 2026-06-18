defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    collatz(input)
  end

  defp collatz(value, step \\ 0)
  defp collatz(1, step), do: step

  defp collatz(value, step) when value > 0 and rem(value, 2) == 0 do
    div(value, 2) |> collatz(step + 1)
  end

  defp collatz(value, step) when value > 0 and rem(value, 2) == 1 do
    collatz(value * 3 + 1, step + 1)
  end
end
