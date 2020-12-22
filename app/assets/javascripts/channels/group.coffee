jQuery(document).on 'turbolinks:load', ->
  # viewの<div id="messages">から受け取る
  messages = $('#messages')
  if $('#messages').length > 0


App.group = App.cable.subscriptions.create "GroupChannel", { channel: "GroupChannel", Group_id: messages.data('group_id') },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=group_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
