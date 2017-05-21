defmodule GuessingGameUI do

  IO.puts "Elixir Guessing Game\n"
  IO.puts "--------------------\n\n"

  def get_response(status, message, guess_number) do
    cond do
      status === :ok ->
        {compare_status, compare_message} = GuessingGame.compare_numbers(guess_number, message)
        case compare_status do
          :ok ->
            IO.inspect "You are the winner!"
            user_input = IO.gets "Want to play again: y/n "
            strip_input = String.strip(user_input)
            case strip_input do
              "y" -> game(:rand.uniform(10))
              "n" -> IO.puts "\n\n*************   Good Bye! Thanks for playing.   *************\n\n"
            end

          :error ->
            IO.inspect compare_message
            game(guess_number)
        end
      true ->
        IO.inspect message
        game(guess_number)
    end
  end

    def game(guess_number) do
      user_input = IO.gets "Enter your guess: "
      strip_input = String.strip(user_input)
      {status, message} = GuessingGame.valid?(strip_input)
      get_response(status, message, guess_number)
    end

end

GuessingGameUI.game(:rand.uniform(10))
