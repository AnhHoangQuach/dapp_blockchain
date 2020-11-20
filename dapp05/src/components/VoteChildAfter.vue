<template>
    <div class="vote__child-page">
        <div class="vote__child-page-begin">
            <div class="vote__child-page-begin-title">Vote for Your Favorite Pool</div>
            <div class="vote__child-page-begin-subTitle">SUN Team</div>
        </div>
        <div class="vote__child-page-main">
            <div class="vote__child-page-left">
                <div class="vote__child-page-info">
                    <div class="vote__child-page-info-title">
                        <span class="vote__child-page-info-logo"></span>
                        Voting Rules
                    </div>
                    <div class="vote__child-page-info-content">
                        <ul>
                            <li>
                                <span>1</span>
                                Vote with SUN, and user rewards are proportionate to the percentage of SUN cast by the user against the total pool supply;
                            </li>
                            <li>
                                <span>2</span>
                                Vote for only one candidate in each session, and you may cast follow-up votes but cannot withdraw votes you cast;
                            </li>
                            <li>
                                <span>3</span>
                                Votes you cast and the voting rewards can be claimed when the voting session ends.
                            </li>
                            <li style="color: red">
                                <span>4</span>
                                All candidate projects are projects with higher trading volume and liquidity recently on JustSwap and are not endorsed by the official team.
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="vote__child-page-list">
                    <div class="vote__child-page-list-title">Result</div>
                    <table>
                        <thead>
                            <tr>
                                <th class="table-cell-border">Candidates</th>
                                <th class="table-cell-border">Vote count</th>
                                <th class="table-cell-border">Proportion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in list_favorite_pools" :key="item.id" class="vote__child-page-list-item">
                                <td>
                                    <a class="table_link" href="https://tronscan.io/#/contract/TDyvndWuvX5xTBwHPYJi7J3Yq8pq8yh62h" target="_blank">{{item.coin_candidate}}</a>
                                </td>
                                <td>{{addZeroes(item.coin_vote_count > 1000 ? item.coin_vote_count / 1000 : item.coin_vote_count)}}{{item.coin_vote_count > 1000 ? 'K' : ''}}</td>
                                <td>
                                    <span>{{item.coin_proportion > 0.01 ? item.coin_proportion : '&lt;' + `${item.coin_proportion}`}} %</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="vote__child-page-right">
                <div class="right__info">
                    <div class="right__info-title">Basic Info</div>
                    <div class="right__info-content">
                        <ul class="right__info-list">
                            <li class="end">
                                <span>Status</span>
                                <span>Closed</span>
                            </li>
                            <li>
                                <span>Total votes</span>
                                <span>301,254 SUN</span>
                            </li>
                            <li>
                                <span>Total pool supply</span>
                                <span>1200 SUN</span>
                            </li>
                            <li>
                                <span>Progress</span>
                                <div class="progress_bar"></div>
                            </li>
                            <li>
                                <span>Start</span>
                                <span>2020-10-15 17:00:00</span>
                            </li>
                            <li>
                                <span>End</span>
                                <span>2020-10-18 17:00:00</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="right__info-account">
                    <div class="right__info-account-title">
                        <span>My Votes</span>
                    </div>
                    <div class="right__info-account-content">
                        <div class="right__info-account-content-end">The voting session has ended.</div>
                        <div class="right__info-account-content-tip">Thank you for your interest!</div>
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
            default_percent: 0.01,
            list_favorite_pools: [
                {
                    id: 1,
                    coin_candidate: 'HT',
                    coin_vote_count: 160300,
                    coin_proportion: 53.21,
                },
                {
                    id: 2,
                    coin_candidate: 'SUN',
                    coin_vote_count: 47040,
                    coin_proportion: 15.61,
                },
                {
                    id: 3,
                    coin_candidate: 'GOLD',
                    coin_vote_count: 23830,
                    coin_proportion: 7.91,
                },
                {
                    id: 4,
                    coin_candidate: 'JFI',
                    coin_vote_count: 19470,
                    coin_proportion: 6.46,
                },
                {
                    id: 5,
                    coin_candidate: 'LIVE',
                    coin_vote_count: 12170,
                    coin_proportion: 4.03,
                },
                {
                    id: 6,
                    coin_candidate: 'DICE',
                    coin_vote_count: 7000,
                    coin_proportion: 2.32,
                },
                {
                    id: 7,
                    coin_candidate: 'PEARL',
                    coin_vote_count: 6380,
                    coin_proportion: 2.11,
                },
                {
                    id: 8,
                    coin_candidate: 'COLA',
                    coin_vote_count: 6230,
                    coin_proportion: 2.06,
                },
                {
                    id: 9,
                    coin_candidate: 'SRX',
                    coin_vote_count: 4260,
                    coin_proportion: 1.41,
                },
                {
                    id: 10,
                    coin_candidate: 'WBTT',
                    coin_vote_count: 2880,
                    coin_proportion: 0.95,
                },
                {
                    id: 11,
                    coin_candidate: 'REV',
                    coin_vote_count: 2840,
                    coin_proportion: 0.94,
                },
                {
                    id: 12,
                    coin_candidate: 'FIST',
                    coin_vote_count: 2580,
                    coin_proportion: 0.85,
                },
                {
                    id: 13,
                    coin_candidate: 'BRG',
                    coin_vote_count: 1570,
                    coin_proportion: 0.52,
                },
                {
                    id: 14,
                    coin_candidate: 'SEED',
                    coin_vote_count: 1310,
                    coin_proportion: 0.43,
                },
                {
                    id: 15,
                    coin_candidate: 'MRK',
                    coin_vote_count: 913.94,
                    coin_proportion: 0.30,
                },
                {
                    id: 16,
                    coin_candidate: 'SMART',
                    coin_vote_count: 680.58,
                    coin_proportion: 0.22,
                },
                {
                    id: 17,
                    coin_candidate: 'KLV',
                    coin_vote_count: 672.77,
                    coin_proportion: 0.22,
                },
                {
                    id: 18,
                    coin_candidate: 'FC',
                    coin_vote_count: 629.06,
                    coin_proportion: 0.2,
                },
                {
                    id: 19,
                    coin_candidate: 'CORN',
                    coin_vote_count: 119.67,
                    coin_proportion: 0.03,
                },
                {
                    id: 20,
                    coin_candidate: 'TEWKEN',
                    coin_vote_count: 73.37,
                    coin_proportion: 0.02,
                },
                {
                    id: 21,
                    coin_candidate: 'GENX',
                    coin_vote_count: 43.06,
                    coin_proportion: 0.01,
                },
                {
                    id: 22,
                    coin_candidate: 'BNKR',
                    coin_vote_count: 41.39,
                    coin_proportion: 0.01,
                },
                {
                    id: 23,
                    coin_candidate: 'SAN',
                    coin_vote_count: 33.33,
                    coin_proportion: 0.01,
                },
                {
                    id: 24,
                    coin_candidate: 'UBC',
                    coin_vote_count: 25.26,
                    coin_proportion: 0.01,
                },
                {
                    id: 25,
                    coin_candidate: 'BRRR',
                    coin_vote_count: 160.30,
                    coin_proportion: 0.01,
                },
                {
                    id: 26,
                    coin_candidate: 'FGS',
                    coin_vote_count: 160.30,
                    coin_proportion: 0.01,
                },
                {
                    id: 27,
                    coin_candidate: 'YFT',
                    coin_vote_count: 20.23,
                    coin_proportion: 0.01,
                },
                {
                    id: 28,
                    coin_candidate: 'RICH',
                    coin_vote_count: 17.7,
                    coin_proportion: 0.01,
                },
                {
                    id: 29,
                    coin_candidate: 'LAW',
                    coin_vote_count: 17.18,
                    coin_proportion: 0.01,
                },
                {
                    id: 30,
                    coin_candidate: 'SRI',
                    coin_vote_count: 9.78,
                    coin_proportion: 0.01,
                },
                {
                    id: 31,
                    coin_candidate: 'FRAG',
                    coin_vote_count: 9.15,
                    coin_proportion: 0.01,
                },
                {
                    id: 32,
                    coin_candidate: 'PEA',
                    coin_vote_count: 8.88,
                    coin_proportion: 0.01,
                },
                {
                    id: 33,
                    coin_candidate: 'SSR',
                    coin_vote_count: 7.47,
                    coin_proportion: 0.01,
                },
                {
                    id: 34,
                    coin_candidate: 'BTC',
                    coin_vote_count: 7.19,
                    coin_proportion: 0.01,
                },
                {
                    id: 35,
                    coin_candidate: 'SSK',
                    coin_vote_count: 6.62,
                    coin_proportion: 0.01,
                },
                {
                    id: 36,
                    coin_candidate: 'USDJ',
                    coin_vote_count: 2.72,
                    coin_proportion: 0.01,
                },
                {
                    id: 37,
                    coin_candidate: 'PVX',
                    coin_vote_count: 2.43,
                    coin_proportion: 0.01,
                },
                {
                    id: 38,
                    coin_candidate: 'MAVRONA',
                    coin_vote_count: 1.6,
                    coin_proportion: 0.01,
                },
                {
                    id: 39,
                    coin_candidate: 'CEB',
                    coin_vote_count: 1.33,
                    coin_proportion: 0.01,
                },
                {
                    id: 40,
                    coin_candidate: 'ALI',
                    coin_vote_count: 1.32,
                    coin_proportion: 0.01,
                },
                {
                    id: 41,
                    coin_candidate: 'ICE',
                    coin_vote_count: 0.51,
                    coin_proportion: 0.01,
                },
                {
                    id: 42,
                    coin_candidate: 'ANK',
                    coin_vote_count: 0.25,
                    coin_proportion: 0.01,
                },
                {
                    id: 43,
                    coin_candidate: 'SIMBA',
                    coin_vote_count: 0.2,
                    coin_proportion: 0.01,
                },
                {
                    id: 44,
                    coin_candidate: 'VOIDX',
                    coin_vote_count: 0.18,
                    coin_proportion: 0.01,
                },
                {
                    id: 45,
                    coin_candidate: 'VCOIN',
                    coin_vote_count: 0.06,
                    coin_proportion: 0.01,
                },
                {
                    id: 46,
                    coin_candidate: 'HGRO',
                    coin_vote_count: 0.04,
                    coin_proportion: 0.01,
                },
                {
                    id: 47,
                    coin_candidate: 'UP',
                    coin_vote_count: 0.03,
                    coin_proportion: 0.01,
                },
                {
                    id: 48,
                    coin_candidate: 'HODL',
                    coin_vote_count: 0.02,
                    coin_proportion: 0.01,
                },
                {
                    id: 49,
                    coin_candidate: 'PCB',
                    coin_vote_count: 0.02,
                    coin_proportion: 0.01,
                },
                {
                    id: 50,
                    coin_candidate: 'DRMS',
                    coin_vote_count: 0.01,
                    coin_proportion: 0.01,
                },
                {
                    id: 51,
                    coin_candidate: 'OPL',
                    coin_vote_count: 0.01,
                    coin_proportion: 0.01,
                },
                {
                    id: 52,
                    coin_candidate: 'UEV',
                    coin_vote_count: 0.01,
                    coin_proportion: 0.01,
                },
                {
                    id: 53,
                    coin_candidate: 'HAM',
                    coin_vote_count: 0.00,
                    coin_proportion: 0.01,
                },
                {
                    id: 54,
                    coin_candidate: 'LAWC...edit',
                    coin_vote_count: 0.00,
                    coin_proportion: 0.01,
                },
                {
                    id: 55,
                    coin_candidate: 'TTH',
                    coin_vote_count: 0.00,
                    coin_proportion: 0.01,
                },
            ]
        }
    },
    methods: {
        addZeroes(num) {
            var data = Number(num)
            return data.toLocaleString("en", {useGrouping: false, minimumFractionDigits: 2})
        }
    },
    components: {
        
    }
}
</script>

