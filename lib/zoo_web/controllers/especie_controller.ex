defmodule ZooWeb.EspecieController do
  use ZooWeb, :controller

  alias Zoo.Clinic
  alias Zoo.Clinic.Especie

  def index(conn, _params) do
    especies = Clinic.list_especies()
    render(conn, "index.html", especies: especies)
  end

  def new(conn, _params) do
    changeset = Clinic.change_especie(%Especie{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"especie" => especie_params}) do
    case Clinic.create_especie(especie_params) do
      {:ok, especie} ->
        conn
        |> put_flash(:info, "Especie created successfully.")
        |> redirect(to: Routes.especie_path(conn, :show, especie))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    especie = Clinic.get_especie!(id)
    render(conn, "show.html", especie: especie)
  end

  def edit(conn, %{"id" => id}) do
    especie = Clinic.get_especie!(id)
    changeset = Clinic.change_especie(especie)
    render(conn, "edit.html", especie: especie, changeset: changeset)
  end

  def update(conn, %{"id" => id, "especie" => especie_params}) do
    especie = Clinic.get_especie!(id)

    case Clinic.update_especie(especie, especie_params) do
      {:ok, especie} ->
        conn
        |> put_flash(:info, "Especie updated successfully.")
        |> redirect(to: Routes.especie_path(conn, :show, especie))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", especie: especie, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    especie = Clinic.get_especie!(id)
    {:ok, _especie} = Clinic.delete_especie(especie)

    conn
    |> put_flash(:info, "Especie deleted successfully.")
    |> redirect(to: Routes.especie_path(conn, :index))
  end
end
