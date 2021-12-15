defmodule IdenticonnerServerTest do
  use ExUnit.Case
  doctest IdenticonnerServer

  test "greets the world" do
    assert IdenticonnerServer.hello() == :world
  end
end
