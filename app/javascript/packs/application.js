import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import initFullCalendar from '../components/fullcalendar';
import initDropzone from '../components/dropzone';
import "../components/flatpickr"

if (document.getElementById('banner-typed-text')) {
}

if (document.getElementById('calendar')) {
  initFullCalendar();
}
  loadDynamicBannerText();

// loadDynamicBannerText();
initDropzone();

