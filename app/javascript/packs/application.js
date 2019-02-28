import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import initFullCalendar from '../components/fullcalendar';
import initDropzone from '../components/dropzone';
import "../components/flatpickr"
import { initSweetalert } from '../components/init_sweetalert';
import { initSortable } from '../components/init_sortable';

initSweetalert('#sweet-alert', {
  title: "Profil Update",
  text: "Great your profile is up-to-date",
  icon: "success"
}, (value) => {
  console.log(value);
});

if (document.getElementById('banner-typed-text')) {
}

if (document.getElementById('calendar')) {
  initFullCalendar();
}


initSweetalert();
loadDynamicBannerText();
initDropzone();

