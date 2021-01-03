
document.addEventListener('turbolinks:load', () => {
  jQuery(document).ready(function(){

    // js.erb 内で使用できるように変数を定義しておく
    window.messageContainer = document.getElementById('chat_room_name')

    // 以下のプログラムが他のページで動作しないようにしておく
    if (messageContainer === null) {
        return
    }

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
          scrollToBottom();
          return event.preventDefault();
        }
      }));

      const documentElement = document.documentElement
    // js.erb 内でも使用できるように変数を決定
      const messageContent = document.getElementById('message_content')
    // 一番下まで移動する関数。js.erb 内でも使用できるように変数を決定
      const scrollToBottom = () => {
        window.scroll(0, documentElement.scrollHeight)
      }
      // 最初にページ一番下へ移動させる
      scrollToBottom()

      let oldestMessageId
      // メッセージの追加読み込みの可否を決定する変数
      window.showAdditionally = true

      // 無限スクロール機能（不具合有）
      // window.addEventListener('scroll', () => {
          // if (documentElement.scrollTop === 0 && showAdditionally) {
              // showAdditionally = false
              // 表示済みのメッセージの内，最も古いidを取得
              // console.log('test')
              // oldestMessageId = $('.chat:first').data('chat_id')
              // Ajax を利用してメッセージの追加読み込みリクエストを送る。最も古いメッセージidも送信しておく。
              // $.ajax({
                  // type: 'GET',
                  // url: '/show_additionally',
                  // cache: false,
                  // data: {oldest_chat_id: oldestMessageId, remote: true}
              // })
          // }
      // }, {passive: true});

  });
});