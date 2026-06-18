defmodule FreelancerRates do
  @hours_per_day 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    price_off = discount / 100 * before_discount
    before_discount - price_off
  end

  def monthly_rate(hourly_rate, discount) do
    total = daily_rate(hourly_rate) * @monthly_billable_days
    apply_discount(total, discount)
      |> Float.ceil
      |> Kernel.trunc
    
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = daily_rate(hourly_rate)
    daily_total = apply_discount(rate, discount)
    budget / daily_total |> Float.floor(1)
  end
end
