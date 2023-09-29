defmodule ClpWeb.PaymentsJSON do
  alias Clp.PaymentsRoot.Payments

  @doc """
  Renders a list of payments.
  """
  def index(%{payments: payments}) do
    %{data: for(payments <- payments, do: data(payments))}
  end

  @doc """
  Renders a single payments.
  """
  def show(%{payments: payments}) do
    %{data: data(payments)}
  end

  defp data(%Payments{} = payments) do
    %{
      id: payments.id,
      customerId: payments.customerId,
      scheduledTo: payments.scheduledTo
    }
  end
end
