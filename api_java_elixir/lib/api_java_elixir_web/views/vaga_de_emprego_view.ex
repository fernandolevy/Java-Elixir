defmodule ApiJavaElixirWeb.VagaDeEmpregoView do
  use ApiJavaElixirWeb, :view
  alias ApiJavaElixirWeb.VagaDeEmpregoView

  def render("index.json", %{vaga_de_emprego: vaga_de_emprego}) do
    %{data: render_many(vaga_de_emprego, VagaDeEmpregoView, "vaga_de_emprego.json")}
  end

  def render("show.json", %{vaga_de_emprego: vaga_de_emprego}) do
    %{data: render_one(vaga_de_emprego, VagaDeEmpregoView, "vaga_de_emprego.json")}
  end

  def render("vaga_de_emprego.json", %{vaga_de_emprego: vaga_de_emprego}) do
    %{id: vaga_de_emprego.id,
      area_da_vaga: vaga_de_emprego.area_da_vaga,
      salario_pago: vaga_de_emprego.salario_pago,
      contato_empresa: vaga_de_emprego.contato_empresa,
      nome_empresa: vaga_de_emprego.nome_empresa,
      cnpj: vaga_de_emprego.cnpj,
      carga_horaria: vaga_de_emprego.carga_horaria}
  end
end
