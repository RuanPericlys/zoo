defmodule Zoo.Clinic.Funcionario do
  use Ecto.Schema
  import Ecto.Changeset

  schema "funcionarios" do
    field :crmv, :integer
    field :email, :string
    field :endereco, :string
    field :especialidade, :string
    field :matricula, :integer
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(funcionario, attrs) do
    funcionario
    |> cast(attrs, [:matricula, :nome, :endereco, :email, :crmv, :especialidade])
    |> validate_required([:matricula, :nome, :endereco, :email, :crmv, :especialidade])
  end
end
