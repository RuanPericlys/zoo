defmodule Zoo.Repo.Migrations.CreateAnimais do
  use Ecto.Migration

  def change do
    create table(:animais) do
      add :nomeAnimal, :string
      add :codEspecie, :integer
      add :codAnimal, :integer
      add :codAnimalPai, :integer
      add :codAnimalMae, :integer
      add :dtNascAnimal, :date

      timestamps()
    end

  end
end
