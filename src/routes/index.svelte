<script src='./_index.coffee'></script>

<template lang='pug'>
    main
        div
            label Last Defense:
            div.sublabel Without lift loss control!
        div.input-wrapper
            input(inputmode="decimal" 'bind:value={hours}' on:focus='{handleFocus}')
            span.units {(hours==1 ? 'hour':'hours')} ago
        div
            label Now:
            span {nowjs.format('ddd-DD h:mma')}
        div
            label Immunity Ends: 
            span {nowjs.add(19-hours, 'hour').format('ddd-DD h:mma')}
        div
            button(on:click='{decrementHours}') -
            button(on:click='{incrementHours}') +
        div.button-wrapper
            a.calendar-button(href='{makeEventDataUri(hours)}') Open iCal Event
</template>

<style>
    main {
        max-width: 400px;
        margin: auto;
    }
    div {
        font-size: 140%;
        margin: 24px 0;
    }
    label {
        font-size: 140%;
        font-weight: 700;
    }
    .sublabel {
        font-size: 66%;
        font-style: italic;
        margin: 0;
        padding-top: -10px;
    }
    .input-wrapper {
        margin-top: -10px;
    }
    input {
        font-size: 200%;
        border-radius: 2px;

        width: 50px;

        text-align: right;
        padding: 0 120px 0 0;
    }
    input:focus {
        outline: none;
    }
    .units {
        margin-left: -110px;
        opacity: 50%;
    }
    .button-wrapper {
        width: 100%;
        margin-top: 20px;
    }
    button {
        font-size: 125%;
        width: 50%;
        height: 60px;
        border-radius: 1px;
        border: 2px solid white;
    }
    .calendar-button {
        display: block;
        width: 100%;
        padding: 20px 0px;
        text-align: center;

        background-color: darkgreen;
        color: white;

        text-decoration: none;
        border-radius: 2px;
    }

    .calendar-button:hover {
        background-color: green;
    }

</style>

