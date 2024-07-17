defmodule Bookstore.Repo.Migrations.PivotTables do
  use Ecto.Migration

  def change do
    create table(:books_authors, primary_key: false) do
      add :books_id, references(:books, on_delete: :delete_all, type: :binary_id), source: :id
      add :authors_id, references(:authors, on_delete: :delete_all, type: :binary_id), source: :id
      timestamps(type: :utc_datetime)
    end

    create index(:books_authors, :books_id)
    create index(:books_authors, :authors_id)

    create table(:books_categories, primary_key: false) do
      add :books_id, references(:books, on_delete: :delete_all, type: :binary_id), source: :id

      add :categories_id, references(:categories, on_delete: :delete_all, type: :binary_id),
        source: :id

      timestamps(type: :utc_datetime)
    end

    create index(:books_categories, [:books_id])
    create index(:books_categories, [:categories_id])
  end
end
