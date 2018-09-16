defmodule PlayPlugTest do
  use ExUnit.Case
  doctest PlayPlug

  test "greets the world" do
    assert PlayPlug.hello() == :world
  end
end
