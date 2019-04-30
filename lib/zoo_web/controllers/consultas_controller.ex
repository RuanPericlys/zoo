defmodule ZooWeb.ConsultasController do
  use ZooWeb, :controller

  alias Zoo.Clinic
  alias Zoo.Clinic.Consultas

  def index(conn, _params) do
    consultas = Clinic.list_consultas()
    render(conn, "index.html", consultas: consultas)
  end

  def new(conn, _params) do
    changeset = Clinic.change_consultas(%Consultas{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"consultas" => consultas_params}) do
    case Clinic.create_consultas(consultas_params) do
      {:ok, consultas} ->
        conn
        |> put_flash(:info, "Consultas created successfully.")
        |> redirect(to: Routes.consultas_path(conn, :show, consultas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    consultas = Clinic.get_consultas!(id)
    render(conn, "show.html", consultas: consultas)
  end

  def edit(conn, %{"id" => id}) do
    consultas = Clinic.get_consultas!(id)
    changeset = Clinic.change_consultas(consultas)
    render(conn, "edit.html", consultas: consultas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "consultas" => consultas_params}) do
    consultas = Clinic.get_consultas!(id)

    case Clinic.update_consultas(consultas, consultas_params) do
      {:ok, consultas} ->
        conn
        |> put_flash(:info, "Consultas updated successfully.")
        |> redirect(to: Routes.consultas_path(conn, :show, consultas))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", consultas: consultas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    consultas = Clinic.get_consultas!(id)
    {:ok, _consultas} = Clinic.delete_consultas(consultas)

    conn
    |> put_flash(:info, "Consultas deleted successfully.")
    |> redirect(to: Routes.consultas_path(conn, :index))
  end
end
