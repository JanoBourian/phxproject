defmodule Bookstore.Catalog.Category do
  alias Bookstre.Category.Book
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :name, :string

    many_to_many :books, Books, join_through: "books_categories", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 5)
    |> unique_constraint(:name)
  end
end
