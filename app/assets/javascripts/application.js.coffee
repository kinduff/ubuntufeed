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
cargar_fechas()
$('.loading').hide()

$(document).on 'click', '.social', (e) ->
  e.preventDefault()
  $(this).hide()
  $(this).next('.share').show()

$(".contenedor").on("mouseenter", 'article', ->
  $(this).find('.social').show()
).on "mouseleave", 'article', ->
  $('.social, .share').hide()

$(document).on "click", 'a.tw', (e) ->
  e.preventDefault()
  loc = $(this).attr("href")
  title = $(this).attr("title")
  window.open "http://twitter.com/share?url=" + loc + "&text=" + title + "&via=ubuntuf" + "&related=kinduff", "twitterwindow", "height=450, width=550, top=" + ($(window).height() / 2 - 225) + ", left=" + $(window).width() / 2 + ", toolbar=0, location=0, menubar=0, directories=0, scrollbars=0"

$(document).on "click", 'a.fb', (e) ->
  e.preventDefault()
  loc = $(this).attr("href")
  title = escape($(this).attr("title"))
  window.open "http://www.facebook.com/sharer.php?u=" + loc + "&t=" + title, "facebookwindow", "height=450, width=550, top=" + ($(window).height() / 2 - 225) + ", left=" + $(window).width() / 2 + ", toolbar=0, location=0, menubar=0, directories=0, scrollbars=0"

$(document).on "click", 'a.copy', (e) ->
  e.preventDefault()
  window.prompt "Copiar a portapapeles: Ctrl+C, Enter", $(this).attr("href")

$(document).on 'click', '.menutrigger', (e) ->
  e.preventDefault()
  $('.menu').toggle()

counter = 0
$(window).scroll ->
  unless counter >= 3
    if $(window).scrollTop() + $(window).height() >= $(document).height()
      $('a.load').trigger('click')
      counter += 1

$("a.cerrar").on "click", (e) ->
  e.preventDefault()
  $('aside.form form, aside .contenedor').animate
    marginTop: -1000
  , 500
  $('aside.form, aside').fadeOut()

$(document).ready ->
  unless $.cookie('encuesta') == '1'
    $('aside.form').delay(500).fadeIn()
    $('aside.form form').delay(500).animate
      marginTop: -225
    , 500
  $.cookie('encuesta', '1')

