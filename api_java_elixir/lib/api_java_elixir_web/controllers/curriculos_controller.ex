defmodule ApiJavaElixirWeb.CurriculosController do
  use ApiJavaElixirWeb, :controller

  alias ApiJavaElixir.Directory
  alias ApiJavaElixir.Directory.Curriculos

  action_fallback ApiJavaElixirWeb.FallbackController

  def index(conn, _params) do
    curriculos = Directory.list_curriculos()
    render(conn, "index.json", curriculos: curriculos)
  end

  def create(conn, %{"curriculos" => curriculos_params}) do
    with {:ok, %Curriculos{} = curriculos} <- Directory.create_curriculos(curriculos_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.curriculos_path(conn, :show, curriculos))
      |> render("show.json", curriculos: curriculos)
    end
  end

  def show(conn, %{"id" => id}) do
    curriculos = Directory.get_curriculos!(id)
    render(conn, "show.json", curriculos: curriculos)
  end

  def update(conn, %{"id" => id, "curriculos" => curriculos_params}) do
    curriculos = Directory.get_curriculos!(id)

    with {:ok, %Curriculos{} = curriculos} <- Directory.update_curriculos(curriculos, curriculos_params) do
      render(conn, "show.json", curriculos: curriculos)
    end
  end

  def delete(conn, %{"id" => id}) do
    curriculos = Directory.get_curriculos!(id)

    with {:ok, %Curriculos{}} <- Directory.delete_curriculos(curriculos) do
      send_resp(conn, :no_content, "")
    end
  end
end
