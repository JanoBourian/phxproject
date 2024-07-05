defmodule BookstoreWeb.AuthorController do
  use BookstoreWeb, :controller

  alias Bookstore.Catalog
  alias Bookstore.Catalog.Author

  action_fallback BookstoreWeb.FallbackController

  def index(conn, _params) do
    authors = Catalog.list_authors()
    render(conn, :index, authors: authors)
  end

  def create(conn, %{"author" => author_params}) do
    with {:ok, %Author{} = author} <- Catalog.create_author(author_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/authors/#{author}")
      |> render(:show, author: author)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Catalog.get_author!(id)
    render(conn, :show, author: author)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Catalog.get_author!(id)

    with {:ok, %Author{} = author} <- Catalog.update_author(author, author_params) do
      render(conn, :show, author: author)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Catalog.get_author!(id)

    with {:ok, %Author{}} <- Catalog.delete_author(author) do
      send_resp(conn, :no_content, "")
    end
  end
end
