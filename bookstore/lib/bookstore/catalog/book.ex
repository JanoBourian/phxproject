defmodule Bookstore.Catalog.Book do
  alias Bookstore.Catalog.{Author, Category}
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :title, :string

    many_to_many :authors, Author, join_through: "books_authors", on_replace: :delete
    many_to_many :categories, Category, join_through: "books_categories", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> validate_length(:title, min: 1)
    |> unique_constraint(:title)
  end
end
