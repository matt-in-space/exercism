defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", "-"])
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&acronym_letter/1)
    |> List.to_string()
  end

  defp first_letter(<<first, _rest::bitstring>>), do: first

  defp acronym_letter(word) do
    String.trim(word, "_") |> String.upcase() |> first_letter()
  end
end
