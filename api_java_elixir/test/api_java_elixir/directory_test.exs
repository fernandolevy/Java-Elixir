defmodule ApiJavaElixir.DirectoryTest do
  use ApiJavaElixir.DataCase

  alias ApiJavaElixir.Directory

  describe "curriculos" do
    alias ApiJavaElixir.Directory.Curriculos

    @valid_attrs %{description: "some description", name: "some name", tag: "some tag"}
    @update_attrs %{description: "some updated description", name: "some updated name", tag: "some updated tag"}
    @invalid_attrs %{description: nil, name: nil, tag: nil}

    def curriculos_fixture(attrs \\ %{}) do
      {:ok, curriculos} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_curriculos()

      curriculos
    end

    test "list_curriculos/0 returns all curriculos" do
      curriculos = curriculos_fixture()
      assert Directory.list_curriculos() == [curriculos]
    end

    test "get_curriculos!/1 returns the curriculos with given id" do
      curriculos = curriculos_fixture()
      assert Directory.get_curriculos!(curriculos.id) == curriculos
    end

    test "create_curriculos/1 with valid data creates a curriculos" do
      assert {:ok, %Curriculos{} = curriculos} = Directory.create_curriculos(@valid_attrs)
      assert curriculos.description == "some description"
      assert curriculos.name == "some name"
      assert curriculos.tag == "some tag"
    end

    test "create_curriculos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_curriculos(@invalid_attrs)
    end

    test "update_curriculos/2 with valid data updates the curriculos" do
      curriculos = curriculos_fixture()
      assert {:ok, %Curriculos{} = curriculos} = Directory.update_curriculos(curriculos, @update_attrs)
      assert curriculos.description == "some updated description"
      assert curriculos.name == "some updated name"
      assert curriculos.tag == "some updated tag"
    end

    test "update_curriculos/2 with invalid data returns error changeset" do
      curriculos = curriculos_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_curriculos(curriculos, @invalid_attrs)
      assert curriculos == Directory.get_curriculos!(curriculos.id)
    end

    test "delete_curriculos/1 deletes the curriculos" do
      curriculos = curriculos_fixture()
      assert {:ok, %Curriculos{}} = Directory.delete_curriculos(curriculos)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_curriculos!(curriculos.id) end
    end

    test "change_curriculos/1 returns a curriculos changeset" do
      curriculos = curriculos_fixture()
      assert %Ecto.Changeset{} = Directory.change_curriculos(curriculos)
    end
  end

  describe "curriculos" do
    alias ApiJavaElixir.Directory.Curriculos

    @valid_attrs %{area_de_interesse: "some area_de_interesse", carga_horaria: "some carga_horaria", contato_candidato: "some contato_candidato", cpf: "some cpf", nome_candidato: "some nome_candidato", salario_pretendido: "some salario_pretendido"}
    @update_attrs %{area_de_interesse: "some updated area_de_interesse", carga_horaria: "some updated carga_horaria", contato_candidato: "some updated contato_candidato", cpf: "some updated cpf", nome_candidato: "some updated nome_candidato", salario_pretendido: "some updated salario_pretendido"}
    @invalid_attrs %{area_de_interesse: nil, carga_horaria: nil, contato_candidato: nil, cpf: nil, nome_candidato: nil, salario_pretendido: nil}

    def curriculos_fixture(attrs \\ %{}) do
      {:ok, curriculos} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_curriculos()

      curriculos
    end

    test "list_curriculos/0 returns all curriculos" do
      curriculos = curriculos_fixture()
      assert Directory.list_curriculos() == [curriculos]
    end

    test "get_curriculos!/1 returns the curriculos with given id" do
      curriculos = curriculos_fixture()
      assert Directory.get_curriculos!(curriculos.id) == curriculos
    end

    test "create_curriculos/1 with valid data creates a curriculos" do
      assert {:ok, %Curriculos{} = curriculos} = Directory.create_curriculos(@valid_attrs)
      assert curriculos.area_de_interesse == "some area_de_interesse"
      assert curriculos.carga_horaria == "some carga_horaria"
      assert curriculos.contato_candidato == "some contato_candidato"
      assert curriculos.cpf == "some cpf"
      assert curriculos.nome_candidato == "some nome_candidato"
      assert curriculos.salario_pretendido == "some salario_pretendido"
    end

    test "create_curriculos/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_curriculos(@invalid_attrs)
    end

    test "update_curriculos/2 with valid data updates the curriculos" do
      curriculos = curriculos_fixture()
      assert {:ok, %Curriculos{} = curriculos} = Directory.update_curriculos(curriculos, @update_attrs)
      assert curriculos.area_de_interesse == "some updated area_de_interesse"
      assert curriculos.carga_horaria == "some updated carga_horaria"
      assert curriculos.contato_candidato == "some updated contato_candidato"
      assert curriculos.cpf == "some updated cpf"
      assert curriculos.nome_candidato == "some updated nome_candidato"
      assert curriculos.salario_pretendido == "some updated salario_pretendido"
    end

    test "update_curriculos/2 with invalid data returns error changeset" do
      curriculos = curriculos_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_curriculos(curriculos, @invalid_attrs)
      assert curriculos == Directory.get_curriculos!(curriculos.id)
    end

    test "delete_curriculos/1 deletes the curriculos" do
      curriculos = curriculos_fixture()
      assert {:ok, %Curriculos{}} = Directory.delete_curriculos(curriculos)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_curriculos!(curriculos.id) end
    end

    test "change_curriculos/1 returns a curriculos changeset" do
      curriculos = curriculos_fixture()
      assert %Ecto.Changeset{} = Directory.change_curriculos(curriculos)
    end
  end

  describe "vaga_de_emprego" do
    alias ApiJavaElixir.Directory.VagaDeEmprego

    @valid_attrs %{area_da_vaga: "some area_da_vaga", carga_horaria: "some carga_horaria", cnpj: "some cnpj", contato_candidato: "some contato_candidato", contato_empresa: "some contato_empresa", nome_empresa: "some nome_empresa", salario_pago: "some salario_pago"}
    @update_attrs %{area_da_vaga: "some updated area_da_vaga", carga_horaria: "some updated carga_horaria", cnpj: "some updated cnpj", contato_candidato: "some updated contato_candidato", contato_empresa: "some updated contato_empresa", nome_empresa: "some updated nome_empresa", salario_pago: "some updated salario_pago"}
    @invalid_attrs %{area_da_vaga: nil, carga_horaria: nil, cnpj: nil, contato_candidato: nil, contato_empresa: nil, nome_empresa: nil, salario_pago: nil}

    def vaga_de_emprego_fixture(attrs \\ %{}) do
      {:ok, vaga_de_emprego} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_vaga_de_emprego()

      vaga_de_emprego
    end

    test "list_vaga_de_emprego/0 returns all vaga_de_emprego" do
      vaga_de_emprego = vaga_de_emprego_fixture()
      assert Directory.list_vaga_de_emprego() == [vaga_de_emprego]
    end

    test "get_vaga_de_emprego!/1 returns the vaga_de_emprego with given id" do
      vaga_de_emprego = vaga_de_emprego_fixture()
      assert Directory.get_vaga_de_emprego!(vaga_de_emprego.id) == vaga_de_emprego
    end

    test "create_vaga_de_emprego/1 with valid data creates a vaga_de_emprego" do
      assert {:ok, %VagaDeEmprego{} = vaga_de_emprego} = Directory.create_vaga_de_emprego(@valid_attrs)
      assert vaga_de_emprego.area_da_vaga == "some area_da_vaga"
      assert vaga_de_emprego.carga_horaria == "some carga_horaria"
      assert vaga_de_emprego.cnpj == "some cnpj"
      assert vaga_de_emprego.contato_candidato == "some contato_candidato"
      assert vaga_de_emprego.contato_empresa == "some contato_empresa"
      assert vaga_de_emprego.nome_empresa == "some nome_empresa"
      assert vaga_de_emprego.salario_pago == "some salario_pago"
    end

    test "create_vaga_de_emprego/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_vaga_de_emprego(@invalid_attrs)
    end

    test "update_vaga_de_emprego/2 with valid data updates the vaga_de_emprego" do
      vaga_de_emprego = vaga_de_emprego_fixture()
      assert {:ok, %VagaDeEmprego{} = vaga_de_emprego} = Directory.update_vaga_de_emprego(vaga_de_emprego, @update_attrs)
      assert vaga_de_emprego.area_da_vaga == "some updated area_da_vaga"
      assert vaga_de_emprego.carga_horaria == "some updated carga_horaria"
      assert vaga_de_emprego.cnpj == "some updated cnpj"
      assert vaga_de_emprego.contato_candidato == "some updated contato_candidato"
      assert vaga_de_emprego.contato_empresa == "some updated contato_empresa"
      assert vaga_de_emprego.nome_empresa == "some updated nome_empresa"
      assert vaga_de_emprego.salario_pago == "some updated salario_pago"
    end

    test "update_vaga_de_emprego/2 with invalid data returns error changeset" do
      vaga_de_emprego = vaga_de_emprego_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_vaga_de_emprego(vaga_de_emprego, @invalid_attrs)
      assert vaga_de_emprego == Directory.get_vaga_de_emprego!(vaga_de_emprego.id)
    end

    test "delete_vaga_de_emprego/1 deletes the vaga_de_emprego" do
      vaga_de_emprego = vaga_de_emprego_fixture()
      assert {:ok, %VagaDeEmprego{}} = Directory.delete_vaga_de_emprego(vaga_de_emprego)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_vaga_de_emprego!(vaga_de_emprego.id) end
    end

    test "change_vaga_de_emprego/1 returns a vaga_de_emprego changeset" do
      vaga_de_emprego = vaga_de_emprego_fixture()
      assert %Ecto.Changeset{} = Directory.change_vaga_de_emprego(vaga_de_emprego)
    end
  end
end
