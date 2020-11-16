<template>
    <b-row>
        <div v-for="(ele) in coins_ended_transactions" :key="ele.id" class="sun__content-dashboard-item">
            <div class="sun__content-dashboard-item-ended">Ended</div>
            <div class="sun__item-header">
                <div class="sun__item_header_image">
                    <img v-if="typeof(ele.coin_one_img) === 'string'" :src="ele.coin_one_img" alt="" class="sunCoin">
                    <img v-if="typeof(ele.coin_second_img) === 'string'" :src="ele.coin_second_img" alt="" class="tronCoin">
                </div>
                <div class="sun__item-header-brand">
                    <span class="sun__item-header-brand-1"> 
                        {{ele.coin_one}}{{typeof(ele.coin_two) === 'string' ? '/' + `${ele.coin_two}` + ' LP' : ' '}} {{ele.id === parseInt(coins_ended_transactions.length) ? ' ' : 'Pool'}} 
                    </span><br>
                    <span class="sun__item-header-brand-2"> Stake {{ele.coin_one}}{{typeof(ele.coin_two) === 'string' ? '/' + `${ele.coin_two}` + ' LP' : ' '}} Earn 
                        <span class="sun__item-header-multi" v-if="typeof(ele.multi) === 'number'">{{ele.multi}}x</span>
                        <span>{{ele.default_coin}}</span>
                    </span>
                </div>
            </div>
            <div class="sun__item-body">
                <div class="sun__item-body-ended">
                    <span>{{ele.timestamp}}</span> Ended
                </div>
                <div class="sun__item-body-table-coin">
                    <p class="sun__item-body-content-coin-title">Total Supply</p>
                    <div class="sun__item-body-content-coin-info">
                        <span class="sun__item-staked">{{changeCurrency(ele.total)}}</span>
                        <span class="sun__item-coin">{{ele.default_coin}}</span>
                    </div>
                    <p class="sun__item-body-content-coin-body">My Staked</p>
                    <div class="sun__item-body-content-coin-info">
                        <span class="sun__item-staked">{{ele.myStaked}}</span>
                        <span class="sun__item-coin">{{ele.coin_one}}/{{ele.coin_two}} LP</span>
                    </div>
                    <p class="sun__item-body-content-footer">Pending Claim</p>
                    <div class="sun__item-body-content-footer-info">
                        <span class="sun__item-footer-total">{{ele.pendingClaim}}</span>
                        <span class="sun__item-footer-coin">{{ele.default_coin}}</span>
                    </div>
                </div>
            </div>
            <div class="sun__item-footer">
                <div class="sun__item-footer-link">
                    <a class="link-ended" href="https://justswap.io/?lang=en-US?tokenAddress=TKkeiboTkxXKJpbmVFbv4a8ov5rAfRDMf9&type=add#/home" target="">Claim & Unstake</a>
                </div>
                <button class="sun__item-footer-button-ended" type="button">Continue mining for more profits</button>
            </div>
        </div>
    </b-row>
</template>

