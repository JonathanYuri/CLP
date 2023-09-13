defmodule Clp.Payments do
  @moduledoc """
  The Payments context.
  """

  import Ecto.Query, warn: false
  alias Clp.Repo

  alias Clp.Payments.PaymentStatus

  @doc """
  Returns the list of payment_statuses.

  ## Examples

      iex> list_payment_statuses()
      [%PaymentStatus{}, ...]

  """
  def list_payment_statuses do
    Repo.all(PaymentStatus)
  end

  @doc """
  Gets a single payment_status.

  Raises `Ecto.NoResultsError` if the Payment status does not exist.

  ## Examples

      iex> get_payment_status!(123)
      %PaymentStatus{}

      iex> get_payment_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_payment_status!(id), do: Repo.get!(PaymentStatus, id)

  @doc """
  Creates a payment_status.

  ## Examples

      iex> create_payment_status(%{field: value})
      {:ok, %PaymentStatus{}}

      iex> create_payment_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_payment_status(attrs \\ %{}) do
    %PaymentStatus{}
    |> PaymentStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a payment_status.

  ## Examples

      iex> update_payment_status(payment_status, %{field: new_value})
      {:ok, %PaymentStatus{}}

      iex> update_payment_status(payment_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_payment_status(%PaymentStatus{} = payment_status, attrs) do
    payment_status
    |> PaymentStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a payment_status.

  ## Examples

      iex> delete_payment_status(payment_status)
      {:ok, %PaymentStatus{}}

      iex> delete_payment_status(payment_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_payment_status(%PaymentStatus{} = payment_status) do
    Repo.delete(payment_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking payment_status changes.

  ## Examples

      iex> change_payment_status(payment_status)
      %Ecto.Changeset{data: %PaymentStatus{}}

  """
  def change_payment_status(%PaymentStatus{} = payment_status, attrs \\ %{}) do
    PaymentStatus.changeset(payment_status, attrs)
  end
end
