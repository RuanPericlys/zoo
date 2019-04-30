defmodule ZooWeb.MedicamentoController do
  use ZooWeb, :controller

  alias Zoo.Clinic
  alias Zoo.Clinic.Medicamento

  def index(conn, _params) do
    medicamentos = Clinic.list_medicamentos()
    render(conn, "index.html", medicamentos: medicamentos)
  end

  def new(conn, _params) do
    changeset = Clinic.change_medicamento(%Medicamento{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"medicamento" => medicamento_params}) do
    case Clinic.create_medicamento(medicamento_params) do
      {:ok, medicamento} ->
        conn
        |> put_flash(:info, "Medicamento created successfully.")
        |> redirect(to: Routes.medicamento_path(conn, :show, medicamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    medicamento = Clinic.get_medicamento!(id)
    render(conn, "show.html", medicamento: medicamento)
  end

  def edit(conn, %{"id" => id}) do
    medicamento = Clinic.get_medicamento!(id)
    changeset = Clinic.change_medicamento(medicamento)
    render(conn, "edit.html", medicamento: medicamento, changeset: changeset)
  end

  def update(conn, %{"id" => id, "medicamento" => medicamento_params}) do
    medicamento = Clinic.get_medicamento!(id)

    case Clinic.update_medicamento(medicamento, medicamento_params) do
      {:ok, medicamento} ->
        conn
        |> put_flash(:info, "Medicamento updated successfully.")
        |> redirect(to: Routes.medicamento_path(conn, :show, medicamento))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", medicamento: medicamento, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    medicamento = Clinic.get_medicamento!(id)
    {:ok, _medicamento} = Clinic.delete_medicamento(medicamento)

    conn
    |> put_flash(:info, "Medicamento deleted successfully.")
    |> redirect(to: Routes.medicamento_path(conn, :index))
  end
end
