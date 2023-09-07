defmodule Clp.BoardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Clp.Board` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Clp.Board.create_task()

    task
  end
end
