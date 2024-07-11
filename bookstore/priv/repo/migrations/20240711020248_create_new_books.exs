defmodule Bookstore.Repo.Migrations.FixBooksTable do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:books, [:title])
  end

end
