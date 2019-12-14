defmodule ApiJavaElixirWeb.Router do
  use ApiJavaElixirWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ApiJavaElixirWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ApiJavaElixirWeb do
    pipe_through :api
    resources "/curriculos", CurriculosController, except: [:new, :edit]
    resources "/vaga_de_emprego", VagaDeEmpregoController, except: [:new, :edit]
   end
end
