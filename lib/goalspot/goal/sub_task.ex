defmodule Goalspot.Goal.SubTask do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subtasks" do
    field :description, :string
    field :done, :boolean, default: false
    field :name, :string
    field :reminder, :date
    belongs_to :task, Goalspot.Goal.Task

    timestamps()
  end

  @doc false
  def changeset(sub_task, attrs) do
    sub_task
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
