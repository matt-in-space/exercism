defmodule RPNCalculator do
  def calculate!(stack, operation) do
    operation.(stack)
  end

  def calculate(stack, operation) do
    try do
      val = operation.(stack)
      {:ok, val}
    rescue
      _ -> :error
    end
  end

  def calculate_verbose(stack, operation) do
    try do
      val = operation.(stack)
      {:ok, val}
    rescue
      e -> {:error, e.message}
    end
  end
end
