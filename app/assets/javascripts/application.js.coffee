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

$("a.tw").on "click", (e) ->
  e.preventDefault()
  loc = $(this).attr("href")
  title = escape($(this).attr("title"))
  window.open "http://twitter.com/share?url=" + loc + "&text=" + title + "&via=ubuntuf" + "&related=kinduff", "twitterwindow", "height=450, width=550, top=" + ($(window).height() / 2 - 225) + ", left=" + $(window).width() / 2 + ", toolbar=0, location=0, menubar=0, directories=0, scrollbars=0"

$("a.fb").on "click", (e) ->
  e.preventDefault()
  loc = $(this).attr("href")
  title = escape($(this).attr("title"))
  window.open "http://www.facebook.com/sharer.php?u=" + loc + "&t=" + title, "facebookwindow", "height=450, width=550, top=" + ($(window).height() / 2 - 225) + ", left=" + $(window).width() / 2 + ", toolbar=0, location=0, menubar=0, directories=0, scrollbars=0"

$("a.copy").on "click", (e) ->
  e.preventDefault()
  window.prompt "Copiar a portapapeles: Ctrl+C, Enter", $(this).attr("href")
