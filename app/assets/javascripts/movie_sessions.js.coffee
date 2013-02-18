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

        $("#choosed_seats").append(seat.attr("title"))
        tickets_num = parseInt($("#tickets_num").text())
        tickets_num = if isNaN(tickets_num) then 1 else tickets_num + 1
        $("#tickets_num").text( tickets_num )
        total_expense = tickets_num * parseFloat(session_unit_price)
        $("#total_expense").text( total_expense.toFixed(1) )


