import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import initFullCalendar from '../components/fullcalendar';
import { initDropzone, toggleTaskMessages } from '../components/dropzone';
import "../components/flatpickr";
import { initSweetalert } from '../components/init_sweetalert';
import initAOS from "../components/init_aos.js";

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

initSweetalert('#sweet-alert-task-complete', {
  title: "Great job!",
  text: "Your task is completed!",
  icon: "success"
}, (value) => {
});

initSweetalert('#sweet-alert-project-complete', {
  title: "Great job!",
  text: "Your project is completed!",
  icon: "success"
}, (value) => {
});

initSweetalert('#sweet-alert-demo', {
  title: "Are you sure?",
  text: "This action cannot be reversed",
  icon: "warning",
  showCancelButton: true
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
toggleTaskMessages();
initSweetalert();

initAOS();

