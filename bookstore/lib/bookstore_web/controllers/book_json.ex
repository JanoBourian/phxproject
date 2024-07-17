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
      authors: BookstoreWeb.AuthorJSON.index(%{authors: book.authors}),
      categories: BookstoreWeb.CategoryJSON.index(%{categories: book.categories})
    }
  end
end
