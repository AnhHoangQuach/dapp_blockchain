<template>
  <div id="app">
    <app-header></app-header>    
  </div>
</template>

<script>
import Header from "./components/Header.vue";
export default {
    data: function() {
      return {
        imgURL: 'src/assets/logo_header.png',
        listNavBar: ['SUN', 'Vote', 'FAQs', {
          name: 'Learn',
          items: ['WhitePaper', 'Audit'],
        }],
      }
    },
    components: {
      appHeader: Header,
    }
}
</script>

<style lang="scss">

</style>
