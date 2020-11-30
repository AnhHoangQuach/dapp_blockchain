<template>
    <div class="sun__content">
        <div class="sun__content-intro">
            <h1>Today's a good day to sow SUN</h1>
            <h4>Stake to mine and earn SUN</h4>
            <p>SUN smart contract has been verified by SlowMist. Check out the audit report <a href="https://sun.io/docs/audit-report-sun_en.pdf" target="_blank">here</a></p>
        </div>
        <div class="sun__content-data" :class="seen == false ? 'hideEle' : ' ' ">
            Currently we only support staking through this page. Assets that are staked via other means will not be included in Official mining and cannot be returned.
            <button type="button" class="button-exit" @click="seen = !seen">x</button>
        </div>
        <div class="sun__content-dashboard">
            <div class="sun__content-dashboard-nav">
                <div class="sun__content-dashboard-info">
                    <div class="sun__content-dashboard-info-title">
                        <img src="src/assets/stake.svg" alt="">
                        Total Staked Value
                        <router-link :to="{name: 'Rule'}" class="rules">Mining rules</router-link>
                    </div>
                    <div class="sun__content-dashboard-info-mined_amount">
                        &asymp;
                        <span class="trx_amount">
                            8,076,254,192
                            <span class="trxCurrency">TRX</span>
                        </span>
                    </div>
                    <div class="sun__content-dashboard-info-usd_amount">
                        &asymp;
                        <span class="usd_amount">
                            202,047,800
                            <span class="usdCurrency">USD</span>
                        </span>
                    </div>
                </div>
                <a href="https://justswap.io/?lang=en-US#/home?tokenAddress&type=add" target="_blank" class="sun__content-dashboard-getLp">
                    Get LP Token on JustSwap
                    <span class="questionCircle">?</span>
                </a>
            </div>
            <div class="sun__content-dashboard-nav-tab">
                <div class="role_active">
                    <a @click.prevent="isEnded = false" href="" :style="{color: isEnded ? '#333' : '#5915e1'}">Active</a>
                </div>
                <div class="role_ended">
                    <a @click.prevent="isEnded = !isEnded" href="" :style="{color: isEnded ? '#5915e1' : '#333'}">Ended</a>
                </div>
            </div>
            <div class="sun__content-tabs">
               <b-container class="bv-example-row">
                    <app-ended v-if="isEnded"></app-ended>
                    <app-item v-else :coins_transactions="coins_transactions"></app-item>
               </b-container>
            </div>
        </div>
    </div>
</template>

<script>
import Item from "./Item.vue";
import Ended from "./Ended.vue";
export default {
    data: function() {
        return {
            isEnded: false,
            seen: true,
            coins_transactions: [
                {
                    id: 1,
                    coin_one: 'TRX',
                    coin_two: 'SUN',
                    coin_one_img: 'src/assets/tronCoin.png',
                    coin_second_img: 'src/assets/sunCoin.png',
                    multi: 9,
                    total: 54319035319,
                    api: 36.66,
                    total_stacked_coin_one: 1791910,
                    total_stacked_coin_two: 543290451,
                    pool_supply: 19157,
                    default_coin: 'SUN',
                    address_coin: 'TZ6u76fTzpGaE2MwcwzCVGbmxvmPLbSaHv', // dia chi vi cua minh
                },
                {
                    id: 2,
                    coin_one: 'USDT',
                    coin_two: 'SUN',
                    coin_one_img: 'src/assets/tCoin.png',
                    coin_second_img: 'src/assets/sunCoin.png',
                    multi: 9,
                    total: 874055404,
                    api: 18.44,
                    total_stacked_coin_one: 26819517,
                    total_stacked_coin_two: 1079987366,
                    pool_supply: 19157,
                    default_coin: 'SUN',
                    address_coin: 'TUsqNCAsBRVu2nbEEB1f2kfcXeeHxLL72K', // dia chi contract usdt
                },
                {
                    id: 3,
                    coin_one: 'SUN',
                    coin_two: 'SUN',
                    coin_one_img: 'src/assets/sunCoin.png',
                    coin_second_img: 'src/assets/sunCoin.png',
                    multi: 4,
                    total: 630436190,
                    api: 21.17,
                    total_stacked_coin_one: 530725126,
                    total_stacked_coin_two: 418063347,
                    pool_supply: 8514,
                    default_coin: 'SUN',
                    address_coin: 'TCUv4Lo5XQF8cpqLD7jx65F64fyuQC28X5', // dia chi contract bank token
                },
                {
                    id: 4,
                    coin_one: 'USDJ',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/jCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 3,
                    total: 209337408,
                    api: 27.73,
                    total_stacked_coin_one: 6026321,
                    total_stacked_coin_two: 239125937,
                    pool_supply: 6385,
                    default_coin: 'SUN',
                },
                {
                    id: 5,
                    coin_one: 'WBTT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/denCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 1,
                    total: 860996172,
                    api: 23.52,
                    total_stacked_coin_one: 8138677022,
                    total_stacked_coin_two: 93977324,
                    pool_supply: 2128,
                    default_coin: 'SUN',
                },
                {
                    id: 6,
                    coin_one: 'WIN',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/wCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 1,
                    total: 2790732664,
                    api: 39.84,
                    total_stacked_coin_one: 16111811449,
                    total_stacked_coin_two: 55479805,
                    pool_supply: 2128,
                    default_coin: 'SUN',
                },
                {
                    id: 7,
                    coin_one: 'TRX',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 4,
                    total: 0,
                    api: 7.37,
                    total_stacked_coin_one: 2400814543344,
                    pool_supply: 8514,
                    default_coin: 'SUN',
                },
                {
                    id: 8, 
                    coin_one: 'SUN',
                    coin_one_img: 'src/assets/sunCoin.png',
                    multi: 3,
                    total: 0,
                    api: 27.5,
                    total_stacked_coin_one: 1590425624,
                    pool_supply: 6385,
                    default_coin: 'SUN',
                },
            ]
        }
    },
    methods: {

    },
    components: {
        appItem: Item,
        appEnded: Ended,
    },
    
}
</script>

