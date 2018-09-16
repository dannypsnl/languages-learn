defmodule Router do
  use PlugRest.Router

  plug :match
  plug :dispatch

  resource "/hello", HelloResource
end
