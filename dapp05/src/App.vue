<template>
  <div id="app">
    <app-header :listNavBar="listNavBar" :languages="languages"></app-header>
    <router-view></router-view>
    <app-footer></app-footer>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import SunContent from "./components/SunContent.vue";
import Footer from "./components/Footer.vue";
import Vote from "./components/Vote.vue";
import Faq from "./components/FAQs.vue";
export default {
    data: function() {
      return {
        imgURL: 'src/assets/logo_header.png',
        listNavBar: [
          {
            id: 1,
            name: 'SUN',
            isActive: true,
          },
          {
            id: 2,
            name: 'Vote',
            isActive: false,
          },
          {
            id: 3,
            name: 'FAQs',
            isActive: false,
          },
          {
            id: 4,
            name: 'Learn',
            items: [
              {
                name_link: 'WhitePaper',
                link: "https://sun.io/docs/sun_whitepaper_en.pdf",
              },
              {
                name_link: 'Audit',
                link: "https://sun.io/docs/audit-report-sun_en.pdf",
              },
            ],
            isDropdown: false,
          }
        ],
        languages: ['English', '日本語'],
      }
    },
    components: {
      appHeader: Header,
      sunContent: SunContent,
      appFooter: Footer,
      appVote: Vote,
      appFaq: Faq,
    },
    methods: {

    },
}
</script>

<style lang="scss">

</style>