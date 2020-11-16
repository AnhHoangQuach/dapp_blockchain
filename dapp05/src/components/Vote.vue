<template>
    <div class="vote__list-container">
        <div class="vote__list-title">Vote</div>
        <div class="vote__list-content">
            <div class="role-tab">
                <div class="role-tab-active" @click="isActive = true" >Active</div>
                <div class="role-tab-closed" @click="isActive = false">Closed</div>
                <div class="line" :style="{left: !isActive ? '6%' : '0'}"></div>
            
            </div>
            <div class="vote__list-card" v-if="isActive">
                <div class="vote__list-card-img">
                    <img src="src/assets/emptyCard.png" alt="">
                </div>
                <div class="vote__list-card-img-title">
                    <span>No proposal up for vote. Please check other voting instead.</span>
                </div>
            </div>
            <app-closed v-else></app-closed>
        </div>
    </div>
</template>

<script>
import Closed from "./Closed.vue"
export default {
    data: function() {
        return {
            isActive: true,
        }
    },
    methods: {

    },
    components: {
        appClosed: Closed,
    }
}
</script>

<style lang="scss">
    .line {
        content: "";
        position: absolute;
        right: 0;
        left: 0;
        bottom: 0;
        border-bottom: 2px solid #5915e1;
        width: 3.6%;
        transition: all 0.3s ease;
    }

    .vote__list-container {
        width: 62.5%;
        margin: 150px auto 0px;
        position: relative;
        z-index: 9999;
    }

    .vote__list-title {
        font-family: PingFangSC-Medium;
        font-size: 1vw;
        color: rgb(255, 255, 255);
        letter-spacing: 0px;
    }

    .vote__list-content {
        background: #fff;
        border-radius: 10px;
        min-height: 585px;
        padding: 20px;
        margin-top: 20px;
        box-shadow: rgba(148, 148, 148, 0.06) 0px 20px 40px 0px;
    }

    .role-tab {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        position: relative;
    }

    .role-tab-active {
        color: #5915e1;
        margin: 0 32px 0 0;
        padding: 12px 0;
        font-size: 14px;
        background: transparent;
        border: 0;
        outline: none;
        cursor: pointer;
        font-weight: 500;
    }

    .role-tab-closed {
        margin: 0 32px 0 0;
        padding: 12px 0;
        font-size: 14px;
        background: transparent;
        border: 0;
        outline: none;
        cursor: pointer;
        color: #333;
    }

    .vote__list-card {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 10% 0 10% 0;
    }

    .vote__list-card-img-title {
        margin-top: 20px;
        color: rgba(0,0,0,.65);
        font-size: 14px;
        font-variant: tabular-nums;
        line-height: 1.5715;
    }
</style>