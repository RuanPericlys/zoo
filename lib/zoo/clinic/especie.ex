defmodule Zoo.Clinic.Especie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "especies" do
    field :codespecie, :integer
    field :expectativaespecie, :integer
    field :nomeespecie, :string

    timestamps()
  end

  @doc false
  def changeset(especie, attrs) do
    especie
    |> cast(attrs, [:codespecie, :nomeespecie, :expectativaespecie])
    |> validate_required([:codespecie, :nomeespecie, :expectativaespecie])
  end
end
