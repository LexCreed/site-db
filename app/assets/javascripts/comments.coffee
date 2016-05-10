# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form", (ev,data) ->
    console.log data
    $(this).find("textarea").val("")
    $("#comments-box").append("<artticle><header class='text-right be-small'></header><div class='row'><div class='col-xs-1 col-md-1'><div class='box'><img src=#{data.user.avatar}></div></div> - <div class='col-xs-11 col-md-10'><ul><div class='box'>#{data.body} - #{data.user.email}</div></ul></div></div></article>")
