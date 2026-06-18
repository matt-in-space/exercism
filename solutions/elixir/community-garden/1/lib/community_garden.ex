# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []) do
    Agent.start(fn -> {1, []} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {_, list} -> list end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn {id, list} ->
      plot = %Plot{plot_id: id, registered_to: register_to}
      {plot, {id + 1, [plot | list]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {id, list} -> {id, Enum.filter(list, &(&1.plot_id != plot_id))} end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_id, list} ->
      case Enum.find(list, &(&1.plot_id == plot_id)) do
        nil -> {:not_found, "plot is unregistered"}
        plot -> plot
      end
    end)
  end
end
