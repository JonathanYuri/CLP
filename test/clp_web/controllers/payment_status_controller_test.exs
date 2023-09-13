defmodule ClpWeb.PaymentStatusControllerTest do
  use ClpWeb.ConnCase

  import Clp.PaymentsFixtures

  alias Clp.Payments.PaymentStatus

  @create_attrs %{
    description: "some description"
  }
  @update_attrs %{
    description: "some updated description"
  }
  @invalid_attrs %{description: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all payment_statuses", %{conn: conn} do
      conn = get(conn, ~p"/api/payment_statuses")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create payment_status" do
    test "renders payment_status when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/payment_statuses", payment_status: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/payment_statuses/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/payment_statuses", payment_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update payment_status" do
    setup [:create_payment_status]

    test "renders payment_status when data is valid", %{conn: conn, payment_status: %PaymentStatus{id: id} = payment_status} do
      conn = put(conn, ~p"/api/payment_statuses/#{payment_status}", payment_status: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/payment_statuses/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, payment_status: payment_status} do
      conn = put(conn, ~p"/api/payment_statuses/#{payment_status}", payment_status: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete payment_status" do
    setup [:create_payment_status]

    test "deletes chosen payment_status", %{conn: conn, payment_status: payment_status} do
      conn = delete(conn, ~p"/api/payment_statuses/#{payment_status}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/payment_statuses/#{payment_status}")
      end
    end
  end

  defp create_payment_status(_) do
    payment_status = payment_status_fixture()
    %{payment_status: payment_status}
  end
end
