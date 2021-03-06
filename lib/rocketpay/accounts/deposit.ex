defmodule Rocketpay.Accounts.Deposit do
  alias Rocketpay.Accounts.Operation
  alias Rocketpay.{Repo}

  # Info: Como a chamada vem do controller a notação acaba vindo como string
  def call(params) do
    params
    |> Operation.call(:deposit)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{deposit: account}} -> {:ok, account}
    end
  end
end
