// Put your application scripts here
(function($) {
  'use strict';
  $('.radio-button').click(function(){
    //$(this).find('.radio').toggleClass('radio-hide radio-display');
    //$(this).siblings('.radio-button').find('.radio').toggleClass('radio-hide radio-display');

    $('#discourse-entry').find('.form').toggleClass('hidden');
  });
}(jQuery));
