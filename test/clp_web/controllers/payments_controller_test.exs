defmodule ClpWeb.PaymentsControllerTest do
  use ClpWeb.ConnCase

  import Clp.PaymentsRootFixtures

  alias Clp.PaymentsRoot.Payments

  @create_attrs %{
    customerId: "some customerId",
    scheduledTo: ~N[2023-09-28 14:46:00]
  }
  @update_attrs %{
    customerId: "some updated customerId",
    scheduledTo: ~N[2023-09-29 14:46:00]
  }
  @invalid_attrs %{customerId: nil, scheduledTo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all payments", %{conn: conn} do
      conn = get(conn, ~p"/api/payments")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create payments" do
    test "renders payments when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/payments", payments: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/payments/#{id}")

      assert %{
               "id" => ^id,
               "customerId" => "some customerId",
               "scheduledTo" => "2023-09-28T14:46:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/payments", payments: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update payments" do
    setup [:create_payments]

    test "renders payments when data is valid", %{conn: conn, payments: %Payments{id: id} = payments} do
      conn = put(conn, ~p"/api/payments/#{payments}", payments: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/payments/#{id}")

      assert %{
               "id" => ^id,
               "customerId" => "some updated customerId",
               "scheduledTo" => "2023-09-29T14:46:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, payments: payments} do
      conn = put(conn, ~p"/api/payments/#{payments}", payments: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete payments" do
    setup [:create_payments]

    test "deletes chosen payments", %{conn: conn, payments: payments} do
      conn = delete(conn, ~p"/api/payments/#{payments}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/payments/#{payments}")
      end
    end
  end

  defp create_payments(_) do
    payments = payments_fixture()
    %{payments: payments}
  end
end
