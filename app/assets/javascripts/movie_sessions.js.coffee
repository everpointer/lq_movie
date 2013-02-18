# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $("#seats_wrapper table>tbody>tr>td").click ->
        seat = $(this)
        if seat.hasClass("seat_single_available")
            seat.removeClass("seat_single_available").addClass("seat_taken")
            add_ticket(seat)
        else if seat.hasClass("seat_double_available")
            seat.removeClass("seat_double_available").addClass("seat_taken")
            add_ticket(seat)
        else if seat.hasClass("seat_taken")
            seat.removeClass("seat_taken").addClass(seat.attr("ori_class"))

    add_ticket = (seat) ->
        session_unit_price = $("#session_unit_price").val()

        set_order_info(seat, session_unit_price)
        fill_in_order_form(seat)

    set_order_info = (seat, session_unit_price) ->
        $("#info_choosed_seats").append(seat.attr("title"))
        tickets_num = parseInt($("#info_tickets_num").text())
        tickets_num = if isNaN(tickets_num) then 1 else tickets_num + 1
        $("#info_tickets_num").text( tickets_num )
        total_expense = tickets_num * parseFloat(session_unit_price)
        $("#info_expense").text( total_expense.toFixed(1) )

    fill_in_order_form = (seat)->
        seats = JSON.parse $("#choosed_seats").val()
        seats.push(seat.attr("id"))
        $("#choosed_seats").val JSON.stringify(seats)
        $("#expense").val $("#info_expense").text()