<style lang="scss">
    .table_link {
        color: #333;
        font-size: 14px;
        text-decoration: underline;
    }

    table {
        width: 100%;
        text-align: left;
        border-radius: 2px 2px 0 0;
        border-collapse: separate;
        border-spacing: 0;
        color: rgba(0,0,0,.65);
        font-variant: tabular-nums;
        line-height: 1.5715;
        list-style: none;
        table-layout: auto;
        margin-top: 10px;
    }

    table tbody > tr > td {
        height: 46px;
        line-height: 46px;
        padding: 0 20px;
        font-size: 13px;
        color: #333;
        padding: 0 20px;
    }

    table thead > tr > th {
        width: 20%;
        word-break: break-all;
        height: 33px;
        line-height: 33px;
        padding: 0 20px;
        font-size: 12px;
        font-weight: 400;
        color: #666;
    }

    table > thead > tr:first-child th:first-child, table > tbody > tr > td:first-child{
        width: 20%;
        word-break: break-all;
    }

    table > thead > tr > th:nth-child(2), table > tbody > tr > td:nth-child(2) {
        width: 50%;
        word-break: break-all;
        text-align: center;
    }

    table > thead > tr > th:last-child, table > tbody > tr > td:last-child {
        width: 20%;
        text-align: right;
    }

    .table-cell-border {
        border-top-left-radius: 2px;
    }

    .vote__child-page-list-title {
        color: #5915e1;
        font-weight: 500;
    }

    .vote__child-page {
        position: relative;
        z-index: 500;
    }

    .vote__child-page-main {
        display: flex;
        justify-content: space-between;
        width: 85%;
        margin: 0 auto 0;
    }

    .vote__child-page-begin {
        width: 85%;
        margin: 170px auto 0;
        color: #fff;
        border-radius: 10px;
    }

    .vote__child-page-begin-title {
        font-size: 20px;
    }

    .vote__child-page-begin-subTitle {
        margin-top: 6px;
        font-size: 13px;
    }    

    .vote__child-page-left {
        width: calc(100% - 430px);
        margin-right: 20px;
        margin-top: 20px;
    }

    .vote__child-page-info {
        background-color: #fff;
        border-radius: 10px;
        padding: 17px 18px;
        margin-bottom: 15px;
    }

    .vote__child-page-info-title {
        position: relative;
    }

    .vote__child-page-info-logo {
        background-image: url('../assets/voteLogo.png');
        position: absolute;
        left: 0;
        top: -2px;
        display: inline-block;
        width: 20px;
        height: 25px;
        background-size: contain;
    }

    .vote__child-page-info-title {
        position: relative;
        text-indent: 30px;
        font-size: 14px;
        color: #666;
    }

    .vote__child-page-info-content {
        font-size: 12px;
        color: #333;
    }

    .vote__child-page-info-content > ul {
        margin-top: 15px;
        margin-bottom: 0;
        padding: 0;
    }

    .vote__child-page-info-content > ul li {
        line-height: 20px;
        list-style-type: none;
    }

    .vote__child-page-info-content > ul li > span {
        font-size: 8px;
        color: #5f1ee2;
        margin-right: 10px;
        font-style: italic;
    }

    .vote__child-page-list {
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        margin-top: 20px;
    }

    .right__info {
        background: #fff;
        box-shadow: 0 20px 40px 0 hsla(0,0%,58%,.06);
        border-radius: 10px;
        padding: 15px 20px;
    }

    .right__info-title {
        background: url('../assets/basicInfo.png') left 3px no-repeat;
        font-family: PingFangSC-Regular;
        font-size: 14px;
        color: #666;
        letter-spacing: 0;
        padding-left: 32px;
        background-size: 22px;
        padding-bottom: 14px;
        border-bottom: 1px solid hsla(0,0%,92.5%,.5);
    }

    .vote__child-page-right {
        width: 430px;
        margin-top: 20px;
    }

    .right__info-list {
        text-align: right;
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .right__info-list li span {
        font-size: 14px;
    }

    .right__info-list li {
        margin-top: 12px;
        display: flex;
        justify-content: space-between;
        color: rgba(0,0,0,.65);
    }

    .right__info-list li > span:first-child {
        text-align: left;
    }

    .end span:last-child {
        background: #ccc;
        border-radius: 13.5px;
        height: 22px;
        line-height: 22px;
        padding: 0 16px;
        display: inline-block;
        font-family: PingFangSC-Regular;
        font-size: 12px;
        color: #fff;
        letter-spacing: 0;
        width: auto;
    }

    .progress_bar {
        width: 40%;
        position: relative;
        top: 8px;
        border-radius: 8px;
        height: 8px;
        background: rgb(89, 21, 225);
    }

    .right__info-account {
        margin-top: 20px;
        padding: 15px 20px 20px;
        background: #fff;
        box-shadow: 0 20px 40px 0 hsla(0,0%,58%,.06);
        border-radius: 10px;
    }

    .right__info-account-title {
        background: url('../assets/db.png') left 3px no-repeat;
        font-family: PingFangSC-Regular;
        font-size: 14px;
        color: #666;
        letter-spacing: 0;
        padding-left: 26px;
        background-size: 16px;
        padding-bottom: 14px;
        border-bottom: 1px solid hsla(0,0%,92.5%,.5);
        display: flex;
        justify-content: space-between;
    }

    .right__info-account-content-end {
        font-family: PingFangSC-Medium;
        font-size: 20px;
        color: #333;
        letter-spacing: 0;
        margin: 40px auto 0;
        text-align: center;
    }
    
    .right__info-account-content-tip {
        font-family: PingFangSC-Regular;
        font-size: 16px;
        color: #aaa;
        letter-spacing: 0;
        text-align: center;
        margin: 58px auto 90px;
    }

    .vote__child-page-list-item:hover {
        background-color: rgb(89, 21, 225);
        a {
            color: #fff;
        }
        transition: all 0.3s ease;
    }
</style>