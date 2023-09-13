defmodule ClpWeb.PaymentStatusJSON do
  alias Clp.Payments.PaymentStatus

  @doc """
  Renders a list of payment_statuses.
  """
  def index(%{payment_statuses: payment_statuses}) do
    %{data: for(payment_status <- payment_statuses, do: data(payment_status))}
  end

  @doc """
  Renders a single payment_status.
  """
  def show(%{payment_status: payment_status}) do
    %{data: data(payment_status)}
  end

  defp data(%PaymentStatus{} = payment_status) do
    %{
      id: payment_status.id,
      description: payment_status.description
    }
  end
end
