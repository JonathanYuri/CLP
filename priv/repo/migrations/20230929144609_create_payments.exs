defmodule Clp.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :customerId, :string, null: false
      add :scheduledTo, :naive_datetime
      add :status, references(:payment_statuses, on_delete: :nothing), null: false
      add :invoice, references(:invoices, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:payments, [:status])
    create index(:payments, [:invoice])
  end
end
