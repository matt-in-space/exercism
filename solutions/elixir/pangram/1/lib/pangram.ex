defmodule Pangram do
  @total_letters 26

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    @total_letters == sentence
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.uniq()
    |> Enum.filter(fn char -> char in ?a..?z end)
    |> Kernel.length()
  end
end
