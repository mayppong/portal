defmodule PortalTest do
  use ExUnit.Case, async: true

  test "able to shoot doors" do
    {left_door, right_door} = create_pair_of_door(:red, :pink)
    assert elem(left_door, 0) == :ok
    assert elem(right_door, 0) == :ok
  end

  test "able to connect door" do
    create_pair_of_door(:purple, :green)
    portal = Portal.transfer(:purple, :green, [1, 2, 3])
    assert Portal.Door.get(:purple) == [3, 2, 1]
    assert Portal.Door.get(:green) == []
  end

  def create_pair_of_door( left_color, right_color) do
    left_door = Portal.shoot(left_color)
    right_door = Portal.shoot(right_color)
    # { left_status, left_pid } = Portal.shoot(left_color)
    # { right_status, left_pid } = Portal.shoot(right_color)
    {left_door, right_door}
  end
end
