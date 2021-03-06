import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerTypedText = document.getElementById('banner-typed-text');
  if (bannerTypedText) {
    new Typed('#banner-typed-text', {
      strings: ["The perfect dashboard for Freelancers"],
      typeSpeed: 50,
      loop: true
    });
  }
};

export { loadDynamicBannerText };
