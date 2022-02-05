<script src='./_index.coffee'></script>

<template lang='pug'>
    div
        input(type=number bind:value='{hours}')
    div
        span {hours}

</template>
