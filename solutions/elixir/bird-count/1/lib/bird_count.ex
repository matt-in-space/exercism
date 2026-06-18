defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: List.update_at(list, 0, &(&1 + 1))

  def has_day_without_birds?(list), do: Enum.any?(list, &(&1 == 0))

  def total(list), do: Enum.sum(list)

  def busy_days(list), do: Enum.filter(list, &(&1 >= 5)) |> Kernel.length
end
