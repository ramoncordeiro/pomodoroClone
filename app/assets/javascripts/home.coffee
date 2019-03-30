$(document).on 'turbolinks:load', ->
  interval = null;
  seconds = 1;
  minutes = 0;
  hours = 0;
  
  window.stopwatch_start = () ->
    interval = window.setInterval(() ->
      if (seconds == 60)
        minutes++;
        seconds = 0;

      if (minutes == 60)
        hours++;
        minutes = 0;
        seconds = 0;

      if (hours < 10)
        stopwatch_hour = '0'+ hours
      else
        stopwatch_hour = hours;

      if (minutes < 10)
        stopwatch_minute = '0'+ minutes
      else
        stopwatch_minute = minutes;

      if (seconds < 10)
        stopwatch_second = '0'+ seconds
      else
        stopwatch_second = seconds;

      $('.timer').html(stopwatch_hour+':'+stopwatch_minute+':'+stopwatch_second)
      
      seconds++;

    , 1000)

  window.stopwatch_pause = () ->
    clearInterval(interval);

  window.stopwatch_stop = () ->
    clearInterval(interval);
    $('.timer').html('00:00:00');
    seconds = 1;
    minutes = 0;
    hours = 0;

  $('#btnStart').on 'click', ->
    window.stopwatch_start()
    return

  $('#btnPause').on 'click', ->
    window.stopwatch_pause()
    return

  $('#btnStop').on 'click', ->
    window.stopwatch_stop()
    return

return