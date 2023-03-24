defmodule Exlivery.Users.UserTest do
  use ExUnit.Case
  import Exlivery.Factory
  alias Exlivery.Users.User

  describe "build/5" do
    test "should return a user if all params are valid" do
      response =
        User.build(
          "Rua das bananeiras",
          26,
          "12345678900",
          "psdev7@gmail.com",
          "Patric"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "should return an error if there is any invalid parameter" do
      response =
        User.build(
          "Rua das bananeiras",
          15,
          "12345678900",
          "psdev7@gmail.com",
          "Patric"
        )

      expected_response = {:error, "Invalid parameters"}
      assert response == expected_response
    end
  end
end
