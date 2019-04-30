defmodule Zoo.Clinic.Consultas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "consultas" do
    field :codanimal, :integer
    field :codconsulta, :integer
    field :data, :date
    field :diagnosticoconsulta, :string
    field :matricula, :integer

    timestamps()
  end

  @doc false
  def changeset(consultas, attrs) do
    consultas
    |> cast(attrs, [:codanimal, :matricula, :data, :diagnosticoconsulta, :codconsulta])
    |> validate_required([:codanimal, :matricula, :data, :diagnosticoconsulta, :codconsulta])
  end
end
