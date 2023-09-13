defmodule Clp.InvoicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Clp.Invoices` context.
  """

  @doc """
  Generate a invoice.
  """
  def invoice_fixture(attrs \\ %{}) do
    {:ok, invoice} =
      attrs
      |> Enum.into(%{
        dueDate: ~N[2023-09-12 14:46:00],
        recipientId: "some recipientId",
        valueInCents: 42
      })
      |> Clp.Invoices.create_invoice()

    invoice
  end
end
