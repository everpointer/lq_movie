# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $("#seats_wrapper table>tbody>tr>td").click ->
        seat = $(this)
        if seat.hasClass("seat_taken")
            seat.removeClass("seat_taken").addClass(seat.attr("ori_class"))
            remove_ticket(seat)
        else if $(".seat_taken").length is 4
            alert("一次最多选择4个座位")
        else if seat.hasClass("seat_single_available")
            seat.removeClass("seat_single_available").addClass("seat_taken")
            add_ticket(seat)
        else if seat.hasClass("seat_double_available")
            seat.removeClass("seat_double_available").addClass("seat_taken")
            add_ticket(seat)

    $("#btn_mobile_save").click ->
        $("#mobile_box_input").css("display", "none");
        $("#mobile_box_label").css("display", "block");
        $("#order_mobile_label").text $("#order_mobile_input").val()
        $("#session_order_mobile").val $("#order_mobile_input").val()

    $("#btn_mobile_modify").click ->
        $("#mobile_box_label").css("display", "none")
        $("#mobile_box_input").css("display", "block")
        $("#order_mobile_input").val $("#session_order_mobile").val()

    $("#submit_order").click (event)->
        event.preventDefault()
        $(this).text "订单生成中..."
        $(".payment").css("display", "block")

    add_ticket = (seat) ->
        session_unit_price = $("#session_unit_price").val()

        add_order_info(seat, session_unit_price)
        fill_in_order_form(seat)

    remove_ticket = (seat) ->
        session_unit_price = $("#session_unit_price").val()
        remove_order_info(seat, session_unit_price)
        fill_in_order_form(seat)

    add_order_info = (seat, session_unit_price) ->
        $("#info_choosed_seats").append("<span>" + seat.attr("title") + "<span>")
        tickets_num = parseInt($("#info_tickets_num").text())
        tickets_num = if isNaN(tickets_num) then 1 else tickets_num + 1
        $("#info_tickets_num").text( tickets_num )
        total_expense = tickets_num * parseFloat(session_unit_price)
        $("#info_expense").text( total_expense.toFixed(1) )

    remove_order_info = (seat, session_unit_price) ->
        $("#info_choosed_seats span").each (index, choosed_seat) ->
            choosed_seat = $(choosed_seat)
            if choosed_seat.text() is seat.attr("title")
                choosed_seat.remove() 
                tickets_num = parseInt($("#info_tickets_num").text()) - 1
                $("#info_tickets_num").text( tickets_num )
                total_expense = tickets_num * parseFloat(session_unit_price)
                $("#info_expense").text( total_expense.toFixed(1) )

    fill_in_order_form = (seat)->
        seats = JSON.parse $("#choosed_seats").val()
        seats.push(seat.attr("id"))
        $("#choosed_seats").val JSON.stringify(seats)
        $("#expense").val $("#info_expense").text()


