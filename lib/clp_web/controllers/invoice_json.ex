defmodule ClpWeb.InvoiceJSON do
  alias Clp.Invoices.Invoice
  alias Clp.Invoices.SInvoice

  @doc """
  Renders a list of invoices.
  """
  def index(%{invoices: invoices}) do
    %{data: for(invoice <- invoices, do: data(%SInvoice{
      id: invoice.id,
      dueDate: invoice.dueDate,
      recipientId: invoice.recipientId,
      barcode: "1000000_#{invoice.id}",
      valueInCents: invoice.valueInCents,
      inserted_at: invoice.inserted_at,
      updated_at: invoice.updated_at,
    }))}
  end

  @doc """
  Renders a single invoice.
  """
  def show(%{invoice: invoice}) do
    %{data: data(%SInvoice{
      id: invoice.id,
      dueDate: invoice.dueDate,
      recipientId: invoice.recipientId,
      barcode: "1000000_#{invoice.id}",
      valueInCents: invoice.valueInCents,
      inserted_at: invoice.inserted_at,
      updated_at: invoice.updated_at,
    })}
  end

  defp data(%SInvoice{} = invoice) do
    %{
      id: invoice.id,
      dueDate: invoice.dueDate,
      barcode: invoice.barcode,
      recipientId: invoice.recipientId,
      valueInCents: invoice.valueInCents
    }
  end
end
