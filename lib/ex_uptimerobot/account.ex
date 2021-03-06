defmodule ExUptimerobot.Account do
  @moduledoc """
  Interact with Account-related API methods.
  """
  alias ExUptimerobot.Request
  alias Poison.Parser

  @doc """
  Account details (max number of monitors that can be added and number of
  up/down/paused monitors) can be grabbed using this method.

  ## Example

    iex> ExUptimerobot.Account.get_account_details()
    {:ok, results}

  """
  def get_account_details do
    with {:ok, body} <- Request.post("getAccountDetails"),
         {:ok, body} <- Parser.parse(body)
    do
      {:ok, body}
    else
      {:error, reason} -> {:error, reason}
      _                -> {:error, "Error getting account details"}
    end
  end
end
