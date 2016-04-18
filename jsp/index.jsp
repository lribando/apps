<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/gilt.tld" prefix="gg" %>

<section class="apps login-reg-wall-override">
  <ul class="apps-list">
    <c:if test="${!empty no_app_for_device && no_app_for_device}">
      <center>
        <li class="app main error-message">
          <section class="app-content error-message">
            <h2 class="h2 accent">We're sorry</h2>
            <h3 class="h3">We don't have a mobile app for your device.</h3><br>
            <h3 class="h3 button-align">
              <a class="button tint primary" href="/">Continue Shopping</a>
            </h3>
          </section>
        </li>
      </center>
    </c:if>

    <li class="app main">
      <section class="app-content">
        <h2 class="h2 slideshow-overlay-text">Wherever You Go, There You Shop</h2>
        <h3 class="h3 slideshow-overlay-text">Shop Gilt anytime you like &mdash; on your desktop, phone, tablet, even Apple TV.</h3>
        <ul class="overlay-cta-container">
          <a href"#" target="blank"><li class="overlay-cta cta-padding">Apple TV</li></a>
          <a href"${gilt_ios_app_url}" target="blank"><li class="overlay-cta cta-padding">iPhone &amp; iPad</li></a>
          <a href"${gilt_android_app_url}" target="blank"><li class="overlay-cta">Android</li></a>
        </ul>
        <div class="slideshow-container">
          <div class="slideshow-buttons">
            <input type="radio" id="button-1" name="controls" checked="checked"/>
            <label class="button-selector" id="button-1" for="button-1"></label>
            <input type="radio" id="button-2" name="controls"/>
            <label class="button-selector" id="button-2" for="button-2"></label>
            <input type="radio" id="button-3" name="controls"/>
            <label class="button-selector" id="button-3" for="button-3"></label>
            <input type="radio" id="button-4" name="controls"/>
            <label class="button-selector" id="button-4" for="button-4"></label>

            <div class="slideshow-inner">
              <ul class="slideshow-list">
                <li class="slideshow-image slideshow_1"></li>
                <li class="slideshow-image slideshow_2"></li>
                <li class="slideshow-image slideshow_1"></li>
                <li class="slideshow-image slideshow_2"></li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    </li>

    <c:if test="${!empty user_guid}">
      <li class="app sms">
        <%@ include file="partials/_mobile_app_download_cta.jsp" %>
      </li>
    </c:if>

    <li class="app tvos" id="tvos-app">
      <section class="app-content">
        <div class="tvos-copy">
          <h2 class="h2 accent">Sit Back, Relax &amp; Shop</h2>
          <dl class="quote accent">
            <dt class="accent">Fun for the whole family &mdash; shop top designers from your comfy couch with Gilt for Apple TV. Plus, enjoy a closer look with the app's beautiful, hi-res imagery.</dt>
            <dd>App Store Best of 2015</dd>
          </dl>
          <img src="/swift-legacy/images/default/apps/appstore_best.jpg" class="bestof">
        </div>
        <div class="tvos-image"></div>
      </section>
    </li>

    <li class="app ipad" id="ipad-app">
      <section class="app-content">
        <div class="right">
          <h2 class="h2 accent">Tap into the Gilt App</h2>
          <h3 class="android-subheader">Download Gilt for iPhone and iPad in the App Store ></h3>
          <dl class="quote accent">
            <dt class="accent">&ldquo;The app is easy-to-use and easy on the eyes. I think it's a great one to &mdash; literally &mdash; have on hand.&rdquo;</dt>
            <dd class="quote-source">- Mobile User</dd>
          </dl>
          <a href="${gilt_ios_app_url}" class="download ipad app-center" target="_blank" data-app-name="ipad">Download iPad App</a>
          <div class="ipad-rating"></div>
        </div>
        <div class="ipad-image"></div>
      </section>
    </li>
    <li class="app features" id="features">
      <%@ include file="partials/features_carousel.jsp" %>
    </li>
    <li class="app android" id="android-app">
      <section class="app-content">
        <div class="android-copy">
          <h2 class="h2 accent">Gilt for Android</h2>
          <h3 class="android-subheader">Download Gilt for iPhone and iPad in the App Store ></h3>
          <div class="android-quote accent">Find what you want, fast &mdash; we've updated the Gilt for Android app with an easy search feature and more filtering options.</div>
          <a href="${gilt_android_app_url}" class="download android app-center" target="_blank" data-app-name="android">Download Google Play App</a>
          <div class="android-rating"></div>
        </div>
        <div class="android-image"></div>
      </section>
    </li>

    <c:if test="${!empty user_guid}">
      <li class="app sms">
        <%@ include file="partials/_mobile_app_download_cta.jsp" %>
      </li>
    </c:if>

  </ul>
</section>

<gg:accum type="script">
  if (Gilt.AppsPage) {
     Gilt.AppsPage.init();
  }

  requireModules(['src.features_slideshow'],
    function (featuresSlideshow) {
      featuresSlideshow.init();
    }
  );


</gg:accum>
