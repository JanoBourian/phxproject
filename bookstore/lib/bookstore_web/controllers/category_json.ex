defmodule BookstoreWeb.CategoryJSON do
  alias Bookstore.Catalog.Category

  @doc """
  Renders a list of categories.
  """
  def index(%{categories: categories}) do
    %{data: for(category <- categories, do: data(category))}
  end

  @doc """
  Renders a single category.
  """
  def show(%{category: category}) do
    %{data: data(category)}
  end

  def data(%Category{} = category) do
    %{
      id: category.id,
      name: category.name
    }
  end
end
