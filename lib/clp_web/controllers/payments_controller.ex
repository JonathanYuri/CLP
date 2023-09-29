defmodule ClpWeb.PaymentsController do
  use ClpWeb, :controller

  alias Clp.PaymentsRoot
  alias Clp.PaymentsRoot.Payments

  action_fallback ClpWeb.FallbackController

  def index(conn, _params) do
    payments = PaymentsRoot.list_payments()
    render(conn, :index, payments: payments)
  end

  def create(conn, %{"payments" => payments_params}) do
    with {:ok, %Payments{} = payments} <- PaymentsRoot.create_payments(payments_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/payments/#{payments}")
      |> render(:show, payments: payments)
    end
  end

  def show(conn, %{"id" => id}) do
    payments = PaymentsRoot.get_payments!(id)
    render(conn, :show, payments: payments)
  end

  def update(conn, %{"id" => id, "payments" => payments_params}) do
    payments = PaymentsRoot.get_payments!(id)

    with {:ok, %Payments{} = payments} <- PaymentsRoot.update_payments(payments, payments_params) do
      render(conn, :show, payments: payments)
    end
  end

  def delete(conn, %{"id" => id}) do
    payments = PaymentsRoot.get_payments!(id)

    with {:ok, %Payments{}} <- PaymentsRoot.delete_payments(payments) do
      send_resp(conn, :no_content, "")
    end
  end
end
