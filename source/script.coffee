doc = document
win = window

class App
  constructor: ->
    do @onStart
  onStart: ->
    setTimeout ->
      $('#greeting').fadeOut 'slow'
    , 2500
    setTimeout ->
      $('#greeting-wrapper').fadeOut 'slow'
    , 3000
    setTimeout ->
      do $('#greeting-wrapper').remove
    , 3500

new App
