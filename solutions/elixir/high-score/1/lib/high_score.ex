defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name, score \\ 0), do: Map.put_new(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.put(scores, name, 0)

  def update_score(scores, name, score) do
    cond do
      Map.has_key?(scores, name) -> Map.update!(scores, name, &(&1 + score))
      true -> add_player(scores, name, score)
    end
  end

  def get_players(scores), do: Map.keys(scores)
end
