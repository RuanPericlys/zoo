defmodule Zoo.ClinicTest do
  use Zoo.DataCase

  alias Zoo.Clinic

  describe "prescricoes" do
    alias Zoo.Clinic.Prescricao

    @valid_attrs %{codconsulta: 42, codmedicamento: 42}
    @update_attrs %{codconsulta: 43, codmedicamento: 43}
    @invalid_attrs %{codconsulta: nil, codmedicamento: nil}

    def prescricao_fixture(attrs \\ %{}) do
      {:ok, prescricao} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Clinic.create_prescricao()

      prescricao
    end

    test "list_prescricoes/0 returns all prescricoes" do
      prescricao = prescricao_fixture()
      assert Clinic.list_prescricoes() == [prescricao]
    end

    test "get_prescricao!/1 returns the prescricao with given id" do
      prescricao = prescricao_fixture()
      assert Clinic.get_prescricao!(prescricao.id) == prescricao
    end

    test "create_prescricao/1 with valid data creates a prescricao" do
      assert {:ok, %Prescricao{} = prescricao} = Clinic.create_prescricao(@valid_attrs)
      assert prescricao.codconsulta == 42
      assert prescricao.codmedicamento == 42
    end

    test "create_prescricao/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clinic.create_prescricao(@invalid_attrs)
    end

    test "update_prescricao/2 with valid data updates the prescricao" do
      prescricao = prescricao_fixture()
      assert {:ok, %Prescricao{} = prescricao} = Clinic.update_prescricao(prescricao, @update_attrs)
      assert prescricao.codconsulta == 43
      assert prescricao.codmedicamento == 43
    end

    test "update_prescricao/2 with invalid data returns error changeset" do
      prescricao = prescricao_fixture()
      assert {:error, %Ecto.Changeset{}} = Clinic.update_prescricao(prescricao, @invalid_attrs)
      assert prescricao == Clinic.get_prescricao!(prescricao.id)
    end

    test "delete_prescricao/1 deletes the prescricao" do
      prescricao = prescricao_fixture()
      assert {:ok, %Prescricao{}} = Clinic.delete_prescricao(prescricao)
      assert_raise Ecto.NoResultsError, fn -> Clinic.get_prescricao!(prescricao.id) end
    end

    test "change_prescricao/1 returns a prescricao changeset" do
      prescricao = prescricao_fixture()
      assert %Ecto.Changeset{} = Clinic.change_prescricao(prescricao)
    end
  end
end
