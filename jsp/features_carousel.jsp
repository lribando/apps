<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/gilt.tld" prefix="gg" %>


<c:set var="space" value=" "/>
  <section>
    <header>
      <h2 class="h2 features">Gilt for iPhone &amp; iPad</h2>
    </header>
    <article class="dom-carousel features-container">
      <div class="dom-carousel-viewport">
        <div class="dom-carousel-wrapper">
          <section class="dom-carousel-container">
            <article class="features-content features-spacing">
              <a href="#" target="_blank"><img class="features-img" src="/swift-legacy/images/default/apps/feature1.jpg" border="0"></a>
              <dl class="features-copy">
                <dt class="features-hdr">Real-Time Alerts</dt>
                <dd class="features-subcopy">Choose what you'd like to be notified about, from sale start times to order updates</dd>
              </dl>
            </article>
            <article class="features-content features-spacing">
              <a href="#" target="_blank"><img class="features-img" src="/swift-legacy/images/default/apps/feature1.jpg" border="0"></a>
              <dl class="features-copy">
                <dt class="features-hdr">Real-Time Alerts</dt>
                <dd class="features-subcopy">Choose what you'd like to be notified about, from sale start times to order updates</dd>
              </dl>
            </article>
            <article class="features-content">
              <a href="#" target="_blank"><img class="features-img" src="/swift-legacy/images/default/apps/feature1.jpg" border="0"></a>
              <dl class="features-copy">
                <dt class="features-hdr">Real-Time Alerts</dt>
                <dd class="features-subcopy">Choose what you'd like to be notified about, from sale start times to order updates</dd>
              </dl>
            </article>
          </section>
        </div>
      </div>
    </article>
    <div class="features-slideshow-buttons">
      <button class="features-button-selector features-button-selected" id="features-button-1" >&#8226;</button>
      <button class="features-button-selector" id="features-button-2">&#8226;</button>
      <button class="features-button-selector" id="features-button-3">&#8226;</button>
    </div>
  </section>

<gg:accum type="script">
  if (Gilt.AppsPage) {
     Gilt.AppsPage.init();
  }
  (function() {
      requireModules(['src.features_carousel'],
        function (featuresCarousel) {
          featuresCarousel.init();
        }
      );
    })();
</gg:accum>