<script>
export default {
    data: function() {
        return {
            coins_ended_transactions: [
                {
                    id: 1,
                    coin_one: 'HT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/fireCoin.svg',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 4,
                    timestamp: this.getNow(),
                    total: 22400,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 2,
                    coin_one: 'SUN',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/sunCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 15,
                    timestamp: this.getNow(),
                    total: 84000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 3,
                    coin_one: 'USDT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/tCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 8,
                    timestamp: this.getNow(),
                    total: 44800,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 4,
                    coin_one: 'JST',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/uCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 33600,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 5,
                    coin_one: 'USDJ',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/uCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 3,
                    timestamp: this.getNow(),
                    total: 16800,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 6,
                    coin_one: 'WBTT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/denCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 5600,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 7,
                    coin_one: 'WIN',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/wCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 1,
                    timestamp: this.getNow(),
                    total: 5600,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 8,
                    coin_one: 'TRX',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 33600,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 9,
                    coin_one: 'SUN',
                    coin_second_img: 'src/assets/sunCoin.png',
                    multi: 4,
                    timestamp: this.getNow(),
                    total: 22400,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 10,
                    coin_one: 'BTC',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/btcCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 1.25,
                    timestamp: this.getNow(),
                    total: 7000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 11,
                    coin_one: 'SUN',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/sunCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 14,
                    timestamp: this.getNow(),
                    total: 98000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 12,
                    coin_one: 'JST',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/uCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 42000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 13,
                    coin_one: 'USDT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/tCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 42000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 14,
                    coin_one: 'WBTT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/denCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 3,
                    timestamp: this.getNow(),
                    total: 21000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 15,
                    coin_one: 'WIN',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/wCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 3,
                    timestamp: this.getNow(),
                    total: 21000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 16,
                    coin_one: 'USDJ',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/jCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 2,
                    timestamp: this.getNow(),
                    total: 14000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 17,
                    coin_one: 'SUN',
                    coin_one_img: 'src/assets/sunCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 42000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 18,
                    coin_one: 'TRX',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 6,
                    timestamp: this.getNow(),
                    total: 42000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 19,
                    coin_one: 'JST',
                    coin_second_img: 'src/assets/uCoin.png',
                    multi: 1,
                    timestamp: this.getNow(),
                    total: 7000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 20,
                    coin_one: 'USDT',
                    coin_second_img: 'src/assets/tCoin.png',
                    multi: 1,
                    timestamp: this.getNow(),
                    total: 7000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 21,
                    coin_one: 'TRX',
                    coin_second_img: 'src/assets/denCoin.png',
                    multi: 1,
                    timestamp: this.getNow(),
                    total: 7000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 22,
                    coin_one: 'USDJ',
                    coin_second_img: 'src/assets/jCoin.png',
                    multi: 1,
                    timestamp: this.getNow(),
                    total: 7000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 23,
                    coin_one: 'HT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/fireCoin.svg',
                    coin_second_img: 'src/assets/tronCoin.png',
                    multi: 1.2,
                    timestamp: this.getNow(),
                    total: 9000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 24,
                    coin_one: 'HT',
                    coin_second_img: 'src/assets/fireCoin.svg',
                    multi: 2.8,
                    timestamp: this.getNow(),
                    total: 21000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 25,
                    coin_one: 'SUN',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/sunCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    timestamp: this.getNow(),
                    total: 686000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 26,
                    coin_one: 'JST',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/jCoin.png',
                    coin_second_img: 'src/assets/tronCoin.png',
                    timestamp: this.getNow(),
                    total: 546000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 27,
                    coin_one: 'USDT',
                    coin_two: 'TRX',
                    coin_one_img: 'src/assets/fireCoin.svg',
                    coin_second_img: 'src/assets/tronCoin.png',
                    timestamp: this.getNow(),
                    total: 406000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 28,
                    coin_one: 'TRX',
                    coin_second_img: 'src/assets/tronCoin.png',
                    timestamp: this.getNow(),
                    total: 140000,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
                {
                    id: 29,
                    coin_one: 'Genesis Mining',
                    coin_second_img: 'src/assets/tronCoin.png',
                    timestamp: this.getNow(),
                    total: 1860602,
                    myStaked: "--",
                    pendingClaim: "--",
                    default_coin: 'SUN',
                },
            ]      
        }
    },
    created() {
        setInterval(this.getNow, 1000);
    },
    methods: {
        changeCurrency(number) {
            return number.toLocaleString();
        },

        getNow: function() {
            const today = new Date();
            const date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
            const time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            const dateTime = date +' '+ time;
            return dateTime;
        }
    }
}
</script>

<style lang="scss" scoped>
    .sun__content-dashboard-item {
        position: relative;
        box-shadow: 0 20px 40px 0 hsla(0,0%,58%,.06);
        overflow: hidden;
    }

    .sun__item-body-content-coin-body {
        font-family: HelveticaNeue;
        font-size: 10px;
        color: #666;
        text-align: left;
        margin: 0.4rem 0 0.2rem -25px;
        line-height: 1rem;
        letter-spacing: 0;
        transform: scale(0.83);
    }

    .sun__item-footer-link a {
        text-decoration: none;
    }

    .link-ended:hover {
        text-decoration: none;
        color: #b79cef;
    }

    .link-ended {
        cursor: not-allowed;
        color: #b79cef;
        font-size: 12px;
        line-height: 20px;
        display: block;
        margin-top: 25px;
    }

    .sun__item-footer-button-ended {
        background: #e2d9f6;
        border-radius: 10px;
        font-family: HelveticaNeue;
        font-size: 12px;
        color: #b79cef;
        letter-spacing: 0;
        text-align: center;
        border: none;
        margin: 13px auto 0;
        width: 100%;
        height: 40px;
        cursor: not-allowed;
    }

    .sun__item-body-ended {
        font-family: HelveticaNeue;
        font-size: 13px;
        letter-spacing: 0;
        line-height: 16px;
        justify-content: center;
        color: red;
    }

    .sun__content-dashboard-item-ended {
        transform: rotate(-315deg);
        transform-origin: right top;
        font-family: AvenirNext-Bold;
        font-size: 14px;
        color: #fff;
        background: #999;
        position: absolute;
        right: -25px;
        top: 80px;
        height: 33px;
        line-height: 33px;
        width: 150px;
    }

</style>