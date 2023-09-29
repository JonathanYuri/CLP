defmodule Clp.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :dueDate, :naive_datetime, null: false
      add :recipientId, :string, null: false
      add :valueInCents, :integer, null: false

      timestamps()
    end
  end
end
