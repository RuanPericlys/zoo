defmodule Zoo.Clinic.Medicamento do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medicamentos" do
    field :codmedicamento, :integer
    field :nomemedicaento, :string

    timestamps()
  end

  @doc false
  def changeset(medicamento, attrs) do
    medicamento
    |> cast(attrs, [:codmedicamento, :nomemedicaento])
    |> validate_required([:codmedicamento, :nomemedicaento])
  end
end
