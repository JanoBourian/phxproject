defmodule Bookstore.Repo.Migrations.PivotTables do
  use Ecto.Migration

  def change do
    create table(:books_authors, primary_key: false) do
      add :book_id, references(:books, on_delete: :delete_all, type: :binary_id), source: :id, null: false
      add :author_id, references(:authors, on_delete: :delete_all, type: :binary_id), source: :id, null: false
    end

    create unique_index(:books_authors, [:book_id, :author_id])

    create table(:books_categories, primary_key: false) do
      add :book_id, references(:books, on_delete: :delete_all, type: :binary_id), source: :id, null: false
      add :category_id, references(:categories, on_delete: :delete_all, type: :binary_id), source: :id, null: false
    end

    create unique_index(:books_categories, [:book_id, :category_id])

  end
end
