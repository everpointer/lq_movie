# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# ui-slide implementation
$ ->
    UISlide = {
        size: 4
        max: parseInt($(".ui-slide-max").text())
        view_size: 608
    }

    $(".ui-slide-control .btn-next").click (event) ->
        event.preventDefault()
        slide_move op: "next"
    $(".ui-slide-control .btn-prev").click (event) ->
        event.preventDefault()
        slide_move op: "prev"

    slide_move = (options) ->
        options.op = "next" if options.op is undefined

        slide_index = parseInt($(".ui-slide-index").text())

        if options.op is "next" && slide_index + 1 <= UISlide.max
            # $(".ui-slide-content").css("left", "-" + UISlide.view_size)
            slide_index++
        else if options.op is "prev" && slide_index - 1 >= 1
            # $(".ui-slide-content").css("left", options.view_size)
            slide_index--
        slide_left_value = (slide_index - 1) * UISlide.view_size  
        if slide_left_value isnt 0
            slide_left = "-" + slide_left_value + "px"
        else
            slide_left = slide_left_value

        $(".ui-slide-content").css("left", slide_left)
        $(".ui-slide-index").text slide_index 

        reset_slide_control(slide_index)

    reset_slide_control = (slide_index) ->
        btn_prev = $(".ui-slide-control .btn-prev")
        btn_next = $(".ui-slide-control .btn-next")

        if slide_index is 1
            btn_prev.addClass("btn-disabled")
        else
            btn_prev.removeClass("btn-disabled")

        if slide_index >= UISlide.max
            btn_next.addClass("btn-disabled")
        else
            btn_next.removeClass("btn-disabled")

.call(jQuery)