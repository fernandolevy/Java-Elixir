defmodule ApiJavaElixir.Repo.Migrations.CreateVagaDeEmprego do
  use Ecto.Migration

  def change do
    create table(:vaga_de_emprego) do
      add :area_da_vaga, :string
      add :salario_pago, :string
      add :contato_empresa, :string
      add :contato_candidato, :string
      add :nome_empresa, :string
      add :cnpj, :string
      add :carga_horaria, :string

      timestamps()
    end

  end
end