<style lang="scss">

    .hideEle {
        visibility: hidden;
        opacity: 0;
        transition: visibility 0s 0.2s, opacity 0.2s linear;
    }

    body {
        background-color: #f9f9fd;
    }

    .sun__content {
        width: 62.5%;
        margin: 0 auto;
        text-align: center;
        padding-top: 8rem;
        font-weight: 400;
        position: relative;
        z-index: 1;
    }

    .sun__content-intro {
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
            font-size: 12px;
            a {
                color: #fff;
                text-decoration: underline;
            }
        }
    }

    .sun__content-data {
        text-align: center;
        background-color: #fffbe6;
        border: 1px solid #ffe58f;
        margin: 0 auto;
        width: 77.5%;
        font-size: 14px;
        color: red;
        padding: 0.5rem 2rem 0.5rem 1rem;
        position: relative;
        .button-exit {
            border: none;
            font-size: 14px;
            position: absolute;
            top: 0.4rem;
            right: 0.5rem;
            background-color: #fffbe6;
        }
    }

    .sun__content-dashboard {
        margin-top: 0.8rem;
    }

    .sun__content-dashboard-info {
        text-align: left;
    }

    .sun__content-dashboard-nav {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: space-between;
        z-index: 1;
        width: 77.5%;
        margin: 0 auto;
        padding: 26px 30px 16px;
        background-color: #fff;
        color: #1f1f1f;
        border-bottom: 1px solid rgba(89,21,225,.1);
        border-radius: 1rem 1rem 0.3rem 0.3rem;
    }

    .trx_amount {
        font-size: 24px;
        color: #333; 
    }

    .usd_amount {
        font-size: 12px;
        color: #333;
    }

    .sun__content-dashboard-info-title {
        font-size: 14px;
        margin-bottom: 1rem;
    }

    .sun__content-dashboard-info-title img {
        margin-right: 8px;
    }

    .trxCurrency {
        font-size: 1rem;
    }

    .rules {
        color: #6726eb;
        font-size: 12px;
        margin-left: 8px;
        text-decoration: underline;
    }

    .sun__content-dashboard-getLp {
        font-family: PingFangSC-Regular;
        font-size: 12px;
        color: #fff;
        letter-spacing: 0;
        text-align: center;
        padding: 10px 14px;
        background: #5915e1;
        border-radius: 5px;
        display: inline-table;
    }

    .sun__content-dashboard-nav > a {
        text-decoration: none;
        color: #fff;
    }

    .questionCircle {
        display: inline-block;
        background: transparent;
        width: 15px;
        height: 15px;
        border-radius: 16px;
        color: #fff;
        font-size: 12px;
        font-family: AvenirNext-DemiBold;
        text-align: center;
        line-height: 15px;
        border: 1px solid #fff;
        transform: scale(.8);
        transform-origin: left;
        margin-left: 8px;
    }

    .sun__content-dashboard-nav-tab {
        display: flex;
        justify-content: center;
        align-items: center;
        color: black;
        margin: 4rem 0;
        font-size: 1.1rem;
        line-height: 3.2rem;
    }

    .role_active a, .role_ended a{
        text-decoration: none;
    }

    .role_active:after {
        content: "";
        border: 1px solid #ddd;
        margin: 0 1rem;
    }

    .role_active a:hover, .role_ended a:hover {
        color: #5915e1;
    }
</style>