defmodule Clp.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Clp.Payments` context.
  """

  @doc """
  Generate a payment_status.
  """
  def payment_status_fixture(attrs \\ %{}) do
    {:ok, payment_status} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Clp.Payments.create_payment_status()

    payment_status
  end
end
