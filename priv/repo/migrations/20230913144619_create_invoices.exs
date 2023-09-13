defmodule Clp.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :dueDate, :naive_datetime
      add :recipientId, :string
      add :valueInCents, :integer

      timestamps()
    end
  end
end
