defmodule BookstoreWeb.BookJSON do
  alias Bookstore.Catalog.{Author, Book, Category}
  import Bookstore.Catalog

  @doc """
  Renders a list of books.
  """
  def index(%{books: books}) do
    %{data: for(book <- books, do: data(book))}
  end

  @doc """
  Renders a single book.
  """
  def show(%{book: book}) do
    %{data: data(book)}
  end

  defp data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      authors: Enum.map(book.authors, fn(a) -> BookstoreWeb.AuthorJSON.data(get_author!(a.id)) end),
      categories: Enum.map(book.categories, fn(c) -> BookstoreWeb.CategoryJSON.data(get_category!(c.id)) end)
    }
  end
end
