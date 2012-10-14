# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('select#campaign_currency').live('change', ->
  amount = $('#campaign_amount')
  amount.focus() if amount.val() == ''
)

$('input.permalink').live('focus', (event) ->
  element = this
  setTimeout( ->
    element.setSelectionRange(0, 9999)
  , 1)
  return true
  #debugger
).live('mouseup', (event) ->
  event.preventDefault()
)
