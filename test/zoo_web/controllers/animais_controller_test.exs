defmodule ZooWeb.AnimaisControllerTest do
  use ZooWeb.ConnCase

  alias Zoo.Accounts

  @create_attrs %{codAnimal: 42, codAnimalMae: 42, codAnimalPai: 42, codEspecie: 42, dtNascAnimal: ~D[2010-04-17], nomeAnimal: "some nomeAnimal"}
  @update_attrs %{codAnimal: 43, codAnimalMae: 43, codAnimalPai: 43, codEspecie: 43, dtNascAnimal: ~D[2011-05-18], nomeAnimal: "some updated nomeAnimal"}
  @invalid_attrs %{codAnimal: nil, codAnimalMae: nil, codAnimalPai: nil, codEspecie: nil, dtNascAnimal: nil, nomeAnimal: nil}

  def fixture(:animais) do
    {:ok, animais} = Accounts.create_animais(@create_attrs)
    animais
  end

  describe "index" do
    test "lists all animais", %{conn: conn} do
      conn = get(conn, Routes.animais_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Animais"
    end
  end

  describe "new animais" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.animais_path(conn, :new))
      assert html_response(conn, 200) =~ "New Animais"
    end
  end

  describe "create animais" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.animais_path(conn, :create), animais: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.animais_path(conn, :show, id)

      conn = get(conn, Routes.animais_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Animais"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.animais_path(conn, :create), animais: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Animais"
    end
  end

  describe "edit animais" do
    setup [:create_animais]

    test "renders form for editing chosen animais", %{conn: conn, animais: animais} do
      conn = get(conn, Routes.animais_path(conn, :edit, animais))
      assert html_response(conn, 200) =~ "Edit Animais"
    end
  end

  describe "update animais" do
    setup [:create_animais]

    test "redirects when data is valid", %{conn: conn, animais: animais} do
      conn = put(conn, Routes.animais_path(conn, :update, animais), animais: @update_attrs)
      assert redirected_to(conn) == Routes.animais_path(conn, :show, animais)

      conn = get(conn, Routes.animais_path(conn, :show, animais))
      assert html_response(conn, 200) =~ "some updated nomeAnimal"
    end

    test "renders errors when data is invalid", %{conn: conn, animais: animais} do
      conn = put(conn, Routes.animais_path(conn, :update, animais), animais: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Animais"
    end
  end

  describe "delete animais" do
    setup [:create_animais]

    test "deletes chosen animais", %{conn: conn, animais: animais} do
      conn = delete(conn, Routes.animais_path(conn, :delete, animais))
      assert redirected_to(conn) == Routes.animais_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.animais_path(conn, :show, animais))
      end
    end
  end

  defp create_animais(_) do
    animais = fixture(:animais)
    {:ok, animais: animais}
  end
end
