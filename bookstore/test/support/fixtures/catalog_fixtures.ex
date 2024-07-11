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

  @doc """
  Generate a unique category name.
  """
  def unique_category_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: unique_category_name()
      })
      |> Bookstore.Catalog.create_category()

    category
  end

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Bookstore.Catalog.create_book()

    book
  end
end
