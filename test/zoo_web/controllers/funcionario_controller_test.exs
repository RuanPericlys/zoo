defmodule ZooWeb.FuncionarioControllerTest do
  use ZooWeb.ConnCase

  alias Zoo.Accounts

  @create_attrs %{crmv: 42, email: "some email", endereco: "some endereco", especialidade: "some especialidade", matricula: 42, nome: "some nome"}
  @update_attrs %{crmv: 43, email: "some updated email", endereco: "some updated endereco", especialidade: "some updated especialidade", matricula: 43, nome: "some updated nome"}
  @invalid_attrs %{crmv: nil, email: nil, endereco: nil, especialidade: nil, matricula: nil, nome: nil}

  def fixture(:funcionario) do
    {:ok, funcionario} = Accounts.create_funcionario(@create_attrs)
    funcionario
  end

  describe "index" do
    test "lists all funcionarios", %{conn: conn} do
      conn = get(conn, Routes.funcionario_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Funcionarios"
    end
  end

  describe "new funcionario" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.funcionario_path(conn, :new))
      assert html_response(conn, 200) =~ "New Funcionario"
    end
  end

  describe "create funcionario" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.funcionario_path(conn, :create), funcionario: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.funcionario_path(conn, :show, id)

      conn = get(conn, Routes.funcionario_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Funcionario"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.funcionario_path(conn, :create), funcionario: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Funcionario"
    end
  end

  describe "edit funcionario" do
    setup [:create_funcionario]

    test "renders form for editing chosen funcionario", %{conn: conn, funcionario: funcionario} do
      conn = get(conn, Routes.funcionario_path(conn, :edit, funcionario))
      assert html_response(conn, 200) =~ "Edit Funcionario"
    end
  end

  describe "update funcionario" do
    setup [:create_funcionario]

    test "redirects when data is valid", %{conn: conn, funcionario: funcionario} do
      conn = put(conn, Routes.funcionario_path(conn, :update, funcionario), funcionario: @update_attrs)
      assert redirected_to(conn) == Routes.funcionario_path(conn, :show, funcionario)

      conn = get(conn, Routes.funcionario_path(conn, :show, funcionario))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, funcionario: funcionario} do
      conn = put(conn, Routes.funcionario_path(conn, :update, funcionario), funcionario: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Funcionario"
    end
  end

  describe "delete funcionario" do
    setup [:create_funcionario]

    test "deletes chosen funcionario", %{conn: conn, funcionario: funcionario} do
      conn = delete(conn, Routes.funcionario_path(conn, :delete, funcionario))
      assert redirected_to(conn) == Routes.funcionario_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.funcionario_path(conn, :show, funcionario))
      end
    end
  end

  defp create_funcionario(_) do
    funcionario = fixture(:funcionario)
    {:ok, funcionario: funcionario}
  end
end
