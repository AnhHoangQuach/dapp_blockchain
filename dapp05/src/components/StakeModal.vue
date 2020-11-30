<template>
    <div>
        <div class="stake__modal-action" v-if="!isClaim">
            <transition name="move">
                <div class="modal-mask">
                    <div class="modal-mask-container">
                        <div class="modal-header">
                            <div class="modal-header__title">Action</div>
                            <div class="modal-default-button" @click="close">
                                <img src="src/assets/iconDelete.png" alt="">
                            </div>
                        </div>

                        <div class="modal-body">
                            <div class="modal-body-action">
                                <div class="stake_action" @click="isClaim = false">Stake</div>
                                <div class="claim_action" @click="isClaim = true">Claim</div>
                            </div>
                            <div class="modal-body-title">
                                Enter the amount of {{dataReceive.coin_one}} you want to stake
                            </div>
                            <div class="modal-body-input">
                                <input type="text" id="amountStake" required>{{dataReceive.coin_one}}
                            </div>
                            <div class="button_max" @click="getBalanceOfToken(dataReceive.address_coin)">MAX</div>
                        </div>
                        <div class="modal-footer">
                            <p class="trx_balance">{{dataReceive.coin_one}} Balance: 
                            {{dataReceive.coin_one === 'TRX' ? getCoinTRX(dataReceive.address_coin) : getBalanceCoin(dataReceive.address_coin) ? roundFloat(balanceCoinAnother, 5) : ''}}
                                {{dataReceive.coin_one}}
                            </p>
                            <button
                                class="modal_stake-footer-button" 
                                @click="stakeCoin(dataReceive.address_coin), showStakeSuccess()"
                            >Stake
                            </button>
                            <stake-success v-if="stakeSuccess" @closeParent="noStakeSuccess" :amountInputStake="amountInputStake" :transactionCode="transactionCode"></stake-success>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
        <div class="claim__modal-action" v-else>
            <transition name="move">
                <div class="modal-mask">
                    <div class="modal-mask-container">
                        <div class="modal-header">
                            <div class="modal-header__title">Action</div>
                            <div class="modal-default-button" @click="close">
                                <img src="src/assets/iconDelete.png" alt="">
                            </div>
                        </div>

                        <div class="modal-body">
                            <div class="modal-body-action">
                                <div class="claim_action" @click="isClaim = false">Stake</div>
                                <div class="stake_action" @click="isClaim = true">Claim</div>
                            </div>
                            <div class="modal-body-title">
                                Enter the amount of {{dataReceive.coin_one}} you want to claim
                            </div>
                            <div class="modal-body-input">
                                <input type="text" id="amountStake" required>{{dataReceive.coin_one}}
                            </div>
                            <div class="showTransaction" @click="showEachStaked(dataReceive.address_coin)"> 
                                <div class="showTransaction-title">Transaction: {{timesOfTransaction}}</div>
                                <ul class="showTransaction-list">
                                    <li class="showTransaction-list-item" v-for="index in timesOfTransaction" :key="index">
                                        <div class="showTransaction-list-item-content">
                                            <span>Staked {{index}}: </span>
                                            <span></span>
                                            <button
                                                class="button_stakeCoin"
                                            >WithDraw
                                            </button>
                                            <button
                                                class="button_stakeCoin" 
                                            >Unstaking
                                            </button>
                                        </div>
                                    </li>                                    
                                </ul>
                            </div>
                            <div class="button_max" @click="getBalanceOfToken(dataReceive.address_coin)">MAX</div>
                        </div>
                        <div class="modal-footer">
                            <p class="trx_balance">{{dataReceive.coin_one}} Staked: 
                                {{coinStaked}} {{dataReceive.coin_one}}
                            </p>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
    </div>
    
</template>

