// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function(){
  // #back-to-topを消す
  $("#back-to-top").hide();

  // スクロールが十分された時に#back-to-topを表示。スクロールされたら非表示
  $(window).scroll(function(){
    // this(window要素)がどれだけスクロールしたかをscrollTop()を使って値を取る
    $('#pos').text($(this).scrollTop());
    if ($(this).scrollTop() > 60){
      $("#back-to-top").fadeIn();
    }else{
      $('#back-to-top').fadeOut();
    }

  });

  //#back-to-topがクリックされたら上に戻る
  // animateメソッドを使用
  $('#back-to-top a').click(function() {
      $('html, body').animate({
          scrollTop:0
      }, 800);
      return false;
  });

});

