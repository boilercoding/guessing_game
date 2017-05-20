defmodule GuessingGame do
  @moduledoc false

  def valid?(input) do
    cond do
      input == "" -> check_user_input(input)
      Regex.match?(~r/[0-9]/, input) -> input |> String.to_integer() |> check_user_input()
      true ->
        check_user_input(input)
    end
  end

  def check_user_input(number) when number <= 10 do
    {:ok, number}
  end

  def check_user_input(number) when number > 10 do
    {:error, "#{number} is not valid number. Please input number between 1-10"}
  end

  def check_user_input(number) when number == "" do
    {:error, "#{number} is not valid number. Please input number between 1-10"}
  end

  def check_user_input(number) do
    {:error, "#{number} is not valid number. Please input number between 1-10"}
  end

  def compare_numbers(random_number, user_number) when random_number == user_number do
    {:ok, user_number}
  end

  def compare_numbers(random_number, user_number) when random_number < user_number do
      {:error, "Wrong! Your guess #{user_number} but the number is lower" }
  end

  def compare_numbers(random_number, user_number) when random_number > user_number do
      {:error, "Wrong! Your guess #{user_number} but the number is higher" }
  end
end
