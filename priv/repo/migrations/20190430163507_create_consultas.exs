defmodule Zoo.Repo.Migrations.CreateConsultas do
  use Ecto.Migration

  def change do
    create table(:consultas) do
      add :codanimal, :integer
      add :matricula, :integer
      add :data, :date
      add :diagnosticoconsulta, :string
      add :codconsulta, :integer

      timestamps()
    end

  end
end
