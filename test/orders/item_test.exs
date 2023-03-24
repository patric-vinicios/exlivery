defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case
  import Exlivery.Factory
  alias Exlivery.Orders.Item

  describe "build/1" do
    test "should return a valid item when all params are valid" do
      response = Item.build("Pizza de peperoni", :pizza, "35.5", 1)
      expected_response = {:ok, build(:item)}
      assert response == expected_response
    end

    test "should return an invalid item when there is an invalid category" do
      response = Item.build("Pizza de peperoni", :teste, "35.5", 1)
      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end

    test "should return an invalid item when there is an invalid price" do
      response = Item.build("Pizza de peperoni", :pizza, "banana", 1)
      expected_response = {:error, "Invalid price"}
      assert response == expected_response
    end

    test "should return an invalid item when there is an invalid quantity" do
      response = Item.build("Pizza de peperoni", :pizza, "35.5", 0)
      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end
  end
end
