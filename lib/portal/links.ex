defmodule Portal.Links do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key { :key, :string, []}
  schema "links" do
    field :url, :string

    timestamps
  end

  @docs false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:key, :url])
    |> validate_required([:key, :url])
  end
end
