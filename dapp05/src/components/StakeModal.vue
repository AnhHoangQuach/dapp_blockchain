<template>
    <div class="stake__modal-action">
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
                            <div class="stake_action">Stake</div>
                            <div class="claim_action">Claim</div>
                        </div>
                        <div class="modal-body-title">
                            Enter the amount of {{dataReceive.coin_one}} you want to stake
                        </div>
                        <div class="modal-body-input">
                            <input type="text" id="amountStake" required>{{dataReceive.coin_one}}
                        </div>
                    </div>
                    <div class="modal-footer">
                        <p class="trx_balance">{{dataReceive.coin_one}} Balance: 
                           {{roundFloat(getBalanceCoin(dataReceive.address_coin),5)}} {{dataReceive.coin_one}}
                        </p>
                        <button
                            class="modal_stake-footer-button" 
                            @click="stakeCoin(dataReceive.address_coin)"
                        >Stake
                        </button>
                    </div>
                </div>
            </div>
            
        </transition> 
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            addressUser: '',
            trc20ContractAddress: 'TQszzMYsHo5o6XCDigDVKMT7W95kb2wW6G',
            balanceCoin: 0,
        }
    },
    methods: {
        close() {
            this.$emit('close');
        },

        async stakeCoin(addressCoin) {
            var amountStake = parseInt(document.getElementById('amountStake').value);
            if(addressCoin === this.addressUser) {            
                try {
                    let contract = await tronWeb.contract().at(this.trc20ContractAddress);
                    let result = await contract.stakeTRX().send({
                        feeLimit: 9000000
                    }).then(output => {console.log('- Output:', output, '\n');});
                } catch (error) {
                    console.error("trigger smart contract error", error)
                }
            } else {
                try {
                    let contract = await tronWeb.contract().at(this.trc20ContractAddress);
                    let result = await contract.stake(
                        addressCoin, amountStake
                    ).send({
                        feeLimit: 9000000
                    }).then(output => {console.log('- Output:', output, '\n');});
                } catch (error) {
                    console.error("trigger smart contract error", error)
                }
            }
        },

        getBalanceCoin(addressCoin) {
            var p = Promise.resolve(window.tronWeb.trx.getBalance(addressCoin));
            p.then(result => {
                this.balanceCoin = result;
            })
            return this.balanceCoin / Math.pow(10,6);
        },

        roundFloat(num,dec) {
            var d = 1;
            for (var i=0; i<dec; i++){
                d += "0";
            }
            return Math.round(num * d) / d;
        }
    },
    computed: {
        dataReceive() {
            return this.$store.state.coin_data;
        }
        
    },
    created() {
        this.interval = setInterval(() => {
            if (window.tronWeb && window.tronWeb.defaultAddress.base58) {
                this.addressUser = window.tronWeb.defaultAddress.base58;
            }
        }, 1000);
    },
}
</script>

<style lang="scss" scoped>
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