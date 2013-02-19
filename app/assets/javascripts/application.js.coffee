#= require jquery
#= require jquery_ujs
#= require_tree .
$(".fecha").each (i) ->
  fecha = $(this).attr("class").split(" ")[0]
  $("." + fecha).slice(1).hide()
