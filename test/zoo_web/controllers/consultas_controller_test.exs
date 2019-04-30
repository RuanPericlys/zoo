defmodule ZooWeb.ConsultasControllerTest do
  use ZooWeb.ConnCase

  alias Zoo.Accounts

  @create_attrs %{codanimal: 42, codconsulta: 42, data: ~D[2010-04-17], diagnosticoconsulta: "some diagnosticoconsulta", matricula: 42}
  @update_attrs %{codanimal: 43, codconsulta: 43, data: ~D[2011-05-18], diagnosticoconsulta: "some updated diagnosticoconsulta", matricula: 43}
  @invalid_attrs %{codanimal: nil, codconsulta: nil, data: nil, diagnosticoconsulta: nil, matricula: nil}

  def fixture(:consultas) do
    {:ok, consultas} = Accounts.create_consultas(@create_attrs)
    consultas
  end

  describe "index" do
    test "lists all consultas", %{conn: conn} do
      conn = get(conn, Routes.consultas_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Consultas"
    end
  end

  describe "new consultas" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.consultas_path(conn, :new))
      assert html_response(conn, 200) =~ "New Consultas"
    end
  end

  describe "create consultas" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.consultas_path(conn, :create), consultas: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.consultas_path(conn, :show, id)

      conn = get(conn, Routes.consultas_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Consultas"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.consultas_path(conn, :create), consultas: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Consultas"
    end
  end

  describe "edit consultas" do
    setup [:create_consultas]

    test "renders form for editing chosen consultas", %{conn: conn, consultas: consultas} do
      conn = get(conn, Routes.consultas_path(conn, :edit, consultas))
      assert html_response(conn, 200) =~ "Edit Consultas"
    end
  end

  describe "update consultas" do
    setup [:create_consultas]

    test "redirects when data is valid", %{conn: conn, consultas: consultas} do
      conn = put(conn, Routes.consultas_path(conn, :update, consultas), consultas: @update_attrs)
      assert redirected_to(conn) == Routes.consultas_path(conn, :show, consultas)

      conn = get(conn, Routes.consultas_path(conn, :show, consultas))
      assert html_response(conn, 200) =~ "some updated diagnosticoconsulta"
    end

    test "renders errors when data is invalid", %{conn: conn, consultas: consultas} do
      conn = put(conn, Routes.consultas_path(conn, :update, consultas), consultas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Consultas"
    end
  end

  describe "delete consultas" do
    setup [:create_consultas]

    test "deletes chosen consultas", %{conn: conn, consultas: consultas} do
      conn = delete(conn, Routes.consultas_path(conn, :delete, consultas))
      assert redirected_to(conn) == Routes.consultas_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.consultas_path(conn, :show, consultas))
      end
    end
  end

  defp create_consultas(_) do
    consultas = fixture(:consultas)
    {:ok, consultas: consultas}
  end
end
