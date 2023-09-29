defmodule ClpWeb.Router do
  use ClpWeb, :router
  # use Plug.ErrorHandler

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ClpWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ClpWeb do
    pipe_through :api

    get "/payment-statuses", PaymentStatusController, :index
    get "/payment-statuses/:id", PaymentStatusController, :show
    get "/invoices", InvoiceController, :index
    get "/invoices/:id", InvoiceController, :show
    get "/invoices/barcode/:barCode", InvoiceController, :findByBarCode
    post "/invoices", InvoiceController, :create
    put "/invoices/:id", InvoiceController, :update
    delete "/invoices/:id", InvoiceController, :delete
    get "/payments", PaymentsController, :index
    get "/payments/:id", PaymentsController, :show
    post "/payments", PaymentsController, :create
    put "/payments/:id", PaymentsController, :update
    delete "/payments/:id", PaymentsController, :delete
  end

  scope "/", ClpWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClpWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:clp, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ClpWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
