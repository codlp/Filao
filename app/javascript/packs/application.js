import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import initFullCalendar from '../components/fullcalendar';
import initDropzone from '../components/dropzone';
import "../components/flatpickr"
import { initSweetalert } from '../components/init_sweetalert';

initSweetalert('#sweet-alert', {
  title: "Profil Update",
  text: "Great your profile is up-to-date",
  icon: "success"
}, (value) => {
  console.log(value);
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


loadDynamicBannerText();
initDropzone();
initSweetalert();

