import $ from 'jquery';
import 'fullcalendar';
import "fullcalendar/dist/fullcalendar.min.css";

const  initFullCalendar = () => {

  // page is now ready, initialize the calendar...
  $('#calendar').fullCalendar({
    // put your options and callbacks here
  })

};

export default initFullCalendar;
