<template>
    <b-row>
        <div v-for="(ele,index) in coins_transactions" :key="index" class="sun__content-dashboard-item">
            <div class="sun__item-header" :class="(checkNull(ele.coin_one_img) || checkNull(ele.coin_two_img)) ? 'hideEleNext' : ' '">
                <div class="sun__item-header-image">
                    <img :class="checkNull(ele.coin_one_img) ? 'hideEle' : ' '" :src="ele.coin_one_img" alt="" class="sunCoin">
                    <img :class="checkNull(ele.coin_second_img) ? 'hideEle' : ' '" :src="ele.coin_second_img" alt="" class="tronCoin"> 
                </div>
                <div class="sun__item-header-brand">
                    <span class="sun__item-header-brand-1"> {{ele.coin_one}}/{{ele.coin_two}} LP Pool </span><br>
                    <span class="sun__item-header-brand-2"> Stake {{ele.coin_one}}/{{ele.coin_two}} LP Earn 
                        <span class="sun__item-header-multi">{{ele.multi}}x</span>
                        <span>{{ele.coin_one}}</span>
                    </span>
                </div>
            </div>
            <div class="sun__item-body">
                <div class="sun__item-body-content">
                    <span class="sun__item-body-content-left">Total: {{changeCurrency(ele.total)}}</span>
                    <span class="sun__item-body-content-right">APY: {{ele.api}}%</span>
                </div>
                <div class="sun__item-body-table-coin">
                    <p class="sun__item-body-content-coin-title">Total Staked</p>
                    <div class="sun__item-body-content-coin-info">
                        <span class="sun__item-staked">{{changeCurrency(ele.total_stacked_coin_one)}}</span>
                        <span class="sun__item-coin">{{ele.coin_one}}</span>
                    </div>
                    <div class="sun__item-body-content-coin-info">
                        <span class="sun__item-staked">{{changeCurrency(ele.total_stacked_coin_two)}}</span>
                        <span class="sun__item-coin">{{ele.coin_two}}</span>
                    </div>
                    <p class="sun__item-body-content-footer">Pool Supply</p>
                    <div class="sun__item-body-content-footer-info">
                        <span class="sun__item-footer-total">{{changeCurrency(ele.pool_supply)}}</span>
                        <span class="sun__item-footer-coin">{{ele.coin_one}}</span>
                    </div>
                </div>
            </div>
            <div class="sun__item-footer">
                <div class="sun__item-footer-link">
                    <a class="link-lp" href="https://justswap.io/?lang=en-US?tokenAddress=TKkeiboTkxXKJpbmVFbv4a8ov5rAfRDMf9&type=add#/home" target="">Get LP Token</a>
                </div>
                <button class="sun__item-footer-button" type="button">Select</button>
            </div>
        </div>
    </b-row>
</template>

<script>
export default {
    props: {
        coins_transactions: {
            type: Array,
            default: [],
        }
    },
    methods: {
        changeCurrency(number) {
            return number.toLocaleString();
        },
        checkNull(string) {
            if(string == null) {
                return true;
            } else {
                return false;
            }
        },
    }
}
</script>

<style lang="scss">

    .hideEleNext {
        justify-content: flex-start !important;
    }

    .sun__content-dashboard-item{
        width: 360px;
        height: 440px;
        border-radius: 10px;
        padding: 20px;
        background-color: #fff;
        margin: 0 0.6rem 1.5rem;
    }

    .sun__item-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .sun__item-header-image{
        position: relative;
        width: 30%;
    }

    .sunCoin, .tronCoin{
        width: 50px;
        height: 50px;
    }

    .sunCoin {
        position: absolute;
        left: 0;
        top: 0;
    }

    .tronCoin {
        position: relative;
        left: 1rem;
    }

    .sun__item-header-brand{
        width: 70%;
        text-align: left;
        padding-left: 5px;
    }

    .sun__item-header-brand-1{
        font-size: 24px;
    }

    .sun__item-header-brand-2{
        font-size: 12px;
        color:#666;
    }

    .sun__item-body{
        margin: 1.8rem 0;
    }

    .sun__item-body-content-coin-info, .sun__item-body-content, .sun__item-body-content-footer-info{
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .sun__item-body-content-left {
        font-size: 11px;
    }    

    .sun__item-body-content-right{
        color: #1ba27a;
        font-size: 13px;
    }
    
    .sun__item-header-multi {
        color:#5915e1;
    }

    .sun__item-body-table-coin {
        margin: 10px auto 0;
        padding: 14px 20px;
        width: 100%;
        background: #fff;
        box-shadow: inset 0 -2px 8px 0 rgba(51,1,138,.08);
        border-radius: 15px;
    }

    .sun__item-body-content-coin-title , .sun__item-body-content-footer{
        font-family: HelveticaNeue;
        font-size: 10px;
        color: #666;
        text-align: left;
        margin-left: -25px;
        line-height: 1rem;
        margin-bottom: 0.6rem;
        letter-spacing: 0;
        transform: scale(.83);
    }

    .sun__item-staked{
        font-size: 14px;
        padding: 5px 0px;
    }

    .sun__item-footer-total {
        font-size: 14px;
    }

    .sun__item-coin, .sun__item-footer-coin {
        font-family: HelveticaNeue;
        font-size: 12px;
        color: #999;
        letter-spacing: 0;
    }

    .link-lp {
        color: #6726eb;
        font-size: 12px;
        line-height: 20px;
        display: block;
        margin-top: 25px;
    }

    .sun__item-footer-button {
        background: #5915e1;
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
</style>