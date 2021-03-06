defmodule Goalspot.Goal do
  @moduledoc """
  The Goal context.
  """

  import Ecto.Query, warn: false
  alias Goalspot.Repo

  alias Goalspot.Goal.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id) |> Repo.preload(:subtasks)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end

  alias Goalspot.Goal.SubTask

  @doc """
  Returns the list of subtasks.

  ## Examples

      iex> list_subtasks()
      [%SubTask{}, ...]

  """
  def list_subtasks do
    Repo.all(SubTask)
  end

  @doc """
  Gets a single sub_task.

  Raises `Ecto.NoResultsError` if the Sub task does not exist.

  ## Examples

      iex> get_sub_task!(123)
      %SubTask{}

      iex> get_sub_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sub_task!(id), do: Repo.get!(SubTask, id)

  @doc """
  Creates a sub_task.

  ## Examples

      iex> create_sub_task(%{field: value})
      {:ok, %SubTask{}}

      iex> create_sub_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

    def create_sub_task(%Task{} = task ,attrs \\ %{}) do
    task
    |> Ecto.build_assoc(:subtasks)
    |> SubTask.changeset(attrs)
    |> Repo.insert()
    end

  @doc """
  Updates a sub_task.

  ## Examples

      iex> update_sub_task(sub_task, %{field: new_value})
      {:ok, %SubTask{}}

      iex> update_sub_task(sub_task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sub_task(%SubTask{} = sub_task, attrs) do
    sub_task
    |> SubTask.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SubTask.

  ## Examples

      iex> delete_sub_task(sub_task)
      {:ok, %SubTask{}}

      iex> delete_sub_task(sub_task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sub_task(%SubTask{} = sub_task) do
    Repo.delete(sub_task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sub_task changes.

  ## Examples

      iex> change_sub_task(sub_task)
      %Ecto.Changeset{source: %SubTask{}}

  """
  def change_sub_task(%SubTask{} = sub_task) do
    SubTask.changeset(sub_task, %{})
  end
end
