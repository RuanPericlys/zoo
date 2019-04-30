defmodule ZooWeb.FuncionarioController do
  use ZooWeb, :controller

  alias Zoo.Clinic
  alias Zoo.Clinic.Funcionario

  def index(conn, _params) do
    funcionarios = Clinic.list_funcionarios()
    render(conn, "index.html", funcionarios: funcionarios)
  end

  def new(conn, _params) do
    changeset = Clinic.change_funcionario(%Funcionario{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"funcionario" => funcionario_params}) do
    case Clinic.create_funcionario(funcionario_params) do
      {:ok, funcionario} ->
        conn
        |> put_flash(:info, "Funcionario created successfully.")
        |> redirect(to: Routes.funcionario_path(conn, :show, funcionario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    funcionario = Clinic.get_funcionario!(id)
    render(conn, "show.html", funcionario: funcionario)
  end

  def edit(conn, %{"id" => id}) do
    funcionario = Clinic.get_funcionario!(id)
    changeset = Clinic.change_funcionario(funcionario)
    render(conn, "edit.html", funcionario: funcionario, changeset: changeset)
  end

  def update(conn, %{"id" => id, "funcionario" => funcionario_params}) do
    funcionario = Clinic.get_funcionario!(id)

    case Clinic.update_funcionario(funcionario, funcionario_params) do
      {:ok, funcionario} ->
        conn
        |> put_flash(:info, "Funcionario updated successfully.")
        |> redirect(to: Routes.funcionario_path(conn, :show, funcionario))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", funcionario: funcionario, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    funcionario = Clinic.get_funcionario!(id)
    {:ok, _funcionario} = Clinic.delete_funcionario(funcionario)

    conn
    |> put_flash(:info, "Funcionario deleted successfully.")
    |> redirect(to: Routes.funcionario_path(conn, :index))
  end
end
