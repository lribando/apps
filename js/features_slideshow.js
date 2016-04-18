/*jshint asi: false, bitwise: true, boss: false, curly: true, eqeqeq: true, eqnull: false, evil: false, forin: false, immed: true, laxbreak: false, newcap: true, noarg: true, noempty: true, nonew: false, nomen: false, onevar: true, plusplus: false, regexp: false, undef: true, sub: false, strict: false, white: false */
/*jshint browser: true, maxerr: 50, passfail: false */
/*global createModule: false*/

/**
 * @module src.features_slideshow
 */

createModule('src.features_slideshow',
  [
    'vendor.jquery'
  ],
  function featuresSlideshow($) {

    function init() {
      var feature = $('.features-content');
      var listIndex = 0;
      var listPositionCalc;
      var buttonSelected = 0;

      function scrollRight() {
        if (screen.width < 766) {
          listIndex += -(1) * 100;
          listPositionCalc = (feature.length - 1) * -100;
        } else {
          listIndex += -(1) * 50;
          listPositionCalc = (feature.length - 2) * -50;
        }

        if (listIndex >= listPositionCalc) {
          $('.features-container').css({"left": listIndex + "%"});
          buttonSelected += 1;
          $('.features-button-selector').removeClass('features-button-selected');
          $('.features-button-selector').eq(buttonSelected).addClass('features-button-selected');
        } else {
          listIndex -= -(100);
        }
        return listIndex;
      }

      function scrollLeft() {
        if (screen.width < 766) {
          listIndex -= -(100);
        } else {
          listIndex -= -(50);
        }
        $('.features-container').css({
          left: function() {
            if (listIndex <= 0) {
              $('.features-container').css({"left": listIndex + "%"});
              buttonSelected -= 1;
              $('.features-button-selector').removeClass('features-button-selected');
              $('.features-button-selector').eq(buttonSelected).addClass('features-button-selected');
            }
          }
        });
      }

      $('.features-right-arrow').on('touchstart click', function() {
        scrollRight(); //TODO: disable function call on last slide (at -200%)
      });

      $('.features-left-arrow').on('touchstart click', function() {
        scrollLeft(); //TODO: disable function call on last slide (at -0%)
      });

      $('#features-button-1').on('touchstart click', function() {
        $('.features-button-selector').removeClass('features-button-selected');
        $('.features-container').css({"left":"0%"});
        $(this).addClass('features-button-selected');
      });

      $('#features-button-2').on('touchstart click', function() {
        $('.features-button-selector').removeClass('features-button-selected');
        if (screen.width < 766) {
          $('.features-container').css({"left":"-100%"});
        } else {
          $('.features-container').css({"left":"-50%"});
        }
        $(this).addClass('features-button-selected');
      });

      $('#features-button-3').on('touchstart click', function() {
        $('.features-button-selector').removeClass('features-button-selected');
        $('.features-container').css({"left":"-200%"});
        $(this).addClass('features-button-selected');
      });
    };
  return {
    init: init
  };
});