<script>
import StakeSuccess from './StakeSuccess.vue'
export default {
    data: function() {
        return {
            addressUser: '',
            trc20ContractAddress: 'TCUv4Lo5XQF8cpqLD7jx65F64fyuQC28X5',
            balanceCoin: 0,
            balanceCoinAnother: 0,
            stakeSuccess: false,
            amountInputStake: 0,
            transactionCode: 'https://shasta.tronscan.org/#/transaction/',
            isClaim: false,
            coinStaked: 0,
            timesOfTransaction: 0,
            withDrawFullTransaction: 0,
            eachStakeCoin: 0,
        }
    },
    methods: {
        async showEachStaked(addressCoin) {
            let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
            await contract.arrayStake(addressCoin).call()
            .then(result => {
                this.timesOfTransaction = parseInt(result._hex);
            })
        },

        async stakedCoin(addressCoin){
            let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
            await contract.balanceOfStake(addressCoin).call()
            .then(result => {
                if(addressCoin === this.addressUser) {
                    this.coinStaked = parseInt(result._hex) / Math.pow(10,6)
                } else {
                    this.coinStaked = parseInt(result._hex) / Math.pow(10,2)
                }
            })
        },

        async eachStake(addressCoin, test) {
            let contract = await window.tronWeb.contract().at(this.trc20ContractAddress);
            await contract.balanceOfEachStake(addressCoin, test).call()
            .then(result => {
                document.querySelector(".showTransaction-list-item-content span:nth-child(2)").innerHTML = parseInt(result._hex)
            })
        },

        close() {
            this.$emit('close');
        },
        
        showStakeSuccess() {
            setTimeout(() => {
                this.stakeSuccess = true;
            },5000)
        },

        noStakeSuccess(value) {
            this.stakeSuccess = value.test;
            this.transactionCode = value.transactionCode
        },

        async stakeCoin(addressCoin) {
            var amountStake = parseInt(document.getElementById('amountStake').value);
            this.amountInputStake = amountStake;
            if(addressCoin != this.addressUser) { 
                try {
                    let contract = await tronWeb.contract().at(this.trc20ContractAddress);
                    let result = await contract.stake(
                        addressCoin,
                        amountStake * 100
                    ).send({
                        feeLimit: 10000000
                    }).then(output => {
                        console.log('- Output:', output, '\n');
                        this.transactionCode += output;
                    });
                } catch (error) {
                    console.error("trigger smart contract error", error)
                }                     
            } else {
                try {
                    let contract = await tronWeb.contract().at(this.trc20ContractAddress);
                    let result = await contract.stakeTRX().send({
                        callValue: amountStake * Math.pow(10,6),
                        feeLimit: 10000000
                    }).then(output => {console.log('- Output:', output, '\n');});
                } catch (error) {
                    console.error("trigger smart contract error", error)
                }
            }
        },

        roundFloat(num,dec) {
            var d = 1;
            for (var i=0; i<dec; i++){
                d += "0";
            }
            return Math.round(num * d) / d;
        },

        getCoinTRX(addressCoin) {
            var p = Promise.resolve(window.tronWeb.trx.getBalance(addressCoin));
            p.then(result => {
                this.balanceCoin = result;
            })
            return this.balanceCoin / Math.pow(10,6)
        },

        async getBalanceCoin(addressCoin) {
            let contract = await window.tronWeb.contract().at(addressCoin);
            await contract.balanceOf(this.addressUser).call()
            .then(result => this.balanceCoinAnother = parseInt(result.balance._hex) / Math.pow(10,2));
        },

        async getBalanceOfToken(addressCoin){
            if(addressCoin === this.addressUser) {
                document.getElementById('amountStake').value = this.getCoinTRX(addressCoin)
            } else {
                let contract = await window.tronWeb.contract().at(addressCoin);
                await contract.balanceOf(this.addressUser).call()
                .then(result => document.getElementById('amountStake').value = parseInt(result.balance._hex) / Math.pow(10,2));
            }
        },

        async takeAddress() {
            if (window.tronWeb && window.tronWeb.defaultAddress.base58) {
                this.addressUser = window.tronWeb.defaultAddress.base58;
            }
        },
    },
    computed: {
        dataReceive() {
            return this.$store.state.coin_data;
        },
    },
    components: {
        StakeSuccess
    },
    created() {
        this.takeAddress();
    },
    updated() {
        this.stakedCoin(this.dataReceive.address_coin)
        this.showEachStaked(this.dataReceive.address_coin)
    }
}
</script>

<style lang="scss" scoped>
    .button_stakeCoin {
        background: #6726eb;
        border-radius: 10px;
        line-height: 30px;
        font-family: HelveticaNeue;
        font-size: 12px;
        color: #fff;
        letter-spacing: 0;
        text-align: center;
        margin: 0 5px;
        border: none;
        width: 70px;
        cursor: pointer;
    }

    .showTransaction-list-item {
        margin: 8px 0;
    }

    .showTransaction-list {
        list-style-type: none;   
        padding: 0;
    }

    .showTransaction-list-item-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .showTransaction-list-item-content > span {
        padding: 0 5px;
    }

    .claim__modal-action .modal-body-title {
        margin: 20px;
    }

    .claim__modal-action .modal-footer {
        margin: 0;
    }

    .claim__modal-action .modal-mask-container {
        height: 550px;
        max-height: 600px;
    }

    .showTransaction-title {
        text-align: left;
        padding: 10px 0;
    }

    .button_max {
        background: #6726eb;
        border-radius: 10px;
        height: 40px;
        line-height: 40px;
        font-family: HelveticaNeue;
        font-size: 12px;
        color: #fff;
        letter-spacing: 0;
        text-align: center;
        margin: 15px auto 0;
        border: none;
        width: 100px;
        cursor: pointer;
    }

    .trx_balance {
        font-size: 14px;
    }
    
    .modal-mask-container {
        width: 480px;
        height: 500px;
        background: #fff;
        box-shadow: inset -7px -8px 10px 0 rgba(51, 1, 138, 0.21);
        border-radius: 30px;
        color: #333;
        position: relative;
    }

    .modal-body {
        width: 80%;
        margin: 0 auto;
    }


    .modal-footer {
        border: none;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 30px 0;
    }

    .modal_stake-footer-button {
        background: #6726eb;
        border-radius: 10px;
        width: 80%;
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

    *:focus {
        outline: 0;
    }

    .modal-body-action {
        padding: 5px;
        display: flex;
        justify-content: space-between;
        background-color: #6726eb;
        border-radius: 20px;
        height: 50px;
        margin-top: 10px;
    }

    .stake_action {
        background-color: #fff;
        border-radius: 20px;
        width: 49%;
        padding-top: 8px;
    }

    .claim_action {
        border-radius: 20px;
        width: 49%;
        padding-top: 8px;
        color: #fff;
    }

    .modal-body-title {
        margin: 50px 0 20px;
        font-size: 14px;
    }

    .modal-body-input {
        background-color: #e0e0e0;
        border-radius: 10px;
    }

    input {
        border: none;
        background-color: #e0e0e0;
        width: 85%;
        border-radius: 10px;
        height: 50px;
        border: none;
    }

    input:focus {
        outline: none;
    }
</style>