import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import initFullCalendar from '../components/fullcalendar';
import { initDropzone, toggleTaskMessages } from '../components/dropzone';
import "../components/flatpickr";
import { initSweetalert } from '../components/init_sweetalert';
import "../components/init_aos.js";


initSweetalert('#sweet-alert', {
  title: "Profil Updated",
  text: "Great your profile is up-to-date",
  icon: "success"
}, (value) => {
});

initSweetalert('#sweet-alert-task', {
  title: "Task created 🚀",
  text: "Great your task is create",
  icon: "success"
}, (value) => {
});

initSweetalert('#sweet-alert-demo', {
  title: "Are you sure?",
  text: "This action cannot be reversed",
  icon: "warning"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});

if (document.getElementById('banner-typed-text')) {
}

if (document.getElementById('calendar')) {
  initFullCalendar();
}


AOS.init({
  // Global settings:
  disable: false, // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
  startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
  initClassName: 'aos-init', // class applied after initialization
  animatedClassName: 'aos-animate', // class applied on animation
  useClassNames: false, // if true, will add content of `data-aos` as classes on scroll
  disableMutationObserver: false, // disables automatic mutations' detections (advanced)
  debounceDelay: 50, // the delay on debounce used while resizing window (advanced)
  throttleDelay: 99, // the delay on throttle used while scrolling the page (advanced)


  // Settings that can be overridden on per-element basis, by `data-aos-*` attributes:
  offset: 120, // offset (in px) from the original trigger point
  delay: 0, // values from 0 to 3000, with step 50ms
  duration: 400, // values from 0 to 3000, with step 50ms
  easing: 'ease', // default easing for AOS animations
  once: false, // whether animation should happen only once - while scrolling down
  mirror: false, // whether elements should animate out while scrolling past them
  anchorPlacement: 'top-bottom', // defines which position of the element regarding to window should trigger the animation
});


loadDynamicBannerText();
initDropzone();
toggleTaskMessages();
initSweetalert();

