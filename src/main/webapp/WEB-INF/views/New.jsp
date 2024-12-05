<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    	    <style>
	    
			.fc-day-sun .fc-col-header-cell-cushion {
				color: red;
			}
			.fc-day-sat .fc-col-header-cell-cushion {
				color: blue;
			}
	    	
/* 	    	.fc-daygrid-day .fc-daygrid-day-number {	// ¿œø‰¿œ, ≈‰ø‰¿œ ¡¶ø‹
	    		color: black;
	    	} */
	    	
	    	.fc-daygrid-day.fc-day-sun .fc-daygrid-day-number{ 		
	    		color: red;
	    	}
	    	.fc-daygrid-day.fc-day-sat .fc-daygrid-day-number{		
	    		color: blue;
	    	}
	    </style>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
/*             events : [
                        {
                        title: 'π∞¡÷±‚',
                        start: '2024-12-08'
                        },
                        {
                        title: '∂—≤± ¥›±‚',
                        start: '2024-12-15',
                        end: '2024-12-18'
                        }
                    ]
            }); */
        
/* 	        events: [
	            {
	              title  : 'event1',
	              start  : '2024-12-09'
	            },
	            {
	              title  : 'event2',
	              start  : '2024-12-21',
	              end    : '2024-12-23'
	            },
	            {
	              title  : 'event3',
	              start  : '2024-12-12T12:30:00',
	              allDay : false // will make the time show
	            }
	          ]
	        }); */
      
	        eventSources: [
	
	            // your event source
	            {
	              events: [ // put the array in the `events` property
	                {
	                  title  : '±Ë≥≤øµ',
	                  start  : '2024-12-05'
	                },
	                {
	                  title  : 'event2',
	                  start  : '2024-12-21',
	                  end    : '2024-12-27'
	                },
	                {
	                  title  : 'event3',
	                  start  : '2024-12-15T12:30:00',
	                }
	              ],
	              color: 'black',     // an option!
	              textColor: 'yellow' // an option!
	            }
	
	            // any other event sources...
	
	          ]
	
	        });
        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
                         			<c:forEach items="${list}" var="board">
                     			<tr>
                     				<td><c:out value="${ board.cname}"/></td>
                     				 <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'>
                     				 <c:out value="${board.rnum}"/></a></td>
                     			</tr>
                     			</c:forEach>
  </body>
</html>