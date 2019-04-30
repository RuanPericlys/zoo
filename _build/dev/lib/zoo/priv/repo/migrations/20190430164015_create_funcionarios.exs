defmodule Zoo.Repo.Migrations.CreateFuncionarios do
  use Ecto.Migration

  def change do
    create table(:funcionarios) do
      add :matricula, :integer
      add :nome, :string
      add :endereco, :string
      add :email, :string
      add :crmv, :integer
      add :especialidade, :string

      timestamps()
    end

  end
end
