defmodule ZooWeb.MedicamentoControllerTest do
  use ZooWeb.ConnCase

  alias Zoo.Accounts

  @create_attrs %{codmedicamento: 42, nomemedicaento: "some nomemedicaento"}
  @update_attrs %{codmedicamento: 43, nomemedicaento: "some updated nomemedicaento"}
  @invalid_attrs %{codmedicamento: nil, nomemedicaento: nil}

  def fixture(:medicamento) do
    {:ok, medicamento} = Accounts.create_medicamento(@create_attrs)
    medicamento
  end

  describe "index" do
    test "lists all medicamentos", %{conn: conn} do
      conn = get(conn, Routes.medicamento_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Medicamentos"
    end
  end

  describe "new medicamento" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.medicamento_path(conn, :new))
      assert html_response(conn, 200) =~ "New Medicamento"
    end
  end

  describe "create medicamento" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.medicamento_path(conn, :create), medicamento: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.medicamento_path(conn, :show, id)

      conn = get(conn, Routes.medicamento_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Medicamento"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.medicamento_path(conn, :create), medicamento: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Medicamento"
    end
  end

  describe "edit medicamento" do
    setup [:create_medicamento]

    test "renders form for editing chosen medicamento", %{conn: conn, medicamento: medicamento} do
      conn = get(conn, Routes.medicamento_path(conn, :edit, medicamento))
      assert html_response(conn, 200) =~ "Edit Medicamento"
    end
  end

  describe "update medicamento" do
    setup [:create_medicamento]

    test "redirects when data is valid", %{conn: conn, medicamento: medicamento} do
      conn = put(conn, Routes.medicamento_path(conn, :update, medicamento), medicamento: @update_attrs)
      assert redirected_to(conn) == Routes.medicamento_path(conn, :show, medicamento)

      conn = get(conn, Routes.medicamento_path(conn, :show, medicamento))
      assert html_response(conn, 200) =~ "some updated nomemedicaento"
    end

    test "renders errors when data is invalid", %{conn: conn, medicamento: medicamento} do
      conn = put(conn, Routes.medicamento_path(conn, :update, medicamento), medicamento: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Medicamento"
    end
  end

  describe "delete medicamento" do
    setup [:create_medicamento]

    test "deletes chosen medicamento", %{conn: conn, medicamento: medicamento} do
      conn = delete(conn, Routes.medicamento_path(conn, :delete, medicamento))
      assert redirected_to(conn) == Routes.medicamento_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.medicamento_path(conn, :show, medicamento))
      end
    end
  end

  defp create_medicamento(_) do
    medicamento = fixture(:medicamento)
    {:ok, medicamento: medicamento}
  end
end
