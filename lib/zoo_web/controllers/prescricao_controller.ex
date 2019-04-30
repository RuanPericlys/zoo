defmodule ZooWeb.PrescricaoController do
  use ZooWeb, :controller

  alias Zoo.Clinic
  alias Zoo.Clinic.Prescricao

  def index(conn, _params) do
    prescricoes = Clinic.list_prescricoes()
    render(conn, "index.html", prescricoes: prescricoes)
  end

  def new(conn, _params) do
    changeset = Clinic.change_prescricao(%Prescricao{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prescricao" => prescricao_params}) do
    case Clinic.create_prescricao(prescricao_params) do
      {:ok, prescricao} ->
        conn
        |> put_flash(:info, "Prescricao created successfully.")
        |> redirect(to: Routes.prescricao_path(conn, :show, prescricao))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prescricao = Clinic.get_prescricao!(id)
    render(conn, "show.html", prescricao: prescricao)
  end

  def edit(conn, %{"id" => id}) do
    prescricao = Clinic.get_prescricao!(id)
    changeset = Clinic.change_prescricao(prescricao)
    render(conn, "edit.html", prescricao: prescricao, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prescricao" => prescricao_params}) do
    prescricao = Clinic.get_prescricao!(id)

    case Clinic.update_prescricao(prescricao, prescricao_params) do
      {:ok, prescricao} ->
        conn
        |> put_flash(:info, "Prescricao updated successfully.")
        |> redirect(to: Routes.prescricao_path(conn, :show, prescricao))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", prescricao: prescricao, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prescricao = Clinic.get_prescricao!(id)
    {:ok, _prescricao} = Clinic.delete_prescricao(prescricao)

    conn
    |> put_flash(:info, "Prescricao deleted successfully.")
    |> redirect(to: Routes.prescricao_path(conn, :index))
  end
end
