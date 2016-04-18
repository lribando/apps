/*jshint asi: false, bitwise: true, boss: false, curly: true, eqeqeq: true, eqnull: false, evil: false, forin: false, immed: true, laxbreak: false, newcap: true, noarg: true, noempty: true, nonew: false, nomen: false, onevar: true, plusplus: false, regexp: false, undef: true, sub: false, strict: false, white: false */
/*jshint browser: true, maxerr: 50, passfail: false */
/*global createModule: false*/

/**
 * @module src.mobile_app_download_cta
 */

createModule('src.mobile_app_download_cta',
  [
    'vendor.jquery',
    'common.message'
  ],
  function ($, message) {

    var init = function(targetCtaApiUrl, userGuid, userDefaultCountry) {
      if (!(targetCtaApiUrl && userGuid && userDefaultCountry)) {
        return;
      }

      var sendSms = (function() {
        var PENDING = 'pending',
            DELIVERED = 'delivered',
            INVALID_NATIONAL_NUMBER = 'invalid_national_number',
            DELIVERY_ERROR = 'delivery_error',
            LIMIT_REACHED = 'limit_reached';

        var clearStatus = function() {
          $('.sms-status-msg').hide();
          $('.sms-tnc').removeClass('sms-tnc-with-status');
          $('#download-mobile-sms #mobile-number').removeClass('error-hinting');
        };

        var displaySuccess = function() {
          $('.sms-tnc').addClass('sms-tnc-with-status');
          $('.sms-status-msg.status-confirmed').show();
        };

        var displayFailure = function(msg) {
          $('.sms-tnc').addClass('sms-tnc-with-status');
          $('.sms-status-msg.status-error')
            .text(msg)
            .show();
          $('#download-mobile-sms #mobile-number').addClass('error-hinting');
        };

        var handleSmsResponse = function(res) {
          if (!res) {
            return displayFailure(message.get('target_cta', 'mobile_app_download_general_error'));
          }

          var state = res.state;
          if (state === PENDING || state === DELIVERED) {
            displaySuccess();
          } else {
            if (state === INVALID_NATIONAL_NUMBER) {
              displayFailure(message.get('target_cta', 'mobile_app_download_invalid_number'));
            } else if (state === DELIVERY_ERROR) {
              displayFailure(message.get('target_cta', 'mobile_app_download_delivery_error'));
            } else if (state === LIMIT_REACHED) {
              displayFailure(message.get('target_cta', 'mobile_app_download_limit_reached'));
            } else {
              displayFailure(message.get('target_cta', 'mobile_app_download_general_error'));
            }
          }
        };

        return function(mobileCountryCode, mobileNationalNumber) {
          clearStatus();
          var smsActionsUrl = targetCtaApiUrl + '/sms_actions';
          var data = {
            cta_type: "mobile_app_download_sms",
            user_guid: userGuid,
            mobile_country_code: mobileCountryCode,
            mobile_national_number: mobileNationalNumber
          };
          $.ajax({
            type: "POST",
            url: smsActionsUrl,
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: function(res) {
              handleSmsResponse(res);
            },
            error: function() {
              displayFailure(message.get('target_cta', 'mobile_app_download_general_error'));
            }
          });
        };
      })();

      var submitForm = function(mobileNationalNumber, mobileCountryCode) {
        sendSms(mobileCountryCode, mobileNationalNumber);
      };

      $("#download-mobile-sms-send[name='download-mobile-sms-send']").on('click touchstart', function(e) {
        var mobileNationalNumber = $(this).prev().val();
        var mobileCountryCodeParent = $(this).siblings(".dropdown-country");
        var mobileCountryCodeDt = mobileCountryCodeParent.children();
        var mobileCountryCode = mobileCountryCodeDt.children("a").text();
        submitForm(mobileNationalNumber, mobileCountryCode);
        e.preventDefault();
      });

      $('#mobile-number').keydown(function(e) {
        if (e.keyCode === 13) {
          submitForm();
          e.preventDefault();
        }
      });

      var countriesIdToFlags = {
        "sms-country-us": {
          "flag": "flag-us-sms-30x20",
          "code": "+1"
        },
        "sms-country-au": {
          "flag": "flag-au-sms-30x20",
          "code": "+61"
        },
        "sms-country-ca": {
          "flag": "flag-ca-sms-30x20",
          "code": "+1"
        },
        "sms-country-cn": {
          "flag": "flag-cn-sms-30x20",
          "code": "+86"
        },
        "sms-country-hk": {
          "flag": "flag-hk-sms-30x20",
          "code": "+852"
        },
        "sms-country-ie": {
          "flag": "flag-ie-sms-30x20",
          "code": "+353"
        },
        "sms-country-jo": {
          "flag": "flag-jo-sms-30x20",
          "code": "+962"
        },
        "sms-country-mx": {
          "flag": "flag-mx-sms-30x20",
          "code": "+52"
        },
        "sms-country-ru": {
          "flag": "flag-ru-sms-30x20",
          "code": "+7"
        },
        "sms-country-kr": {
          "flag": "flag-kr-sms-30x20",
          "code": "+82"
        },
        "sms-country-uk": {
          "flag": "flag-uk-sms-30x20",
          "code": "+44"
        }
      };

      var setDropdownCountry = function(country, dropdownSelector) {
        var text = '<span class="flag-icon-sms-30x20 ' + country.flag + '" ' + '></span>' + country.code;
        dropdownSelector = dropdownSelector || $('.dropdown-country dt a');
        dropdownSelector.html(text);

        $('.dropdown-country dd ul').hide();
        if (country.code !== '+1') {
          $("#mobile-number[name='mobile-number']").removeAttr("placeholder");
        } else {
          $("#mobile-number[name='mobile-number']").attr("placeholder", "(123) 456-7890");
        }
        if($('#mobile-number').val().length >= 1) {
          $('#mobile-number').val('');
        }
      };

      $('.dropdown-country dt a').on('touchstart click', function() {
        var dropdownParent = $(this).parent().next();
        var dropdownList = dropdownParent.children();
        dropdownList.show();
        $('.dropdown-country').mouseleave(function() {
          dropdownList.hide();
        });
        return false;
      });

      $('.dropdown-country dd ul li a').on('touchstart click', function() {
        var dropdownContainer = $(this).parents("dd").prev();
        var dropdownSelector = dropdownContainer.children();
        var countryId = $(this).attr("id");
        var country = countriesIdToFlags[countryId];
        if (country) {
          setDropdownCountry(country, dropdownSelector);
        }
        return false;

      });

      var initCountryField = function() {
        var initCountry = countriesIdToFlags["sms-country-us"];
        var userDefaultCountryId = "sms-country-" + userDefaultCountry;
        var userDefaultCountryObj = countriesIdToFlags[userDefaultCountryId];
        if (userDefaultCountryObj) {
          initCountry = userDefaultCountryObj;
        }
        setDropdownCountry(initCountry);
      };

      initCountryField();
    };

    return {
      init: init
    };
  }
);