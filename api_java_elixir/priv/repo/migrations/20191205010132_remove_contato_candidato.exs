defmodule ApiJavaElixir.Repo.Migrations.RemoveContatoCandidato do
  use Ecto.Migration

  def change do
    alter table(:vaga_de_emprego) do
      remove :contato_candidato
    end
  end
end
