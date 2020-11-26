<template>
    <div>
        <div class="vote__list-closed-container">
            <div class="vote-list-card" @click="swapComponent(1)">
                <div class="l1">
                    <div class="l1-left">Vote for Your Favorite Pool</div>
                    <div class="l1-right">
                        <span>Ends at: </span>
                        <span>Oct 18 2020 17:00:00</span>
                    </div>
                </div>
                <div class="l2">
                    <div class="l2-left">Closed</div>
                    <div class="l2-right">
                        <span class="author">Author: 
                            <span class="text333">SUN Team</span>              
                        </span>
                        <span class="pool_supply">Total pool supply: 
                            <span class="text333">1,200 SUN</span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="vote-list-card" @click="swapComponent(2)">
                <div class="l1">
                    <div class="l1-left">Vote the featured token onto JustSwap’s token list</div>
                    <div class="l1-right">
                        <span>Ends at: </span>
                        <span>Oct 18 2020 17:00:00</span>
                    </div>
                </div>
                <div class="l2">
                    <div class="l2-left">Closed</div>
                    <div class="l2-right">
                        <span class="author">Author: 
                            <span class="text333">SUN Team</span>              
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            
        }
    },
    methods: {
        swapComponent(data) {
            this.$emit('changeComp', data);
        },
    },
    components: {
        
    }
}
</script>

<style lang="scss">

    .text333 {
        color: #333;
    }

    .vote-list-card {
        margin-top: 15px;
        padding: 30px 20px;
        box-shadow: 0 6px 40px 0 rgba(55,34,96,.07);
        border-radius: 10px;
        cursor: pointer;
    }

    .l1, .l2 {
        display: flex;
        justify-content: space-between;
    }

    .l2 {
        margin-top: 16px;
    }

    .l1-left {
        font-family: PingFangSC-Medium;
        font-size: 1vw;
        color: #333;
    }

    .l1-right {
        font-family: PingFangSC-Regular;
        font-size: .6vw;
        color: #999;
        line-height: 17px;
    }

    .l2-left {
        background: hsla(0,0%,60%,.2);
        color: #999;
        border-radius: 13px;
        padding: 5px 19px;
    }

    .l2-right {
        font-family: PingFangSC-Regular;
        font-size: .6vw;
        color: #999;
        line-height: 17px;
    }
</style>