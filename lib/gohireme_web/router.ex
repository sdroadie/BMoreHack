defmodule GohiremeWeb.Router do
  use GohiremeWeb, :router

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

  scope "/", GohiremeWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/signup", UserController
    resources "/login", UserSessionController, only: [:new, :create]
    delete "/logout", UserSessionController, :delete
    resources "/company", CompanyController
    resources "/candidate", CandidateController
    resources "/industry", IndustryController, only: [:new, :create, :update]
    resources "/salary", SalaryController, only: [:new, :create, :update]
    resources "/location", LocationController, only: [:new, :create, :update]
    resources "/smile", CandidatePictureController, only: [:new, :create, :update]
    resources "/pitch", PitchController, only: [:new, :create, :update]
    resources "/fundme", CandidateVideoController, only: [:new, :create, :update]
    resources "/hireme", HireVideoController, only: [:new, :create, :update]
  end

  # Other scopes may use custom stacks.
  # scope "/api", GohiremeWeb do
  #   pipe_through :api
  # end
end
