defmodule ZooWeb.Router do
  use ZooWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authenticated do
    plug Zoo.Guardian.AccessPipeline
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ZooWeb do
    pipe_through :browser

    resources "/animais", AnimaisController, only: [:show, :index, :create, :new, :delete, :edit]
    resources "/consultas", ConsultasController, only: [:index, :new, :create, :delete]
	resources "/especie", EspecieController, only: [:index, :new, :create, :delete]
	resources "/funcionario", FuncionarioController, only: [:index, :new, :create, :delete]
	resources "/medicamento", MedicamentoController, only: [:index, :new, :create, :delete]
	resources "/prescricao", PrescricaoController, only: [:index, :new, :create, :delete]
	
    get "/", PageController, :index
  end

  scope "/", ZooWeb do
    pipe_through [:browser, :authenticated]
  end



  # Other scopes may use custom stacks.
  # scope "/api", ZooWeb do
  #   pipe_through :api
  # end
end
