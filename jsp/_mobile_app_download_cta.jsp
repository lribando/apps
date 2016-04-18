<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/gilt.tld" prefix="gg" %>


<c:set var="space" value=" "/>

<%--

    Dev note (display SMS banner while running locally)

      To tunnel target-cta-api from production run (from the project root level):
        gg-props-tunnel -lf -w target-cta-api production

      You can also whitelist a user guid in Target CTA Admin Dashboard (in section > Call to action)
        https://target-cta.tools.gilt.com
--%>


  <div id="download-mobile-sms">
     <div class="mobile-number-section">
       <div class="mobile-number-title">
         <gg:localizedString scope="target_cta" key="mobile_app_download_sms_banner_title"/>
         <a href="${gilt_ios_app_url}" target="_blank"><img src="/swift-legacy/images/default/apps/sms_apple.png" class="sms-apple"></a>
         <a href="${gilt_android_app_url}" target="_blank"><img src="/swift-legacy/images/default/apps/sms_google.png"></a>
       </div>
       <div class="mobile-sub-copy">
         <gg:localizedString scope="target_cta" key="mobile_app_download_sms_banner_sub_copy"/>
       </div>
       <form class="mobile-number-form" action="#">
         <fieldset class="field-bg">
           <dl class="dropdown-country">
             <dt>
               <a href="#" rel="nofollow">
                 <span class="flag-icon-sms-30x20"></span>
                 <span>
                   +1
                 </span>
               </a>
            </dt>
            <dd>
              <ul class="dropdown-country">
                <li>
                  <a id="sms-country-us" href="#">
                    United States (+1)
                  </a>
                </li>
                <li>
                  <a id="sms-country-au" href="#">
                    Australia (+61)
                  </a>
                </li>
                <li>
                  <a id="sms-country-ca" href="#">
                    Canada (+1)
                  </a>
                </li>
                <li>
                  <a id="sms-country-cn" href="#">
                    China (+86)
                  </a>
               </li>
                <li>
                  <a id="sms-country-hk" href="#">
                    Hong Kong (+852)
                  </a>
               </li>
               <li>
                  <a id="sms-country-ie" href="#">
                    Ireland (+353)
                  </a>
               </li>
               <li>
                  <a id="sms-country-jo" href="#">
                    Jordan (+962)
                  </a>
               </li>
               <li>
                  <a id="sms-country-mx" href="#">
                    Mexico (+52)
                  </a>
               </li>
               <li>
                  <a id="sms-country-ru" href="#">
                    Russia (+7)
                  </a>
               </li>
               <li>
                  <a id="sms-country-kr" href="#">
                    South Korea (+82)
                  </a>
               </li>
               <li>
                  <a id="sms-country-uk" href="#">
                    United Kingdom (+44)
                  </a>
               </li>
              </ul>
            </dd>
          </dl>
          <input id="mobile-number" class="sms-form" name="mobile-number" type="tel" maxlength="20" placeholder="(123) 456-7890">
            <a id="download-mobile-sms-send" class="button tint secondary" name="download-mobile-sms-send">
              <gg:localizedString scope="target_cta" key="mobile_app_download_sms_banner_send_button"/>
            </a>
            </fieldset>
            <p class="sms-status-msg status-confirmed">
              <gg:localizedString scope="target_cta" key="mobile_app_download_sms_banner_status_confirmed"/>
            </p>
            <p class="sms-status-msg status-error">
              <gg:localizedString scope="target_cta" key="mobile_app_download_sms_banner_status_error"/>
            </p>
            <p class="sms-tnc">
              <gg:localizedString scope="target_cta" key="mobile_app_download_sms_banner_tnc"/>
            </p>
        </form>
      </div>
    </div>

<gg:accum type="script">
  if (Gilt.AppsPage) {
     Gilt.AppsPage.init();
  }
  (function() {
      requireModules(['src.mobile_app_download_cta'],
        function (mobileAppDownloadCta) {
          var targetCtaApiUrl = '${mobile_app_download_cta_api_url}';
          var userGuid = '${user_guid}';
          var userDefaultCountry = '${mobile_app_download_cta_default_country}';

          mobileAppDownloadCta.init(targetCtaApiUrl, userGuid, userDefaultCountry);
        }
      );
    })();
</gg:accum>

