defmodule Zoo.Clinic.Prescricao do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prescricoes" do
    field :codconsulta, :integer
    field :codmedicamento, :integer

    timestamps()
  end

  @doc false
  def changeset(prescricao, attrs) do
    prescricao
    |> cast(attrs, [:codconsulta, :codmedicamento])
    |> validate_required([:codconsulta, :codmedicamento])
  end
end
