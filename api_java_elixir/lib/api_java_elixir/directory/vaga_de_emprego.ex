defmodule ApiJavaElixir.Directory.VagaDeEmprego do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vaga_de_emprego" do
    field :area_da_vaga, :string
    field :carga_horaria, :string
    field :cnpj, :string
    field :contato_empresa, :string
    field :nome_empresa, :string
    field :salario_pago, :string

    timestamps()
  end

  @doc false
  def changeset(vaga_de_emprego, attrs) do
    vaga_de_emprego
    |> cast(attrs, [:area_da_vaga, :salario_pago, :contato_empresa, :nome_empresa, :cnpj, :carga_horaria])
    |> validate_required([:area_da_vaga, :salario_pago, :contato_empresa, :nome_empresa, :cnpj, :carga_horaria])
  end
end
