defmodule Clp.PaymentsRootFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Clp.PaymentsRoot` context.
  """

  @doc """
  Generate a payments.
  """
  def payments_fixture(attrs \\ %{}) do
    {:ok, payments} =
      attrs
      |> Enum.into(%{
        customerId: "some customerId",
        scheduledTo: ~N[2023-09-28 14:46:00]
      })
      |> Clp.PaymentsRoot.create_payments()

    payments
  end
end
