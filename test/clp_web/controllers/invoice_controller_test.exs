defmodule ClpWeb.InvoiceControllerTest do
  use ClpWeb.ConnCase

  import Clp.InvoicesFixtures

  alias Clp.Invoices.Invoice

  @create_attrs %{
    dueDate: ~N[2023-09-12 14:46:00],
    recipientId: "some recipientId",
    valueInCents: 42
  }
  @update_attrs %{
    dueDate: ~N[2023-09-13 14:46:00],
    recipientId: "some updated recipientId",
    valueInCents: 43
  }
  @invalid_attrs %{dueDate: nil, recipientId: nil, valueInCents: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all invoices", %{conn: conn} do
      conn = get(conn, ~p"/api/invoices")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create invoice" do
    test "renders invoice when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/invoices", invoice: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/invoices/#{id}")

      assert %{
               "id" => ^id,
               "dueDate" => "2023-09-12T14:46:00",
               "recipientId" => "some recipientId",
               "valueInCents" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/invoices", invoice: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update invoice" do
    setup [:create_invoice]

    test "renders invoice when data is valid", %{conn: conn, invoice: %Invoice{id: id} = invoice} do
      conn = put(conn, ~p"/api/invoices/#{invoice}", invoice: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/invoices/#{id}")

      assert %{
               "id" => ^id,
               "dueDate" => "2023-09-13T14:46:00",
               "recipientId" => "some updated recipientId",
               "valueInCents" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, invoice: invoice} do
      conn = put(conn, ~p"/api/invoices/#{invoice}", invoice: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete invoice" do
    setup [:create_invoice]

    test "deletes chosen invoice", %{conn: conn, invoice: invoice} do
      conn = delete(conn, ~p"/api/invoices/#{invoice}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/invoices/#{invoice}")
      end
    end
  end

  defp create_invoice(_) do
    invoice = invoice_fixture()
    %{invoice: invoice}
  end
end
