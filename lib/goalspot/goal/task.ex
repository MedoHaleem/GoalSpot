defmodule Goalspot.Goal.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :done, :boolean, default: false
    field :name, :string
    field :reminder_at, :date
    has_many :subtasks, Goalspot.Goal.SubTask

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :description, :done, :reminder_at])
    |> validate_required([:name, :description, :done, :reminder_at])
  end
end
