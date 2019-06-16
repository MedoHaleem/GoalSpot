defmodule GoalspotWeb.TaskController do
  use GoalspotWeb, :controller

  alias Goalspot.Goal
  alias Goalspot.Goal.{Task, SubTask}

  def index(conn, _params) do
    tasks = Goal.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Goal.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Goal.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Goal.get_task!(id)
    subtask_changeset  = Goal.change_sub_task(%SubTask{})
    render(conn, "show.html", task: task, subtask_changeset: subtask_changeset)
  end

  def edit(conn, %{"id" => id}) do
    task = Goal.get_task!(id)
    changeset = Goal.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Goal.get_task!(id)

    case Goal.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Goal.get_task!(id)
    {:ok, _task} = Goal.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
