defmodule Zoo.Repo.Migrations.CreateEspecies do
  use Ecto.Migration

  def change do
    create table(:especies) do
      add :codespecie, :integer
      add :nomeespecie, :string
      add :expectativaespecie, :integer

      timestamps()
    end

  end
end
