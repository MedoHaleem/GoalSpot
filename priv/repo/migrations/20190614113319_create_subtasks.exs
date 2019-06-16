defmodule Goalspot.Repo.Migrations.CreateSubtasks do
  use Ecto.Migration

  def change do
    create table(:subtasks) do
      add :name, :string
      add :description, :string
      add :done, :boolean, default: false, null: false
      add :reminder, :date
      add :task_id, references(:tasks, on_delete: :delete_all)

      timestamps()
    end

    create index(:subtasks, [:task_id])
  end
end
