fizz_buzz = fn
    0, 0, _ -> "FizzBuzz"
    0, _, _ -> "Fizz"
    _, 0, _ -> "Buzz"
    _, _, c -> c
end

fizz_buzz_2 = fn
    n -> fizz_buzz.(rem(n, 3), rem(n, 5), n)
end