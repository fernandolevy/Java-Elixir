defmodule ApiJavaElixirWeb.VagaDeEmpregoController do
  use ApiJavaElixirWeb, :controller

  alias ApiJavaElixir.Directory
  alias ApiJavaElixir.Directory.VagaDeEmprego

  action_fallback ApiJavaElixirWeb.FallbackController

  def index(conn, _params) do
    vaga_de_emprego = Directory.list_vaga_de_emprego()
    render(conn, "index.json", vaga_de_emprego: vaga_de_emprego)
  end

  def create(conn, %{"vaga_de_emprego" => vaga_de_emprego_params}) do
    with {:ok, %VagaDeEmprego{} = vaga_de_emprego} <- Directory.create_vaga_de_emprego(vaga_de_emprego_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.vaga_de_emprego_path(conn, :show, vaga_de_emprego))
      |> render("show.json", vaga_de_emprego: vaga_de_emprego)
    end
  end

  def show(conn, %{"id" => id}) do
    vaga_de_emprego = Directory.get_vaga_de_emprego!(id)
    render(conn, "show.json", vaga_de_emprego: vaga_de_emprego)
  end

  def update(conn, %{"id" => id, "vaga_de_emprego" => vaga_de_emprego_params}) do
    vaga_de_emprego = Directory.get_vaga_de_emprego!(id)

    with {:ok, %VagaDeEmprego{} = vaga_de_emprego} <- Directory.update_vaga_de_emprego(vaga_de_emprego, vaga_de_emprego_params) do
      render(conn, "show.json", vaga_de_emprego: vaga_de_emprego)
    end
  end

  def delete(conn, %{"id" => id}) do
    vaga_de_emprego = Directory.get_vaga_de_emprego!(id)

    with {:ok, %VagaDeEmprego{}} <- Directory.delete_vaga_de_emprego(vaga_de_emprego) do
      send_resp(conn, :no_content, "")
    end
  end
end
