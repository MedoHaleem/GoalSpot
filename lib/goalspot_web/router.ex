defmodule GoalspotWeb.Router do
  use GoalspotWeb, :router

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

  scope "/", GoalspotWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources("/tasks", TaskController) do
      resources("/subtasks", SubTaskController)
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", GoalspotWeb do
  #   pipe_through :api
  # end
end
