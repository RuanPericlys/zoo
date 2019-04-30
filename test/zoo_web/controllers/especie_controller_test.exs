defmodule ZooWeb.EspecieControllerTest do
  use ZooWeb.ConnCase

  alias Zoo.Accounts

  @create_attrs %{codespecie: 42, expectativaespecie: 42, nomeespecie: "some nomeespecie"}
  @update_attrs %{codespecie: 43, expectativaespecie: 43, nomeespecie: "some updated nomeespecie"}
  @invalid_attrs %{codespecie: nil, expectativaespecie: nil, nomeespecie: nil}

  def fixture(:especie) do
    {:ok, especie} = Accounts.create_especie(@create_attrs)
    especie
  end

  describe "index" do
    test "lists all especies", %{conn: conn} do
      conn = get(conn, Routes.especie_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Especies"
    end
  end

  describe "new especie" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.especie_path(conn, :new))
      assert html_response(conn, 200) =~ "New Especie"
    end
  end

  describe "create especie" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.especie_path(conn, :create), especie: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.especie_path(conn, :show, id)

      conn = get(conn, Routes.especie_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Especie"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.especie_path(conn, :create), especie: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Especie"
    end
  end

  describe "edit especie" do
    setup [:create_especie]

    test "renders form for editing chosen especie", %{conn: conn, especie: especie} do
      conn = get(conn, Routes.especie_path(conn, :edit, especie))
      assert html_response(conn, 200) =~ "Edit Especie"
    end
  end

  describe "update especie" do
    setup [:create_especie]

    test "redirects when data is valid", %{conn: conn, especie: especie} do
      conn = put(conn, Routes.especie_path(conn, :update, especie), especie: @update_attrs)
      assert redirected_to(conn) == Routes.especie_path(conn, :show, especie)

      conn = get(conn, Routes.especie_path(conn, :show, especie))
      assert html_response(conn, 200) =~ "some updated nomeespecie"
    end

    test "renders errors when data is invalid", %{conn: conn, especie: especie} do
      conn = put(conn, Routes.especie_path(conn, :update, especie), especie: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Especie"
    end
  end

  describe "delete especie" do
    setup [:create_especie]

    test "deletes chosen especie", %{conn: conn, especie: especie} do
      conn = delete(conn, Routes.especie_path(conn, :delete, especie))
      assert redirected_to(conn) == Routes.especie_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.especie_path(conn, :show, especie))
      end
    end
  end

  defp create_especie(_) do
    especie = fixture(:especie)
    {:ok, especie: especie}
  end
end
