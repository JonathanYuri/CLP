defmodule Clp.PaymentsRoot do
  @moduledoc """
  The PaymentsRoot context.
  """

  import Ecto.Query, warn: false
  alias Clp.Repo

  alias Clp.PaymentsRoot.Payments

  @doc """
  Returns the list of payments.

  ## Examples

      iex> list_payments()
      [%Payments{}, ...]

  """
  def list_payments do
    Repo.all(Payments)
  end

  @doc """
  Gets a single payments.

  Raises `Ecto.NoResultsError` if the Payments does not exist.

  ## Examples

      iex> get_payments!(123)
      %Payments{}

      iex> get_payments!(456)
      ** (Ecto.NoResultsError)

  """
  def get_payments!(id), do: Repo.get!(Payments, id)

  @doc """
  Creates a payments.

  ## Examples

      iex> create_payments(%{field: value})
      {:ok, %Payments{}}

      iex> create_payments(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_payments(attrs \\ %{}) do
    %Payments{}
    |> Payments.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a payments.

  ## Examples

      iex> update_payments(payments, %{field: new_value})
      {:ok, %Payments{}}

      iex> update_payments(payments, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_payments(%Payments{} = payments, attrs) do
    payments
    |> Payments.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a payments.

  ## Examples

      iex> delete_payments(payments)
      {:ok, %Payments{}}

      iex> delete_payments(payments)
      {:error, %Ecto.Changeset{}}

  """
  def delete_payments(%Payments{} = payments) do
    Repo.delete(payments)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking payments changes.

  ## Examples

      iex> change_payments(payments)
      %Ecto.Changeset{data: %Payments{}}

  """
  def change_payments(%Payments{} = payments, attrs \\ %{}) do
    Payments.changeset(payments, attrs)
  end
end
