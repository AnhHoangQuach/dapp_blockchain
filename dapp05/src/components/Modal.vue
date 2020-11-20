<template>
    <div class="connect__wallet-modal">
        <transition name="move">
            <div class="modal-mask" v-if="loginSuccess">
                <div class="modal-container">
                    <div class="modal-header">
                        <div class="modal-header__title">Connect to Wallet</div>
                        <div class="modal-default-button" @click="close">
                            <img src="src/assets/iconDelete.png" alt="">
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="modal-body__logo">
                            <img src="src/assets/sunCoin.png" alt="">
                        </div>
                        <div class="modal-body__wallet-list" @click="loginSuccess = false">
                            <span>
                                <img src="src/assets/tronWallet.svg" alt="">
                            </span>
                            <span>TronLink Wallet</span>
                        </div>
                        <div class="modal-body__wallet-tronlink">
                            <span>Haven't installed TronLink yet?</span>
                            <a href="https://chrome.google.com/webstore/detail/tronlink%EF%BC%88%E6%B3%A2%E5%AE%9D%E9%92%B1%E5%8C%85%EF%BC%89/ibnejdfjmmkpcnlpebklmnkoeoihofec">
                                Click here>>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-mask" v-else>
                <div class="modal-container">
                    <div class="modal-body">
                        <div class="back-icon">
                            <span>
                                <img src="src/assets/back_icon.svg" alt="">
                            </span>
                        </div>
                        <div class="modal-default-button-two" @click="close">
                            <img src="src/assets/iconDelete.png" alt="">
                        </div>
                        <div class="wallet_step">
                            <span>
                                <img src="src/assets/tronWallet.svg" alt="">
                            </span>
                            <span>TronLink Wallet</span>
                        </div>
                        <div class="loader"></div>
                        <div class="loader_text">Initializing...</div>
                        <div class="login_tip_text">
                            <span>Please login to your 
                                <a href="https://chrome.google.com/webstore/detail/tronlink%EF%BC%88%E6%B3%A2%E5%AE%9D%E9%92%B1%E5%8C%85%EF%BC%89/ibnejdfjmmkpcnlpebklmnkoeoihofec" target="_blank">TronLink wallet</a>
                                to connect
                            </span>
                        </div>
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
            loginSuccess: true,
        }
    },
    methods: {
        close() {
            this.$emit('close');
        },
    }
}
</script>

<style lang="scss">

    .login_tip_text > span a {
        color: #5915e1;
        text-decoration: underline;
    }

    .modal-default-button-two {
        cursor: pointer;
        position: absolute;
        right: 5px;
    }

    .modal-body {
        text-align: center;
    }

    .loader_text {
        font-family: AvenirNext-DemiBold;
        font-size: 20px;
        color: #333;
        margin: 20px 0px 30px 8px;
    }

    .loader {
        border: 6px solid #f3f3f3;
        border-radius: 50%;
        border-top: 6px solid #333;
        width: 80px;
        height: 80px;
        animation: spin 1.4s linear infinite;
        margin: 0 auto;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    .wallet_step {
        margin-top: 60px;
        margin-bottom: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .wallet_step > span:last-child {
        font-family: AvenirNext-DemiBold;
        display: inline-block;
        font-size: 14px;
        color: #333;
        margin-left: 10px;
    }

    .back-icon {
        position: absolute;
        left: 20px;
        top: 20px;
        width: 50px;
        text-align: left;
    }

    .modal-mask {
        position: fixed;
        z-index: 9999;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: rgba(0, 0, 0, 0.45);
        display: flex;
        justify-content: center;
        align-items: center;
        animation: move ease-in-out 1.5s infinite alternate;
    }

    .modal-container {
        width: 540px;
        height: 450px;
        top: calc(50vh - 225px);
        background: #fff;
        box-shadow: inset -7px -8px 10px 0 rgba(51,1,138,.21);
        border-radius: 30px;
        color: #333;
    }

    .modal-header {
        font-size: 20px;
        line-height: 28px;
    }

    .modal-body__logo {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal-default-button {
        cursor: pointer;
    }

    .modal-default-button img , .modal-default-button-two img{
        width: 40px;
    }

    .modal-body__wallet-list {
        display: flex;
        justify-content: space-between;
        width: 95%;
        align-items: center;
        margin: 0 auto;
        box-shadow: 0 10px 40px 0 rgba(21,55,156,.06);
        border-radius: 20px;
        padding: 20px;
        margin-top: 40px;
        cursor: pointer;
        font-size: 20px;
    }

    .modal-body__wallet-tronlink {
        padding-left: 20px;
        margin-top: 80px;
        text-align: left;
        font-family: AvenirNext-Medium;
        color: #999;
    }

    @keyframes move {
        0% {
            transform: translateY(-3px);
        }
        100% {
            transform: translateY(3px);
        }
    }

</style>