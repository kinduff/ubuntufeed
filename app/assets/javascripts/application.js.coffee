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


window.cargar_fechas = cargar_fechas
$ ->
  cargar_fechas()
  $('.loading').hide()

$('.social').on 'click', (e) ->
  e.preventDefault()
  $(this).hide()
  $(this).next('.share').toggle()

$("article").on("mouseenter", ->
  $(this).find('.social').show()
).on "mouseleave", ->
  $('.social, .share').hide()
