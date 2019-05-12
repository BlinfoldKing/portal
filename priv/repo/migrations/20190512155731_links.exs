defmodule Portal.Repo.Migrations.Links do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :key, :string, primary_key: true
      add :url, :string
      timestamps()
    end
  end
end
