defmodule Zoo.Repo.Migrations.CreatePrescricoes do
  use Ecto.Migration

  def change do
    create table(:prescricoes) do
      add :codconsulta, :integer
      add :codmedicamento, :integer

      timestamps()
    end

  end
end
