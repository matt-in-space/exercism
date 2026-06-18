defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_binary(path) do
    path_list = String.split(path, ".")
    extract_from_path(data, path_list)
  end

  def extract_from_path(data, [h] = list) when length(list) == 1 do
    data[h]
  end

  def extract_from_path(data, [h | t] = path) when is_list(path) do
    case data[h] do
      nil -> nil
      x when is_map(x) -> extract_from_path(x, t)
      x -> x
    end
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
