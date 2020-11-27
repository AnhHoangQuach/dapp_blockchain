import Vue from 'vue'
import Router from 'vue-router'
import SunContent from '../components/SunContent.vue'
import Vote from '../components/Vote.vue'
import Faq from "../components/FAQs.vue"
import MiningRules from '../components/MiningRules.vue'
import StakePage from '../components/StakePage.vue'

Vue.use(Router)
Vue.prototype.$eventBus = new Vue();
export default new Router({
    routes: [
        { path: '/', name: 'Sun', component: SunContent },
        { path: '/vote', name: 'Vote', component: Vote },
        { path: '/faq', name: 'Faq', component: Faq },
        { path: '/rules', name: 'Rule', component: MiningRules },
        { path: '/stake/:id', name: 'Stake', component: StakePage},
    ]
})