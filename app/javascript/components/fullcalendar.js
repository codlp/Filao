import $ from 'jquery';
import 'fullcalendar';
import "fullcalendar/dist/fullcalendar.min.css";

const  initFullCalendar = () => {

  // page is now ready, initialize the calendar...
  $('#calendar').fullCalendar({
    events: [
    {
      title: 'Clapee UX ',
      start: '2019-03-17',
      end: '2019-03-19',
      color: '#6cd0b6',
      textColor: 'black',
      url: 'https://www.clapee.fr'

    },
    {
      title: 'Landing page creation',
      start: '2019-03-25',
      end: '2019-03-29',
      color: '#6cd0b6',
      textColor: 'black',
      url: 'https://www.filao.co/projects/8?step_id=18'
    }
    ]
  });

};

export default initFullCalendar;
