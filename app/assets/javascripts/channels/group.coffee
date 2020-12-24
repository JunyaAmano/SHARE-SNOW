App.group = App.cable.subscriptions.create { channel: "GroupChannel", group_id: $('#chats').data('group_id') },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (message) ->
    $('#chats').append(message['message']) # 投稿を追加

  speak: (message) ->
    @perform 'speak', message: message


  $(document).on 'keypress', '[data-behavior~=group_speaker]', (event) ->
    if event.keyCode is 13
      App.group.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-group]').attr('data-group')]
      event.target.value = ''
      event.preventDefault()