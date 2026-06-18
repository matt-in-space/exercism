defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score(coords) do
    zone = radius(coords)

    cond do
      zone > 10 -> 0
      zone > 5 -> 1
      zone > 1 -> 5
      true -> 10
    end
  end

  defp radius({x, y}) do
    Float.pow(x / 1, 2) + Float.pow(y / 1, 2) |> :math.sqrt
  end
end
