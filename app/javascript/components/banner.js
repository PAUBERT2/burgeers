// app/javascript/components/banner.js
import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["made with passion","near you", "with cailloux", "even for Sam"],
    typeSpeed: 250,
    loop: true
  });
}

export { loadDynamicBannerText };
