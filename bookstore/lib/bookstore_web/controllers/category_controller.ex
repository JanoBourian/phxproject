defmodule BookstoreWeb.CategoryController do
  use BookstoreWeb, :controller

  alias Bookstore.Catalog
  alias Bookstore.Catalog.Category

  action_fallback BookstoreWeb.FallbackController

  def index(conn, _params) do
    categories = Catalog.list_categories()
    render(conn, :index, categories: categories)
  end

  def create(conn, %{"category" => category_params}) do
    with {:ok, %Category{} = category} <- Catalog.create_category(category_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/categories/#{category}")
      |> render(:show, category: category)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Catalog.get_category!(id)
    render(conn, :show, category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Catalog.get_category!(id)

    with {:ok, %Category{} = category} <- Catalog.update_category(category, category_params) do
      render(conn, :show, category: category)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Catalog.get_category!(id)

    with {:ok, %Category{}} <- Catalog.delete_category(category) do
      send_resp(conn, :no_content, "")
    end
  end
end
