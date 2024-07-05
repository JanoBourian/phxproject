defmodule Bookstore.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookstore.Catalog` context.
  """

  @doc """
  Generate a unique author name.
  """
  def unique_author_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        name: unique_author_name()
      })
      |> Bookstore.Catalog.create_author()

    author
  end
end
