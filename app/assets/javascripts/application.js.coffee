#= require jquery
#= require jquery_ujs
#= require underscore
#= require_tree .
cargar_fechas = ->
  $(".fecha").each (i) ->
    fecha = $(this).data("date")
    $("[data-date=" + fecha + "]").slice(1).hide()

if $(".prev").length > 0
  $(".prev").after current_page
 else 
  $(".next").before("< 1")

window.cargar_fechas = cargar_fechas
$ ->
  cargar_fechas()
