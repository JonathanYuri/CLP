defmodule Clp.PaymentsRootTest do
  use Clp.DataCase

  alias Clp.PaymentsRoot

  describe "payments" do
    alias Clp.PaymentsRoot.Payments

    import Clp.PaymentsRootFixtures

    @invalid_attrs %{customerId: nil, scheduledTo: nil}

    test "list_payments/0 returns all payments" do
      payments = payments_fixture()
      assert PaymentsRoot.list_payments() == [payments]
    end

    test "get_payments!/1 returns the payments with given id" do
      payments = payments_fixture()
      assert PaymentsRoot.get_payments!(payments.id) == payments
    end

    test "create_payments/1 with valid data creates a payments" do
      valid_attrs = %{customerId: "some customerId", scheduledTo: ~N[2023-09-28 14:46:00]}

      assert {:ok, %Payments{} = payments} = PaymentsRoot.create_payments(valid_attrs)
      assert payments.customerId == "some customerId"
      assert payments.scheduledTo == ~N[2023-09-28 14:46:00]
    end

    test "create_payments/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PaymentsRoot.create_payments(@invalid_attrs)
    end

    test "update_payments/2 with valid data updates the payments" do
      payments = payments_fixture()
      update_attrs = %{customerId: "some updated customerId", scheduledTo: ~N[2023-09-29 14:46:00]}

      assert {:ok, %Payments{} = payments} = PaymentsRoot.update_payments(payments, update_attrs)
      assert payments.customerId == "some updated customerId"
      assert payments.scheduledTo == ~N[2023-09-29 14:46:00]
    end

    test "update_payments/2 with invalid data returns error changeset" do
      payments = payments_fixture()
      assert {:error, %Ecto.Changeset{}} = PaymentsRoot.update_payments(payments, @invalid_attrs)
      assert payments == PaymentsRoot.get_payments!(payments.id)
    end

    test "delete_payments/1 deletes the payments" do
      payments = payments_fixture()
      assert {:ok, %Payments{}} = PaymentsRoot.delete_payments(payments)
      assert_raise Ecto.NoResultsError, fn -> PaymentsRoot.get_payments!(payments.id) end
    end

    test "change_payments/1 returns a payments changeset" do
      payments = payments_fixture()
      assert %Ecto.Changeset{} = PaymentsRoot.change_payments(payments)
    end
  end
end
