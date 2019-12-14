defmodule ApiJavaElixir.Directory.Curriculos do
  use Ecto.Schema
  import Ecto.Changeset

  schema "curriculos" do
    field :area_de_interesse, :string
    field :carga_horaria, :string
    field :contato_candidato, :string
    field :cpf, :string
    field :nome_candidato, :string
    field :salario_pretendido, :string

    timestamps()
  end

  @doc false
  def changeset(curriculos, attrs) do
    curriculos
    |> cast(attrs, [:area_de_interesse, :carga_horaria, :salario_pretendido, :contato_candidato, :nome_candidato, :cpf])
    |> validate_required([:area_de_interesse, :carga_horaria, :salario_pretendido, :contato_candidato, :nome_candidato, :cpf])
  end
end
