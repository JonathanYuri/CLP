defmodule Clp.PaymentsRoot.Payments do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :customerId, :string
    field :scheduledTo, :naive_datetime
    field :status, :id
    field :invoice, :id

    timestamps()
  end

  @doc false
  def changeset(payments, attrs) do
    payments
    |> cast(attrs, [:customerId, :scheduledTo])
    |> validate_required([:customerId, :scheduledTo])
  end
end
