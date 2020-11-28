<template>
    <div class="stake__content">
        <div class="stake__content-intro">
            <h1>Today's a good day to sow SUN</h1>
            <h4>Stake TRX to participate in mining and earn SUN</h4>
            <p class="notice">SUN smart contract has been verified by SlowMist. Check out the audit report <a class="stake_report" href="https://sun.io/docs/audit-report-sun_en.pdf" target="_blank">here</a></p>
        </div>
        <div class="stake__page-content">
            <div class="stake__page-header">
                <img :src="dataReceive.coin_one_img" alt="">
                <span class="coin_stake">{{dataReceive.coin_one}} pool</span>
            </div>
            <div class="stake__page-body">
                <div class="stake__page-body-total">
                    <div class="stake__page-title">Total lock-ups</div>
                    <p class="total__coin-staked">{{changeCurrency(123123123)}} {{dataReceive.coin_one}}</p>
                </div>
                <div class="stake__page-body-staked">
                    <div class="stake__page-title">You have staked</div>
                    <span class="stake__page-coin-staked" @click="stakedCoin('TMqm7Veq8PNzDVpThoC78Sfy3db8UoxJet')">{{stakedAddressCoin}} {{dataReceive.coin_one}}</span>
                </div>
            </div>
            <div class="stake__page-body-action">
                <div class="stake_coin">Stake {{dataReceive.coin_one}}</div>
                <p class="earn_coin">Earn {{dataReceive.default_coin}}</p>
            </div>
            <div class="stake__page-footer">
                <button class="stake__page-footer-button" @click="showStakeModal = true">Genesis Mining</button>
                <stake-modal v-show="showStakeModal" @close="noStakeModal"></stake-modal>
            </div>
        </div>
    </div>
</template>

<script>
import StakeModal from "./StakeModal.vue";
export default {
    data: function() {
        return {
            showStakeModal: false,
            coins_data: {},
            stakedAddressCoin: 0,
        }
    },
    methods: {
        changeCurrency(number) {
            return number.toLocaleString();
        },
        stakeModal() {
            this.showStakeModal = true;
        },
        noStakeModal() {
            this.showStakeModal = false;
        },
        async stakedCoin(addressCoin){
            let contract = await window.tronWeb.contract().at(addressCoin);
            await contract.balanceOfStake("TMdRkPYDZZrt5S6uSSDHi4yidP3WrqEaTF").call()
            .then(result => this.stakedAddressCoin = parseInt(result._hex) / 100)
        },
    },
    computed: {
        dataReceive() {
            return this.$store.state.coin_data;
        }
    },
    components: {
        StakeModal,
    },
    mounted() {
        this.$eventBus.$on('emitted-data', (value) => {
            this.coins_data = value;
            console.log(this.coins_data);
        })
    },
}
</script>

<style lang="scss">
    .stake__content {
        width: 62.5%;
        margin: 0 auto;
        text-align: center;
        padding-top: 8rem;
        font-weight: 400;
        position: relative;
        z-index: 1;
    }

    .stake__page-footer-button {
        background: #6726eb;
        border-radius: 10px;
        width: 100%;
        height: 40px;
        line-height: 40px;
        font-family: HelveticaNeue;
        font-size: 12px;
        color: #fff;
        letter-spacing: 0;
        text-align: center;
        display: block;
        margin: 13px auto 0;
        border: none;
    }

    .stake__page-coin-staked {
        color: #6726eb;
        font-size: 20px;
    }

    .stake__page-title {
        font-size: 12px;
    }

    .stake_coin, .earn_coin {
        font-size: 14px;
        padding: 0 0 10px;
    }

    .stake__content-intro {
        color: #fff;
        h1 {
            font-family: HelveticaNeue-CondensedBlack;
            font-size: 50px;
            letter-spacing: .93px;
            line-height: 52px;
            margin-bottom: 20px;
        }

        h4 {
            font-family: HelveticaNeue-Bold;
            font-size: 18px;
            letter-spacing: 0;
            margin-bottom: 10px;
        }

        p {
            color: #777;
            font-size: 12px;
            a {
                color: #777;
                text-decoration: underline;
            }
        }
    }
    
    .stake__page-content {
        width: 480px;
        height: 500px;
        border-radius: 20px;
        padding: 20px;
        background-color: #fff;
        margin: 2rem auto;
    }

    .coin_stake {
        display: block;
        margin: 10px 0;
        font-size: 20px;
    }

    .stake__page-header img {
        width: 60px;
    }

    .stake__page-body {
        margin: 25px 0;
        padding: 14px 20px;
        width: 100%;
        background: #fff;
        box-shadow: inset 0 -2px 8px 0 rgba(51, 1, 138, 0.2);
        border-radius: 15px;
    }

    .total__coin-staked {
        font-size: 20px;
    }

    .stake__page-body-action {
        margin: 40px 0;
    }
</style>