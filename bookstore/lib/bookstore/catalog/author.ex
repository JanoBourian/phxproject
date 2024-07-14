defmodule Bookstore.Catalog.Author do
  alias Bookstore.Catalog.Book
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "authors" do
    field :name, :string

    many_to_many :books, Book, join_through: "books_authors", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 5)
    |> unique_constraint(:name)
  end
end
