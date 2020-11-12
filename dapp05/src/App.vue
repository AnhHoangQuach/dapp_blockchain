<template>
  <div id="app">
    <app-header :listNavBar="listNavBar" :languages="languages"></app-header>
    <sun-content></sun-content>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import SunContent from "./components/SunContent.vue";
import Footer from "./components/Footer.vue";
export default {
    data: function() {
      return {
        imgURL: 'src/assets/logo_header.png',
        listNavBar: [
          {
            name: 'SUN',
            isActive: true,
          },
          {
            name: 'Vote',
            isActive: false,
          },
          {
            name: 'FAQs',
            isActive: false,
          },
          {
            name: 'Learn',
            items: ['WhitePaper', 'Audit'],
          }
        ],
        languages: ['English', '日本語'],
      }
    },
    components: {
      appHeader: Header,
      sunContent: SunContent,
      appFooter: Footer,
    }
}
</script>

<style lang="scss">

</style>