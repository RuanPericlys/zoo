defmodule Zoo.Repo.Migrations.CreateMedicamentos do
  use Ecto.Migration

  def change do
    create table(:medicamentos) do
      add :codmedicamento, :integer
      add :nomemedicaento, :string

      timestamps()
    end

  end
end
