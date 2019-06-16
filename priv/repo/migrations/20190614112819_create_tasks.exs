defmodule Goalspot.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :done, :boolean, default: false, null: false
      add :reminder_at, :date

      timestamps()
    end

  end
end
