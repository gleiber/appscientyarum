




$(function() {

  $('.i-checks').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green',
  });

    /* initialize the external events
    -----------------------------------------------------------------*/


    $('#external-events div.external-event').each(function () {

        // store data so the calendar knows to render an event upon drop
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick: true // maintain when user navigates (see docs on the renderEvent method)
          });

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex: 1111999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
          });

      });


    /* initialize the calendar
    -----------------------------------------------------------------*/
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    !function(a){"function"==typeof define&&define.amd?define(["jquery","moment"],a):"object"==typeof exports?module.exports=a(require("jquery"),require("moment")):a(jQuery,moment)}(function(a,b){!function(){"use strict";var a="ene._feb._mar._abr._may._jun._jul._ago._sep._oct._nov._dic.".split("_"),c="ene_feb_mar_abr_may_jun_jul_ago_sep_oct_nov_dic".split("_"),d=(b.defineLocale||b.lang).call(b,"es",{months:"enero_febrero_marzo_abril_mayo_junio_julio_agosto_septiembre_octubre_noviembre_diciembre".split("_"),monthsShort:function(b,d){return/-MMM-/.test(d)?c[b.month()]:a[b.month()]},monthsParseExact:!0,weekdays:"domingo_lunes_martes_miércoles_jueves_viernes_sábado".split("_"),weekdaysShort:"dom._lun._mar._mié._jue._vie._sáb.".split("_"),weekdaysMin:"do_lu_ma_mi_ju_vi_sá".split("_"),weekdaysParseExact:!0,longDateFormat:{LT:"H:mm",LTS:"H:mm:ss",L:"DD/MM/YYYY",LL:"D [de] MMMM [de] YYYY",LLL:"D [de] MMMM [de] YYYY H:mm",LLLL:"dddd, D [de] MMMM [de] YYYY H:mm"},calendar:{sameDay:function(){return"[hoy a la"+(1!==this.hours()?"s":"")+"] LT"},nextDay:function(){return"[mañana a la"+(1!==this.hours()?"s":"")+"] LT"},nextWeek:function(){return"dddd [a la"+(1!==this.hours()?"s":"")+"] LT"},lastDay:function(){return"[ayer a la"+(1!==this.hours()?"s":"")+"] LT"},lastWeek:function(){return"[el] dddd [pasado a la"+(1!==this.hours()?"s":"")+"] LT"},sameElse:"L"},relativeTime:{future:"en %s",past:"hace %s",s:"unos segundos",m:"un minuto",mm:"%d minutos",h:"una hora",hh:"%d horas",d:"un día",dd:"%d días",M:"un mes",MM:"%d meses",y:"un año",yy:"%d años"},ordinalParse:/\d{1,2}º/,ordinal:"%dº",week:{dow:1,doy:4}});return d}(),a.fullCalendar.datepickerLang("es","es",{closeText:"Cerrar",prevText:"&#x3C;Ant",nextText:"Sig&#x3E;",currentText:"Hoy",monthNames:["enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre"],monthNamesShort:["ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic"],dayNames:["domingo","lunes","martes","miércoles","jueves","viernes","sábado"],dayNamesShort:["dom","lun","mar","mié","jue","vie","sáb"],dayNamesMin:["D","L","M","X","J","V","S"],weekHeader:"Sm",dateFormat:"dd/mm/yy",firstDay:1,isRTL:!1,showMonthAfterYear:!1,yearSuffix:""}),a.fullCalendar.lang("es",{buttonText:{month:"Mes",week:"Semana",day:"Día",list:"Agenda"},allDayHtml:"Todo<br/>el día",eventLimitText:"más"})});

    $('.calendar').fullCalendar({        

      lang: 'es',
      monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
      monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
      dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
      dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      }, 

      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,

      eventSources: [

        // your event source
        {
            url: '/events.json', // use the `url` property
             color: 'yellow',    // an option!
            textColor: 'white'  // an option!
          }

        // any other sources...

        ],


        select: function(start, end) {
          $.getScript('/events/new', function() {
            $('#event_date_range').val(moment(start).format("DD/MM/YYYY HH:mm") + ' - ' + moment(end).format("DD/MM/YYYY HH:mm"))
            date_range_picker();
            $('.start_hidden').val(moment(start).format('DD-MM-YYYY HH:mm'));
            $('.end_hidden').val(moment(end).format('DD-MM-YYYY HH:mm'));
          });

          calendar.fullCalendar('unselect');
        },

        eventDrop: function(event, delta, revertFunc) {
          event_data = { 
            event: {
              id: event.id,
              start: event.start.format(),
              end: event.end.format()
            }
          };
          $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
          });
        },

        eventClick: function(event, jsEvent, view) {
          $.getScript(event.edit_url, function() {
            $('#event_date_range').val(moment(event.start).format("DD/MM/YYYY HH:mm") + ' - ' + moment(event.end).format("DD/MM/YYYY HH:mm"))
            date_range_picker();
            $('.start_hidden').val(moment(event.start).format('DD-MM-YYYY HH:mm'));
            $('.end_hidden').val(moment(event.end).format('DD-MM-YYYY HH:mm'));
          });
        },


        eventRender: function(event, element) {
          element.find(".fc-event-title").prepend("Evento: ");
          element.find(".fc-event-time").remove();
          var new_description =   
          '<div>Aula: '
          + event.aula+'</br>Solicitante: '+event.solicitante + '</div>';
          element.append(new_description);
        }



      });


    $('#calendar2').fullCalendar({        

      lang: 'es',
      monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
      monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
      dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
      dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      }, 

      eventSources: [

        // your event source
        {
            url: '/events.json', // use the `url` property
             color: 'yellow',    // an option!
            textColor: 'white'  // an option!
          }

        // any other sources...

        ],





        eventRender: function(event, element) {
          element.find(".fc-event-title").prepend("Evento: ");
          element.find(".fc-event-time").remove();
          var new_description =   
          '<div>Aula: '
          + event.aula+'</br>Solicitante:'+event.solicitante + '</div>';
          element.append(new_description);  
        }



      });   


  });








$(document).on('turbolinks:load', initialize_calendar);

