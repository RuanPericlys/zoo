defmodule ZooWeb.PrescricaoControllerTest do
  use ZooWeb.ConnCase

  alias Zoo.Clinic

  @create_attrs %{codconsulta: 42, codmedicamento: 42}
  @update_attrs %{codconsulta: 43, codmedicamento: 43}
  @invalid_attrs %{codconsulta: nil, codmedicamento: nil}

  def fixture(:prescricao) do
    {:ok, prescricao} = Clinic.create_prescricao(@create_attrs)
    prescricao
  end

  describe "index" do
    test "lists all prescricoes", %{conn: conn} do
      conn = get(conn, Routes.prescricao_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Prescricoes"
    end
  end

  describe "new prescricao" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.prescricao_path(conn, :new))
      assert html_response(conn, 200) =~ "New Prescricao"
    end
  end

  describe "create prescricao" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prescricao_path(conn, :create), prescricao: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.prescricao_path(conn, :show, id)

      conn = get(conn, Routes.prescricao_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Prescricao"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prescricao_path(conn, :create), prescricao: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prescricao"
    end
  end

  describe "edit prescricao" do
    setup [:create_prescricao]

    test "renders form for editing chosen prescricao", %{conn: conn, prescricao: prescricao} do
      conn = get(conn, Routes.prescricao_path(conn, :edit, prescricao))
      assert html_response(conn, 200) =~ "Edit Prescricao"
    end
  end

  describe "update prescricao" do
    setup [:create_prescricao]

    test "redirects when data is valid", %{conn: conn, prescricao: prescricao} do
      conn = put(conn, Routes.prescricao_path(conn, :update, prescricao), prescricao: @update_attrs)
      assert redirected_to(conn) == Routes.prescricao_path(conn, :show, prescricao)

      conn = get(conn, Routes.prescricao_path(conn, :show, prescricao))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, prescricao: prescricao} do
      conn = put(conn, Routes.prescricao_path(conn, :update, prescricao), prescricao: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prescricao"
    end
  end

  describe "delete prescricao" do
    setup [:create_prescricao]

    test "deletes chosen prescricao", %{conn: conn, prescricao: prescricao} do
      conn = delete(conn, Routes.prescricao_path(conn, :delete, prescricao))
      assert redirected_to(conn) == Routes.prescricao_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.prescricao_path(conn, :show, prescricao))
      end
    end
  end

  defp create_prescricao(_) do
    prescricao = fixture(:prescricao)
    {:ok, prescricao: prescricao}
  end
end
