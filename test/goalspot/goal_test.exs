defmodule Goalspot.GoalTest do
  use Goalspot.DataCase

  alias Goalspot.Goal

  describe "tasks" do
    alias Goalspot.Goal.Task

    @valid_attrs %{description: "some description", done: true, name: "some name", reminder_at: ~D[2010-04-17]}
    @update_attrs %{description: "some updated description", done: false, name: "some updated name", reminder_at: ~D[2011-05-18]}
    @invalid_attrs %{description: nil, done: nil, name: nil, reminder_at: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Goal.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Goal.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Goal.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Goal.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.done == true
      assert task.name == "some name"
      assert task.reminder_at == ~D[2010-04-17]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Goal.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Goal.update_task(task, @update_attrs)
      assert task.description == "some updated description"
      assert task.done == false
      assert task.name == "some updated name"
      assert task.reminder_at == ~D[2011-05-18]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Goal.update_task(task, @invalid_attrs)
      assert task == Goal.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Goal.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Goal.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Goal.change_task(task)
    end
  end

  describe "subtasks" do
    alias Goalspot.Goal.SubTask

    @valid_attrs %{description: "some description", done: true, name: "some name", reminder: ~D[2010-04-17]}
    @update_attrs %{description: "some updated description", done: false, name: "some updated name", reminder: ~D[2011-05-18]}
    @invalid_attrs %{description: nil, done: nil, name: nil, reminder: nil}

    def sub_task_fixture(attrs \\ %{}) do
      {:ok, sub_task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Goal.create_sub_task()

      sub_task
    end

    test "list_subtasks/0 returns all subtasks" do
      sub_task = sub_task_fixture()
      assert Goal.list_subtasks() == [sub_task]
    end

    test "get_sub_task!/1 returns the sub_task with given id" do
      sub_task = sub_task_fixture()
      assert Goal.get_sub_task!(sub_task.id) == sub_task
    end

    test "create_sub_task/1 with valid data creates a sub_task" do
      assert {:ok, %SubTask{} = sub_task} = Goal.create_sub_task(@valid_attrs)
      assert sub_task.description == "some description"
      assert sub_task.done == true
      assert sub_task.name == "some name"
      assert sub_task.reminder == ~D[2010-04-17]
    end

    test "create_sub_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Goal.create_sub_task(@invalid_attrs)
    end

    test "update_sub_task/2 with valid data updates the sub_task" do
      sub_task = sub_task_fixture()
      assert {:ok, %SubTask{} = sub_task} = Goal.update_sub_task(sub_task, @update_attrs)
      assert sub_task.description == "some updated description"
      assert sub_task.done == false
      assert sub_task.name == "some updated name"
      assert sub_task.reminder == ~D[2011-05-18]
    end

    test "update_sub_task/2 with invalid data returns error changeset" do
      sub_task = sub_task_fixture()
      assert {:error, %Ecto.Changeset{}} = Goal.update_sub_task(sub_task, @invalid_attrs)
      assert sub_task == Goal.get_sub_task!(sub_task.id)
    end

    test "delete_sub_task/1 deletes the sub_task" do
      sub_task = sub_task_fixture()
      assert {:ok, %SubTask{}} = Goal.delete_sub_task(sub_task)
      assert_raise Ecto.NoResultsError, fn -> Goal.get_sub_task!(sub_task.id) end
    end

    test "change_sub_task/1 returns a sub_task changeset" do
      sub_task = sub_task_fixture()
      assert %Ecto.Changeset{} = Goal.change_sub_task(sub_task)
    end
  end
end
