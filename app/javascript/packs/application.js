import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import initFullCalendar from '../components/fullcalendar';

if (document.getElementById('banner-typed-text')) {
}

if (document.getElementById('calendar')) {
  initFullCalendar();
}
  loadDynamicBannerText();
