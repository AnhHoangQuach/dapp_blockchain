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
                            Enter the amount of TRX you want to stake
                        </div>
                        <div class="modal-body-input">
                            <input type="text" id="amountStake" required>TRX
                        </div>
                    </div>
                    <div class="modal-footer">
                        <p class="trx_balance">TRX Balance: 123 TRX</p>
                        <button class="modal_stake-footer-button" @click="stakeCoin">Stake</button>
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
        }
    },
    methods: {
        close() {
            this.$emit('close');
        },
        async stakeCoin() {
            // TPEk47xBDFBatPpJ1EyiqxS4T2BiWcuzQw coin HoangAnh
            const trc20ContractAddress = "TVw1aFG87XX2Jp65irJavXvMx1BgMbmEa9"; //contract address
            var address = this.addressUser; 
            var amountStake = parseInt(document.getElementById('amountStake').value);
            try {
                let contract = await tronWeb.contract().at(trc20ContractAddress);
                //Use call to execute a pure or view smart contract method.
                // These methods do not modify the blockchain, do not cost anything to execute and are also not broadcasted to the network.
                let result = await contract.stake(
                    
                    amountStake
                ).send({
                    feeLimit: 5000000
                }).then(output => {console.log('- Output:', output, '\n');});
            } catch(error) {
                console.error("trigger smart contract error",error)
            }
        },
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