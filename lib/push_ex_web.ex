defmodule PushExWeb do
  @moduledoc """
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: PushExWeb

      import Plug.Conn
      alias PushExWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/push_ex_web/templates",
        namespace: PushExWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [view_module: 1]

      alias PushExWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
