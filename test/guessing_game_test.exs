defmodule GuessingGameTest do
  use ExUnit.Case
  doctest GuessingGame

  test "Checking valid user input" do
    assert GuessingGame.valid?("5") == {:ok, 5}
    assert GuessingGame.valid?("9") == {:ok, 9}
    assert GuessingGame.valid?("10") == {:ok, 10}
  end

  test "Invalid user input" do
    assert GuessingGame.valid?("11") == {:error, "11 is not valid number. Please input number between 1-10"}
    assert GuessingGame.valid?("22") == {:error, "22 is not valid number. Please input number between 1-10"}
    assert GuessingGame.valid?("") == {:error, " is not valid number. Please input number between 1-10"}
    assert GuessingGame.valid?("one") == {:error, "one is not valid number. Please input number between 1-10"}
  end

  test "Compare random number with user input that return true" do
    random_number = 6
    user_number = 6

    assert GuessingGame.compare_numbers(random_number, user_number) == {:ok, user_number}
  end

  test "Compare random number with user input higher than rand number" do
      random_number = 7
      user_number = 8

      assert GuessingGame.compare_numbers(random_number, user_number) == {:error, "Wrong! Your guess #{user_number} but the number is lower" }
  end

  test "Compare random number with user input lower than rand number" do
      random_number = 7
      user_number = 2

      assert GuessingGame.compare_numbers(random_number, user_number) == {:error, "Wrong! Your guess #{user_number} but the number is higher" }
  end
end
