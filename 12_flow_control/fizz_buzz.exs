defmodule FizzBuzz do
    def fizz_buzz(value) do
        case rem(value, 3) do
            0 -> if rem(value, 5) == 0, do: "FizzBuzz", else: "Fizz"
            _ -> if rem(value, 5) == 0, do: "Buzz", else: value
        end
    end
end