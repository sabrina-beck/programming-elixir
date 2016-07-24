defmodule Math do
    def sum(0), do: 0
    def sum(n), do: n + sum(n - 1)

    def gcd(x, 0), do: x
    def gcd(x, y), do: gcd(y, rem(x,y))

    def guess(actual, first..last) do
        try = div(first + last, 2)
        IO.puts("Is it #{try}?")
        _guess(actual, try, first..last)
    end

    defp _guess(actual, actual, _.._) do
        actual
    end

    defp _guess(actual, shot, first.._) when shot > actual do
        guess(actual, first..shot-1)
    end

    defp _guess(actual, shot, _..last) when shot < actual do
        guess(actual, shot+1..last)
    end

end