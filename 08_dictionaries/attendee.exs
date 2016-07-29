defmodule Attendee do
    @behaviour Access
    defstruct name: "", paid: false, over_18: true

    defdelegate [fetch(t, key), get_and_update(t, key, list)], to: Map

    def may_attend_after_party(attendee = %Attendee{}) do
        attendee.paid && attendee.over_18
    end

    def print_vip_badge(%Attendee{name: name}) when name != "" do
        IO.puts "Very cheap badge for #{name}"
    end

    def print_vip_badge(%Attendee{}) do
        raise "missing name for badge"
    end
end