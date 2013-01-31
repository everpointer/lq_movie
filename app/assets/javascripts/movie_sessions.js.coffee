# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("#seats_wrapper table>tbody>tr>td").click ->
    seat = $(this)
    if seat.hasClass("seat_single_available")
        seat.removeClass("seat_single_available").addClass("seat_taken")
    else if seat.hasClass("seat_double_available")
        seat.removeClass("seat_double_available").addClass("seat_taken")
    else if seat.hasClass("seat_taken")
        seat.removeClass("seat_taken").addClass(seat.attr("ori_class"))

