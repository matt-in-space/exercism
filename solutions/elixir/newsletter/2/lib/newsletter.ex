defmodule Newsletter do
  def read_emails(path) do
    case File.read(path) do
      {:ok, data} -> String.split(data, "\n") |> Enum.reject(&(&1 == ""))
      _ -> []
    end
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    log = open_log(log_path)

    for email <- emails do
      if send_fun.(email) == :ok do
        log_sent_email(log, email)
      end
    end

    close_log(log)
  end
end
