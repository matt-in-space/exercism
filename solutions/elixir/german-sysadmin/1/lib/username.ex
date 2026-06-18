defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    normalize(username)
  end

  defp normalize([]), do: ~c""
  defp normalize([?_ | t]), do: [?_ | normalize(t)]
  defp normalize([?ä | t]), do: ~c"ae" ++ normalize(t)
  defp normalize([?ö | t]), do: ~c"oe" ++ normalize(t)
  defp normalize([?ü | t]), do: ~c"ue" ++ normalize(t)
  defp normalize([?ß | t]), do: ~c"ss" ++ normalize(t)
  defp normalize([h | t]) when h in ?a..?z, do: [h | normalize(t)]
  defp normalize([_h | t]), do: normalize(t)
end
