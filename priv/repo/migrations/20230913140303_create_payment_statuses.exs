defmodule Clp.Repo.Migrations.CreatePaymentStatuses do
  use Ecto.Migration

  def change do
    create table(:payment_statuses) do
      add :description, :string

      timestamps()
    end
  end
end
