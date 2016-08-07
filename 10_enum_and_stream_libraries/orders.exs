defmodule Orders do
    def add_total_amount([], _tax_rates), do: []

    def add_total_amount([order | tail], tax_rates) do
        state = order[:ship_to]
        net = order[:net_amount]

        tax = tax_rates[state]

        total = 
            if tax do
                tax_percent = 1 + tax
                net * tax_percent
            else
                net
            end

        new_order = Dict.put order, :total_amount, total
        [new_order | add_total_amount(tail, tax_rates)]
    end
end