defmodule Portal.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: true) do
      add :key, :string, primary_key: true
      add :url, :string

      timestamps()
    end

    create unique_index(:links, [:key])
  end
end
