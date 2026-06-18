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
  defp normalize([h | t]) when h in ?a..?z, do: [h | normalize(t)]
  defp normalize([h | t]) do
    case h do
      ?ä -> ~c"ae" ++ normalize(t)
      ?ö -> ~c"oe" ++ normalize(t)
      ?ü -> ~c"ue" ++ normalize(t)
      ?ß -> ~c"ss" ++ normalize(t)
      _ -> normalize(t)
    end
  end
end
