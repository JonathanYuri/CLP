defmodule Clp.Invoices.SInvoice do
  # defstruct id: nil, dueDate: nil, recipientId: nil, valueInCents: nil, barcode: nil, inserted_at: nil, updated_at: nil
  defstruct [:id, :dueDate, :recipientId, :valueInCents, :barcode, :inserted_at, :updated_at]
end

defmodule Clp.Invoices.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :dueDate, :naive_datetime
    field :recipientId, :string
    field :valueInCents, :integer

    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:dueDate, :recipientId, :valueInCents])
    |> validate_required([:dueDate, :recipientId, :valueInCents])
  end
end
