defmodule ClpWeb.InvoiceController do
  use ClpWeb, :controller

  alias Clp.Invoices
  alias Clp.Invoices.Invoice
  alias Clp.Invoices.SInvoice

  # |> render(:show, invoice: %SInvoice{invoice, barcode: "1000000_#{invoice.id}"})

  action_fallback ClpWeb.FallbackController

  def index(conn, _params) do
    invoices = Invoices.list_invoices()
    render(conn, :index, invoices: invoices)
  end

  def create(conn, %{"invoice" => invoice_params}) do
    with {:ok, %Invoice{} = invoice} <- Invoices.create_invoice(invoice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/invoices/#{invoice}")
      |> render(:show, invoice: invoice)
    end
  end

  def show(conn, %{"id" => id}) do
    invoice = Invoices.get_invoice!(id)
    render(conn, :show, invoice: invoice)
  end

  def findByBarCode(conn, %{"barCode" => barCode}) do
    id = String.replace(barCode, "1000000_", "")
    invoice = Invoices.get_invoice!(id)
    render(conn, :show, invoice: invoice)
  end

  def update(conn, %{"id" => id, "invoice" => invoice_params}) do
    invoice = Invoices.get_invoice!(id)

    with {:ok, %Invoice{} = invoice} <- Invoices.update_invoice(invoice, invoice_params) do
      render(conn, :show, invoice: invoice)
    end
  end

  def delete(conn, %{"id" => id}) do
    invoice = Invoices.get_invoice!(id)

    with {:ok, %Invoice{}} <- Invoices.delete_invoice(invoice) do
      send_resp(conn, :no_content, "")
    end
  end
end
