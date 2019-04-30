defmodule ZooWeb.AnimaisController do
  use ZooWeb, :controller

  alias Zoo.Clinic
  alias Zoo.Clinic.Animais

  def index(conn, _params) do
    animais = Clinic.list_animais()
    render(conn, "index.html", animais: animais)
  end

  def new(conn, _params) do
    changeset = Clinic.change_animais(%Animais{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"animais" => animais_params}) do
    case Clinic.create_animais(animais_params) do
      {:ok, animais} ->
        conn
        |> put_flash(:info, "Animais created successfully.")
        |> redirect(to: Routes.animais_path(conn, :show, animais))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    animais = Clinic.get_animais!(id)
    render(conn, "show.html", animais: animais)
  end

  def edit(conn, %{"id" => id}) do
    animais = Clinic.get_animais!(id)
    changeset = Clinic.change_animais(animais)
    render(conn, "edit.html", animais: animais, changeset: changeset)
  end

  def update(conn, %{"id" => id, "animais" => animais_params}) do
    animais = Clinic.get_animais!(id)

    case Clinic.update_animais(animais, animais_params) do
      {:ok, animais} ->
        conn
        |> put_flash(:info, "Animais updated successfully.")
        |> redirect(to: Routes.animais_path(conn, :show, animais))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", animais: animais, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    animais = Clinic.get_animais!(id)
    {:ok, _animais} = Clinic.delete_animais(animais)

    conn
    |> put_flash(:info, "Animais deleted successfully.")
    |> redirect(to: Routes.animais_path(conn, :index))
  end
end
