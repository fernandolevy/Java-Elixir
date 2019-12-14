defmodule ApiJavaElixir.Directory do
  @moduledoc """
  The Directory context.
  """

  import Ecto.Query, warn: false
  alias ApiJavaElixir.Repo

  alias ApiJavaElixir.Directory.Curriculos

  @doc """
  Returns the list of curriculos.

  ## Examples

      iex> list_curriculos()
      [%Curriculos{}, ...]

  """
  def list_curriculos do
    Repo.all(Curriculos)
  end

  @doc """
  Gets a single curriculos.

  Raises `Ecto.NoResultsError` if the Curriculos does not exist.

  ## Examples

      iex> get_curriculos!(123)
      %Curriculos{}

      iex> get_curriculos!(456)
      ** (Ecto.NoResultsError)

  """
  def get_curriculos!(id), do: Repo.get!(Curriculos, id)

  @doc """
  Creates a curriculos.

  ## Examples

      iex> create_curriculos(%{field: value})
      {:ok, %Curriculos{}}

      iex> create_curriculos(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_curriculos(attrs \\ %{}) do
    %Curriculos{}
    |> Curriculos.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a curriculos.

  ## Examples

      iex> update_curriculos(curriculos, %{field: new_value})
      {:ok, %Curriculos{}}

      iex> update_curriculos(curriculos, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_curriculos(%Curriculos{} = curriculos, attrs) do
    curriculos
    |> Curriculos.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Curriculos.

  ## Examples

      iex> delete_curriculos(curriculos)
      {:ok, %Curriculos{}}

      iex> delete_curriculos(curriculos)
      {:error, %Ecto.Changeset{}}

  """
  def delete_curriculos(%Curriculos{} = curriculos) do
    Repo.delete(curriculos)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking curriculos changes.

  ## Examples

      iex> change_curriculos(curriculos)
      %Ecto.Changeset{source: %Curriculos{}}

  """
  def change_curriculos(%Curriculos{} = curriculos) do
    Curriculos.changeset(curriculos, %{})
  end

  alias ApiJavaElixir.Directory.VagaDeEmprego

  @doc """
  Returns the list of vaga_de_emprego.

  ## Examples

      iex> list_vaga_de_emprego()
      [%VagaDeEmprego{}, ...]

  """
  def list_vaga_de_emprego do
    Repo.all(VagaDeEmprego)
  end

  @doc """
  Gets a single vaga_de_emprego.

  Raises `Ecto.NoResultsError` if the Vaga de emprego does not exist.

  ## Examples

      iex> get_vaga_de_emprego!(123)
      %VagaDeEmprego{}

      iex> get_vaga_de_emprego!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vaga_de_emprego!(id), do: Repo.get!(VagaDeEmprego, id)

  @doc """
  Creates a vaga_de_emprego.

  ## Examples

      iex> create_vaga_de_emprego(%{field: value})
      {:ok, %VagaDeEmprego{}}

      iex> create_vaga_de_emprego(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vaga_de_emprego(attrs \\ %{}) do
    %VagaDeEmprego{}
    |> VagaDeEmprego.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vaga_de_emprego.

  ## Examples

      iex> update_vaga_de_emprego(vaga_de_emprego, %{field: new_value})
      {:ok, %VagaDeEmprego{}}

      iex> update_vaga_de_emprego(vaga_de_emprego, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vaga_de_emprego(%VagaDeEmprego{} = vaga_de_emprego, attrs) do
    vaga_de_emprego
    |> VagaDeEmprego.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a VagaDeEmprego.

  ## Examples

      iex> delete_vaga_de_emprego(vaga_de_emprego)
      {:ok, %VagaDeEmprego{}}

      iex> delete_vaga_de_emprego(vaga_de_emprego)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vaga_de_emprego(%VagaDeEmprego{} = vaga_de_emprego) do
    Repo.delete(vaga_de_emprego)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vaga_de_emprego changes.

  ## Examples

      iex> change_vaga_de_emprego(vaga_de_emprego)
      %Ecto.Changeset{source: %VagaDeEmprego{}}

  """
  def change_vaga_de_emprego(%VagaDeEmprego{} = vaga_de_emprego) do
    VagaDeEmprego.changeset(vaga_de_emprego, %{})
  end
end
