defmodule Zoo.Clinic.Animais do
  use Ecto.Schema
  import Ecto.Changeset

  schema "animais" do
    field :codAnimal, :integer
    field :codAnimalMae, :integer
    field :codAnimalPai, :integer
    field :codEspecie, :integer
    field :dtNascAnimal, :date
    field :nomeAnimal, :string

    timestamps()
  end

  @doc false
  def changeset(animais, attrs) do
    animais
    |> cast(attrs, [:nomeAnimal, :codEspecie, :codAnimal, :codAnimalPai, :codAnimalMae, :dtNascAnimal])
    |> validate_required([:nomeAnimal, :codEspecie, :codAnimal, :codAnimalPai, :codAnimalMae, :dtNascAnimal])
  end
end
