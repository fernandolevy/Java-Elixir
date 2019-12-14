defmodule ApiJavaElixirWeb.CurriculosView do
  use ApiJavaElixirWeb, :view
  alias ApiJavaElixirWeb.CurriculosView

  def render("index.json", %{curriculos: curriculos}) do
    %{data: render_many(curriculos, CurriculosView, "curriculos.json")}
  end

  def render("show.json", %{curriculos: curriculos}) do
    %{data: render_one(curriculos, CurriculosView, "curriculos.json")}
  end

  def render("curriculos.json", %{curriculos: curriculos}) do
    %{id: curriculos.id,
      area_de_interesse: curriculos.area_de_interesse,
      carga_horaria: curriculos.carga_horaria,
      salario_pretendido: curriculos.salario_pretendido,
      contato_candidato: curriculos.contato_candidato,
      nome_candidato: curriculos.nome_candidato,
      cpf: curriculos.cpf}
  end
end
