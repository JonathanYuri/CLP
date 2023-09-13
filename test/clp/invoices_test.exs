defmodule Clp.InvoicesTest do
  use Clp.DataCase

  alias Clp.Invoices

  describe "invoices" do
    alias Clp.Invoices.Invoice

    import Clp.InvoicesFixtures

    @invalid_attrs %{dueDate: nil, recipientId: nil, valueInCents: nil}

    test "list_invoices/0 returns all invoices" do
      invoice = invoice_fixture()
      assert Invoices.list_invoices() == [invoice]
    end

    test "get_invoice!/1 returns the invoice with given id" do
      invoice = invoice_fixture()
      assert Invoices.get_invoice!(invoice.id) == invoice
    end

    test "create_invoice/1 with valid data creates a invoice" do
      valid_attrs = %{dueDate: ~N[2023-09-12 14:46:00], recipientId: "some recipientId", valueInCents: 42}

      assert {:ok, %Invoice{} = invoice} = Invoices.create_invoice(valid_attrs)
      assert invoice.dueDate == ~N[2023-09-12 14:46:00]
      assert invoice.recipientId == "some recipientId"
      assert invoice.valueInCents == 42
    end

    test "create_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invoices.create_invoice(@invalid_attrs)
    end

    test "update_invoice/2 with valid data updates the invoice" do
      invoice = invoice_fixture()
      update_attrs = %{dueDate: ~N[2023-09-13 14:46:00], recipientId: "some updated recipientId", valueInCents: 43}

      assert {:ok, %Invoice{} = invoice} = Invoices.update_invoice(invoice, update_attrs)
      assert invoice.dueDate == ~N[2023-09-13 14:46:00]
      assert invoice.recipientId == "some updated recipientId"
      assert invoice.valueInCents == 43
    end

    test "update_invoice/2 with invalid data returns error changeset" do
      invoice = invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Invoices.update_invoice(invoice, @invalid_attrs)
      assert invoice == Invoices.get_invoice!(invoice.id)
    end

    test "delete_invoice/1 deletes the invoice" do
      invoice = invoice_fixture()
      assert {:ok, %Invoice{}} = Invoices.delete_invoice(invoice)
      assert_raise Ecto.NoResultsError, fn -> Invoices.get_invoice!(invoice.id) end
    end

    test "change_invoice/1 returns a invoice changeset" do
      invoice = invoice_fixture()
      assert %Ecto.Changeset{} = Invoices.change_invoice(invoice)
    end
  end
end
