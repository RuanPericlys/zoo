defmodule Zoo.Clinic do
  @moduledoc """
  The Clinic context.
  """

  import Ecto.Query, warn: false
  alias Zoo.Repo

  alias Zoo.Clinic.Prescricao

  @doc """
  Returns the list of prescricoes.

  ## Examples

      iex> list_prescricoes()
      [%Prescricao{}, ...]

  """
  def list_prescricoes do
    Repo.all(Prescricao)
  end

  @doc """
  Gets a single prescricao.

  Raises `Ecto.NoResultsError` if the Prescricao does not exist.

  ## Examples

      iex> get_prescricao!(123)
      %Prescricao{}

      iex> get_prescricao!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prescricao!(id), do: Repo.get!(Prescricao, id)

  @doc """
  Creates a prescricao.

  ## Examples

      iex> create_prescricao(%{field: value})
      {:ok, %Prescricao{}}

      iex> create_prescricao(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prescricao(attrs \\ %{}) do
    %Prescricao{}
    |> Prescricao.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prescricao.

  ## Examples

      iex> update_prescricao(prescricao, %{field: new_value})
      {:ok, %Prescricao{}}

      iex> update_prescricao(prescricao, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prescricao(%Prescricao{} = prescricao, attrs) do
    prescricao
    |> Prescricao.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Prescricao.

  ## Examples

      iex> delete_prescricao(prescricao)
      {:ok, %Prescricao{}}

      iex> delete_prescricao(prescricao)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prescricao(%Prescricao{} = prescricao) do
    Repo.delete(prescricao)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prescricao changes.

  ## Examples

      iex> change_prescricao(prescricao)
      %Ecto.Changeset{source: %Prescricao{}}

  """
  def change_prescricao(%Prescricao{} = prescricao) do
    Prescricao.changeset(prescricao, %{})
  end
  
  alias Zoo.Clinic.Animais

  @doc """
  Returns the list of animais.

  ## Examples

      iex> list_animais()
      [%Animais{}, ...]

  """
  def list_animais do
    Repo.all(Animais)
  end

  @doc """
  Gets a single animais.

  Raises `Ecto.NoResultsError` if the Animais does not exist.

  ## Examples

      iex> get_animais!(123)
      %Animais{}

      iex> get_animais!(456)
      ** (Ecto.NoResultsError)

  """
  def get_animais!(id), do: Repo.get!(Animais, id)

  @doc """
  Creates a animais.

  ## Examples

      iex> create_animais(%{field: value})
      {:ok, %Animais{}}

      iex> create_animais(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_animais(attrs \\ %{}) do
    %Animais{}
    |> Animais.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a animais.

  ## Examples

      iex> update_animais(animais, %{field: new_value})
      {:ok, %Animais{}}

      iex> update_animais(animais, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_animais(%Animais{} = animais, attrs) do
    animais
    |> Animais.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Animais.

  ## Examples

      iex> delete_animais(animais)
      {:ok, %Animais{}}

      iex> delete_animais(animais)
      {:error, %Ecto.Changeset{}}

  """
  def delete_animais(%Animais{} = animais) do
    Repo.delete(animais)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking animais changes.

  ## Examples

      iex> change_animais(animais)
      %Ecto.Changeset{source: %Animais{}}

  """
  def change_animais(%Animais{} = animais) do
    Animais.changeset(animais, %{})
  end

  alias Zoo.Clinic.Consultas

  @doc """
  Returns the list of consultas.

  ## Examples

      iex> list_consultas()
      [%Consultas{}, ...]

  """
  def list_consultas do
    Repo.all(Consultas)
  end

  @doc """
  Gets a single consultas.

  Raises `Ecto.NoResultsError` if the Consultas does not exist.

  ## Examples

      iex> get_consultas!(123)
      %Consultas{}

      iex> get_consultas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consultas!(id), do: Repo.get!(Consultas, id)

  @doc """
  Creates a consultas.

  ## Examples

      iex> create_consultas(%{field: value})
      {:ok, %Consultas{}}

      iex> create_consultas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consultas(attrs \\ %{}) do
    %Consultas{}
    |> Consultas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consultas.

  ## Examples

      iex> update_consultas(consultas, %{field: new_value})
      {:ok, %Consultas{}}

      iex> update_consultas(consultas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consultas(%Consultas{} = consultas, attrs) do
    consultas
    |> Consultas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Consultas.

  ## Examples

      iex> delete_consultas(consultas)
      {:ok, %Consultas{}}

      iex> delete_consultas(consultas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consultas(%Consultas{} = consultas) do
    Repo.delete(consultas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consultas changes.

  ## Examples

      iex> change_consultas(consultas)
      %Ecto.Changeset{source: %Consultas{}}

  """
  def change_consultas(%Consultas{} = consultas) do
    Consultas.changeset(consultas, %{})
  end

  alias Zoo.Clinic.Especie

  @doc """
  Returns the list of especies.

  ## Examples

      iex> list_especies()
      [%Especie{}, ...]

  """
  def list_especies do
    Repo.all(Especie)
  end

  @doc """
  Gets a single especie.

  Raises `Ecto.NoResultsError` if the Especie does not exist.

  ## Examples

      iex> get_especie!(123)
      %Especie{}

      iex> get_especie!(456)
      ** (Ecto.NoResultsError)

  """
  def get_especie!(id), do: Repo.get!(Especie, id)

  @doc """
  Creates a especie.

  ## Examples

      iex> create_especie(%{field: value})
      {:ok, %Especie{}}

      iex> create_especie(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_especie(attrs \\ %{}) do
    %Especie{}
    |> Especie.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a especie.

  ## Examples

      iex> update_especie(especie, %{field: new_value})
      {:ok, %Especie{}}

      iex> update_especie(especie, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_especie(%Especie{} = especie, attrs) do
    especie
    |> Especie.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Especie.

  ## Examples

      iex> delete_especie(especie)
      {:ok, %Especie{}}

      iex> delete_especie(especie)
      {:error, %Ecto.Changeset{}}

  """
  def delete_especie(%Especie{} = especie) do
    Repo.delete(especie)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking especie changes.

  ## Examples

      iex> change_especie(especie)
      %Ecto.Changeset{source: %Especie{}}

  """
  def change_especie(%Especie{} = especie) do
    Especie.changeset(especie, %{})
  end

  alias Zoo.Clinic.Funcionario

  @doc """
  Returns the list of funcionarios.

  ## Examples

      iex> list_funcionarios()
      [%Funcionario{}, ...]

  """
  def list_funcionarios do
    Repo.all(Funcionario)
  end

  @doc """
  Gets a single funcionario.

  Raises `Ecto.NoResultsError` if the Funcionario does not exist.

  ## Examples

      iex> get_funcionario!(123)
      %Funcionario{}

      iex> get_funcionario!(456)
      ** (Ecto.NoResultsError)

  """
  def get_funcionario!(id), do: Repo.get!(Funcionario, id)

  @doc """
  Creates a funcionario.

  ## Examples

      iex> create_funcionario(%{field: value})
      {:ok, %Funcionario{}}

      iex> create_funcionario(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_funcionario(attrs \\ %{}) do
    %Funcionario{}
    |> Funcionario.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a funcionario.

  ## Examples

      iex> update_funcionario(funcionario, %{field: new_value})
      {:ok, %Funcionario{}}

      iex> update_funcionario(funcionario, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_funcionario(%Funcionario{} = funcionario, attrs) do
    funcionario
    |> Funcionario.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Funcionario.

  ## Examples

      iex> delete_funcionario(funcionario)
      {:ok, %Funcionario{}}

      iex> delete_funcionario(funcionario)
      {:error, %Ecto.Changeset{}}

  """
  def delete_funcionario(%Funcionario{} = funcionario) do
    Repo.delete(funcionario)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking funcionario changes.

  ## Examples

      iex> change_funcionario(funcionario)
      %Ecto.Changeset{source: %Funcionario{}}

  """
  def change_funcionario(%Funcionario{} = funcionario) do
    Funcionario.changeset(funcionario, %{})
  end

  alias Zoo.Clinic.Medicamento

  @doc """
  Returns the list of medicamentos.

  ## Examples

      iex> list_medicamentos()
      [%Medicamento{}, ...]

  """
  def list_medicamentos do
    Repo.all(Medicamento)
  end

  @doc """
  Gets a single medicamento.

  Raises `Ecto.NoResultsError` if the Medicamento does not exist.

  ## Examples

      iex> get_medicamento!(123)
      %Medicamento{}

      iex> get_medicamento!(456)
      ** (Ecto.NoResultsError)

  """
  def get_medicamento!(id), do: Repo.get!(Medicamento, id)

  @doc """
  Creates a medicamento.

  ## Examples

      iex> create_medicamento(%{field: value})
      {:ok, %Medicamento{}}

      iex> create_medicamento(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medicamento(attrs \\ %{}) do
    %Medicamento{}
    |> Medicamento.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medicamento.

  ## Examples

      iex> update_medicamento(medicamento, %{field: new_value})
      {:ok, %Medicamento{}}

      iex> update_medicamento(medicamento, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medicamento(%Medicamento{} = medicamento, attrs) do
    medicamento
    |> Medicamento.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Medicamento.

  ## Examples

      iex> delete_medicamento(medicamento)
      {:ok, %Medicamento{}}

      iex> delete_medicamento(medicamento)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medicamento(%Medicamento{} = medicamento) do
    Repo.delete(medicamento)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medicamento changes.

  ## Examples

      iex> change_medicamento(medicamento)
      %Ecto.Changeset{source: %Medicamento{}}

  """
  def change_medicamento(%Medicamento{} = medicamento) do
    Medicamento.changeset(medicamento, %{})
  end
end
