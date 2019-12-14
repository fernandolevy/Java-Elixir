defmodule ApiJavaElixir.Repo.Migrations.CreateCurriculos do
  use Ecto.Migration

  def change do
    create table(:curriculos) do
      add :area_de_interesse, :string
      add :carga_horaria, :string
      add :salario_pretendido, :text
      add :contato_candidato, :string
      add :nome_candidato, :string
      add :cpf, :string

      timestamps()
    end

  end
end
