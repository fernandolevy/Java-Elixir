defmodule ApiJavaElixirWeb.CurriculosControllerTest do
  use ApiJavaElixirWeb.ConnCase

  alias ApiJavaElixir.Directory
  alias ApiJavaElixir.Directory.Curriculos

  @create_attrs %{
    area_de_interesse: "some area_de_interesse",
    carga_horaria: "some carga_horaria",
    contato_candidato: "some contato_candidato",
    cpf: "some cpf",
    nome_candidato: "some nome_candidato",
    salario_pretendido: "some salario_pretendido"
  }
  @update_attrs %{
    area_de_interesse: "some updated area_de_interesse",
    carga_horaria: "some updated carga_horaria",
    contato_candidato: "some updated contato_candidato",
    cpf: "some updated cpf",
    nome_candidato: "some updated nome_candidato",
    salario_pretendido: "some updated salario_pretendido"
  }
  @invalid_attrs %{area_de_interesse: nil, carga_horaria: nil, contato_candidato: nil, cpf: nil, nome_candidato: nil, salario_pretendido: nil}

  def fixture(:curriculos) do
    {:ok, curriculos} = Directory.create_curriculos(@create_attrs)
    curriculos
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all curriculos", %{conn: conn} do
      conn = get(conn, Routes.curriculos_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create curriculos" do
    test "renders curriculos when data is valid", %{conn: conn} do
      conn = post(conn, Routes.curriculos_path(conn, :create), curriculos: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.curriculos_path(conn, :show, id))

      assert %{
               "id" => id,
               "area_de_interesse" => "some area_de_interesse",
               "carga_horaria" => "some carga_horaria",
               "contato_candidato" => "some contato_candidato",
               "cpf" => "some cpf",
               "nome_candidato" => "some nome_candidato",
               "salario_pretendido" => "some salario_pretendido"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.curriculos_path(conn, :create), curriculos: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update curriculos" do
    setup [:create_curriculos]

    test "renders curriculos when data is valid", %{conn: conn, curriculos: %Curriculos{id: id} = curriculos} do
      conn = put(conn, Routes.curriculos_path(conn, :update, curriculos), curriculos: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.curriculos_path(conn, :show, id))

      assert %{
               "id" => id,
               "area_de_interesse" => "some updated area_de_interesse",
               "carga_horaria" => "some updated carga_horaria",
               "contato_candidato" => "some updated contato_candidato",
               "cpf" => "some updated cpf",
               "nome_candidato" => "some updated nome_candidato",
               "salario_pretendido" => "some updated salario_pretendido"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, curriculos: curriculos} do
      conn = put(conn, Routes.curriculos_path(conn, :update, curriculos), curriculos: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete curriculos" do
    setup [:create_curriculos]

    test "deletes chosen curriculos", %{conn: conn, curriculos: curriculos} do
      conn = delete(conn, Routes.curriculos_path(conn, :delete, curriculos))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.curriculos_path(conn, :show, curriculos))
      end
    end
  end

  defp create_curriculos(_) do
    curriculos = fixture(:curriculos)
    {:ok, curriculos: curriculos}
  end
end
