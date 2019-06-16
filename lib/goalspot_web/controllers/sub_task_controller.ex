defmodule GoalspotWeb.SubTaskController  do
  use GoalspotWeb, :controller

  alias Goalspot.Goal

  def create(conn, %{"task_id" => task_id, "sub_task" => sub_task_params}) do
    IO.puts("THus is a task")
    IO.inspect(sub_task_params)
    task = Goal.get_task!(task_id)

    case Goal.create_sub_task(task, sub_task_params) do
      {:ok, _sub_task} ->
        conn
        |> put_flash(:info, "Sub Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Issue creating sub task.")
        |> redirect(to: Routes.task_path(conn, :show, task))
    end
  end

end
