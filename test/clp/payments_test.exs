defmodule Clp.PaymentsTest do
  use Clp.DataCase

  alias Clp.Payments

  describe "payment_statuses" do
    alias Clp.Payments.PaymentStatus

    import Clp.PaymentsFixtures

    @invalid_attrs %{description: nil}

    test "list_payment_statuses/0 returns all payment_statuses" do
      payment_status = payment_status_fixture()
      assert Payments.list_payment_statuses() == [payment_status]
    end

    test "get_payment_status!/1 returns the payment_status with given id" do
      payment_status = payment_status_fixture()
      assert Payments.get_payment_status!(payment_status.id) == payment_status
    end

    test "create_payment_status/1 with valid data creates a payment_status" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %PaymentStatus{} = payment_status} = Payments.create_payment_status(valid_attrs)
      assert payment_status.description == "some description"
    end

    test "create_payment_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_payment_status(@invalid_attrs)
    end

    test "update_payment_status/2 with valid data updates the payment_status" do
      payment_status = payment_status_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %PaymentStatus{} = payment_status} = Payments.update_payment_status(payment_status, update_attrs)
      assert payment_status.description == "some updated description"
    end

    test "update_payment_status/2 with invalid data returns error changeset" do
      payment_status = payment_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_payment_status(payment_status, @invalid_attrs)
      assert payment_status == Payments.get_payment_status!(payment_status.id)
    end

    test "delete_payment_status/1 deletes the payment_status" do
      payment_status = payment_status_fixture()
      assert {:ok, %PaymentStatus{}} = Payments.delete_payment_status(payment_status)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_payment_status!(payment_status.id) end
    end

    test "change_payment_status/1 returns a payment_status changeset" do
      payment_status = payment_status_fixture()
      assert %Ecto.Changeset{} = Payments.change_payment_status(payment_status)
    end
  end
end
