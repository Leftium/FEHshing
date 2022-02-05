import '../app.css'

import dayjs from 'dayjs'
import utc from 'dayjs/plugin/utc.js'

dayjs.extend utc

EVENT_TEMPLATE = """
    BEGIN:VCALENDAR
    BEGIN:VEVENT
    DTSTART:DATETIME
    DTSTAMP:20220205T031104Z
    UID:FEHshing@leftium.com
    CREATED:20210609T145454Z
    SEQUENCE:SERIAL
    SUMMARY:Immunity Ends (FEHshing)
    TRANSP:TRANSPARENT
    BEGIN:VALARM
    ACTION:DISPLAY
    DESCRIPTION:This is an event reminder
    TRIGGER:-P0DT2H0M0S
    END:VALARM
    BEGIN:VALARM
    ACTION:DISPLAY
    DESCRIPTION:This is an event reminder
    TRIGGER:-P0DT4H0M0S
    END:VALARM
    END:VEVENT
    END:VCALENDAR
    """

hours = 1
decrementHours = () ->
    hours--
    if hours < 0 then hours = 19

incrementHours = () ->
    hours = (hours+1) % 20

nowjs = dayjs()

makeEventDataUri = (hours) ->
    nowjs = dayjs()

    startDatetime = nowjs.add(19-hours, 'hour').utc().format('YYYYMMDDTHHmmss[Z]')
    calendarEvent = EVENT_TEMPLATE.replace 'DATETIME', startDatetime
    calendarEvent = calendarEvent.replace 'SERIAL', "#{nowjs.unix()}"

    return "data:text/calendar,#{encodeURIComponent(calendarEvent)}"

handleFocus = (e) ->
    @select()

