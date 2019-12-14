defmodule ApiJavaElixirWeb.VagaDeEmpregoControllerTest do
  use ApiJavaElixirWeb.ConnCase

  alias ApiJavaElixir.Directory
  alias ApiJavaElixir.Directory.VagaDeEmprego

  @create_attrs %{
    area_da_vaga: "some area_da_vaga",
    carga_horaria: "some carga_horaria",
    cnpj: "some cnpj",
    contato_candidato: "some contato_candidato",
    contato_empresa: "some contato_empresa",
    nome_empresa: "some nome_empresa",
    salario_pago: "some salario_pago"
  }
  @update_attrs %{
    area_da_vaga: "some updated area_da_vaga",
    carga_horaria: "some updated carga_horaria",
    cnpj: "some updated cnpj",
    contato_candidato: "some updated contato_candidato",
    contato_empresa: "some updated contato_empresa",
    nome_empresa: "some updated nome_empresa",
    salario_pago: "some updated salario_pago"
  }
  @invalid_attrs %{area_da_vaga: nil, carga_horaria: nil, cnpj: nil, contato_candidato: nil, contato_empresa: nil, nome_empresa: nil, salario_pago: nil}

  def fixture(:vaga_de_emprego) do
    {:ok, vaga_de_emprego} = Directory.create_vaga_de_emprego(@create_attrs)
    vaga_de_emprego
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vaga_de_emprego", %{conn: conn} do
      conn = get(conn, Routes.vaga_de_emprego_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vaga_de_emprego" do
    test "renders vaga_de_emprego when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vaga_de_emprego_path(conn, :create), vaga_de_emprego: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.vaga_de_emprego_path(conn, :show, id))

      assert %{
               "id" => id,
               "area_da_vaga" => "some area_da_vaga",
               "carga_horaria" => "some carga_horaria",
               "cnpj" => "some cnpj",
               "contato_candidato" => "some contato_candidato",
               "contato_empresa" => "some contato_empresa",
               "nome_empresa" => "some nome_empresa",
               "salario_pago" => "some salario_pago"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vaga_de_emprego_path(conn, :create), vaga_de_emprego: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vaga_de_emprego" do
    setup [:create_vaga_de_emprego]

    test "renders vaga_de_emprego when data is valid", %{conn: conn, vaga_de_emprego: %VagaDeEmprego{id: id} = vaga_de_emprego} do
      conn = put(conn, Routes.vaga_de_emprego_path(conn, :update, vaga_de_emprego), vaga_de_emprego: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.vaga_de_emprego_path(conn, :show, id))

      assert %{
               "id" => id,
               "area_da_vaga" => "some updated area_da_vaga",
               "carga_horaria" => "some updated carga_horaria",
               "cnpj" => "some updated cnpj",
               "contato_candidato" => "some updated contato_candidato",
               "contato_empresa" => "some updated contato_empresa",
               "nome_empresa" => "some updated nome_empresa",
               "salario_pago" => "some updated salario_pago"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vaga_de_emprego: vaga_de_emprego} do
      conn = put(conn, Routes.vaga_de_emprego_path(conn, :update, vaga_de_emprego), vaga_de_emprego: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vaga_de_emprego" do
    setup [:create_vaga_de_emprego]

    test "deletes chosen vaga_de_emprego", %{conn: conn, vaga_de_emprego: vaga_de_emprego} do
      conn = delete(conn, Routes.vaga_de_emprego_path(conn, :delete, vaga_de_emprego))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.vaga_de_emprego_path(conn, :show, vaga_de_emprego))
      end
    end
  end

  defp create_vaga_de_emprego(_) do
    vaga_de_emprego = fixture(:vaga_de_emprego)
    {:ok, vaga_de_emprego: vaga_de_emprego}
  end
end
