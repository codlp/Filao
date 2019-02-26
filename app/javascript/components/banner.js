import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["The perfect dashboard For", "Freelancers"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
