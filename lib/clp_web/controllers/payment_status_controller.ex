defmodule ClpWeb.PaymentStatusController do
  use ClpWeb, :controller

  alias Clp.Payments
  alias Clp.Payments.PaymentStatus

  action_fallback ClpWeb.FallbackController

  def index(conn, _params) do
    payment_statuses = Payments.list_payment_statuses()
    render(conn, :index, payment_statuses: payment_statuses)
  end

  def show(conn, %{"id" => id}) do
    payment_status = Payments.get_payment_status!(id)
    render(conn, :show, payment_status: payment_status)
  end
end
