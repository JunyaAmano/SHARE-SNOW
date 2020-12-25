document.addEventListener('turbolinks:load', () => {
  jQuery(document).ready(function(){

    const documentElement = document.documentElement;
    // js.erb 内でも使用できるように変数を決定
    window.messageContent = document.getElementById('chats');
    // 一番下まで移動する関数。js.erb 内でも使用できるように変数を決定
    window.scrollToBottom = () => {
        window.scroll(0, documentElement.scrollHeight)
    };
    // 最初にページ一番下へ移動させる
    App.group = App.cable.subscriptions.create({
        channel: "GroupChannel",
        group_id: $('#chats').data('group_id')
      },
      {
        connected: function() {},

        disconnected: function() {},

        received: function(message) {
          return $('#chats').append(message['message']);
        },

        speak: function(message) {
          return this.perform('speak', {
            message: message
          });
        }
      },

      $(document).on('keypress', '[data-behavior~=group_speaker]', function(event) {
        if (event.keyCode === 13) {
          App.group.speak([event.target.value, $('[data-user]').attr('data-user'), $('[data-group]').attr('data-group')]);
          event.target.value = '';
          return event.preventDefault();
        }
      }));
  });
});