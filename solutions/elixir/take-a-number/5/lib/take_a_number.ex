defmodule TakeANumber do
  def start(), do: spawn(&loop/0)

  defp loop(state \\ 0) do
    receive do
      {:report_state, sender_id} ->
        send(sender_id, state)
        loop(state)
      {:take_a_number, sender_id} ->
        send(sender_id, state + 1)
        loop(state + 1)
      :stop -> true
      _ -> loop(state)
    end
  end
end
