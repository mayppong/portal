defmodule Portal.DoorTest do
  use ExUnit.Case

  test "able to start a door" do
    { status, pid } = Portal.Door.start_link(:blue)
    assert status == :ok
  end

  test "able to push data to a door" do
    Portal.Door.start_link(:blue)
    assert :ok == Portal.Door.push(:blue, 1)
  end

  test "able to get data in a door" do
    Portal.Door.start_link(:blue)
    assert Portal.Door.get(:blue) == []

    Portal.Door.push(:blue, 1)
    assert [1] == Portal.Door.get(:blue)
  end

  test "able to pop data out of a door" do
    Portal.Door.start_link(:blue)
    Portal.Door.push(:blue, 1)
    assert {:ok, 1} == Portal.Door.pop(:blue)
    assert [] == Portal.Door.get(:blue)
    assert :error == Portal.Door.pop(:blue)
  end

end
