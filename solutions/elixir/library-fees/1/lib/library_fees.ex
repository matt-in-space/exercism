defmodule LibraryFees do
  @monday_index 1

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    noon = ~T[12:00:00]

    Time.before?(time, noon)
  end

  def return_date(checkout_datetime) do
    checkout_length = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
      |> NaiveDateTime.to_date()
      |> Date.add(checkout_length)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
      |> NaiveDateTime.to_date()
      |> Date.diff(planned_return_date)
      |> max(0)
  end

  def monday?(datetime) do
    @monday_index == datetime
      |> NaiveDateTime.to_date()
      |> Date.day_of_week()
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)
    return_at_date = return_date(checkout_datetime)
    
    total_fees = days_late(return_at_date, return_datetime) * rate

    if monday?(return_datetime), do: div(total_fees, 2), else: total_fees
  end
end
