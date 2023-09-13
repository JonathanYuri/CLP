defmodule Clp.Payments.PaymentStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payment_statuses" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(payment_status, attrs) do
    payment_status
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
