defmodule Portal.Links do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "links" do
    field :url, :string
    field :key, :string, primary_key: true

    timestamps
  end

  @docs false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:key, :url])
    |> validate_required([:key, :url])
  end
end
