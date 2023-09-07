defmodule ClpWeb.TaskController do
  use ClpWeb, :controller

  alias Clp.Board
  alias Clp.Board.Task

  action_fallback ClpWeb.FallbackController

  def index(conn, _params) do
    tasks = Board.list_tasks()
    render(conn, :index, tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Board.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tasks/#{task}")
      |> render(:show, task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Board.get_task!(id)
    render(conn, :show, task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Board.get_task!(id)

    with {:ok, %Task{} = task} <- Board.update_task(task, task_params) do
      render(conn, :show, task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Board.get_task!(id)

    with {:ok, %Task{}} <- Board.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
