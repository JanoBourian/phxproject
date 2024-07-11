defmodule BookstoreWeb.BookController do
  use BookstoreWeb, :controller

  alias Bookstore.Catalog
  alias Bookstore.Catalog.Book

  action_fallback BookstoreWeb.FallbackController

  def index(conn, _params) do
    books = Catalog.list_books()
    render(conn, :index, books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Catalog.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/books/#{book}")
      |> render(:show, book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Catalog.get_book!(id)
    render(conn, :show, book: book)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Catalog.get_book!(id)

    with {:ok, %Book{} = book} <- Catalog.update_book(book, book_params) do
      render(conn, :show, book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Catalog.get_book!(id)

    with {:ok, %Book{}} <- Catalog.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end
