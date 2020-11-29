<template>
    <div class="stake__success-modal">
        <transition name="move">
            <div class="modal-mask">
                <div class="modal-container">
                    <div class="modal-header">
                        <div class="modal-default-button" @click="closeStaked">
                            <img src="src/assets/iconDelete.png" alt="">
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="stake__success-coin">Stake {{amountInputStake}} {{dataReceive.coin_one}}</div>
                        <div class="stake__success-arrow-top">
                            <img src="src/assets/arrowTop.svg" alt="">
                        </div>
                        <div class="stake__success-message">
                            Transaction has been broadcast
                        </div>
                        <div class="stake__success-link">
                            <a :href="transactionCode" target="_blank">View on TRONSCAN>></a>
                        </div>
                    </div>
                </div>
            </div>
            
        </transition> 
    </div>
</template>

<script>
export default {
    props: {
        amountInputStake: {
            type: Number,
        },
        transactionCode: {
            type: String,
        }
    },
    computed: {
        dataReceive() {
            return this.$store.state.coin_data;
        }
        
    },
    methods: {
        closeStaked() {
            var data = {
                test: false,
                transactionCode: 'https://shasta.tronscan.org/#/transaction/'
            }
            this.$emit('closeParent', data);
        },
    }
}
</script>
<style scoped>
    .modal-header {
        border: none;
        position: relative;
    }

    .modal-default-button {
        position: absolute;
        right: 8px;
    }

    .modal-container {
        width: 300px;
        height: 300px;
        top: calc(50vh - 225px);
        background: #fff;
        box-shadow: inset -7px -8px 10px 0 rgba(51, 1, 138, 0.21);
        border-radius: 30px;
        color: #333;
    }

    .modal-body {
        margin-top: 20px;
    }
    
    .stake__success-arrow-top img{
        width: 30px;
    }

    .stake__success-coin {
        font-weight: 600;
        font-size: 18px;
    }

    .stake__success-arrow-top {
        padding: 15px 0;
    }

    .stake__success-message {
        color: #55b54c;
        font-weight: 600;
        font-size: 18px;
    }

    .stake__success-link {
        padding: 10px 0;
    }
</style>