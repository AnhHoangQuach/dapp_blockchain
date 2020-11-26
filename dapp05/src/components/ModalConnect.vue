<template>
    <div class="connect__wallet-modal">
        <transition name="move">
            <div class="modal-mask">
                <div class="modal-container">
                    <div class="modal-header">
                        <div class="modal-header__title">Account</div>
                        <div class="modal-default-button" @click="close">
                            <img src="src/assets/iconDelete.png" alt="">
                        </div>
                    </div>

                    <div class="modal-body">
                        <div class="address_con">
                            <div class="address_tip_text">
                                Connected with Tronlink
                            </div>
                            <div class="address_text">
                                <span>{{addressUser}}</span>
                                <span>
                                    <img src="src/assets/file.svg" alt="" class="copy-icon">
                                    Copy
                                </span>
                            </div>
                        </div>
                        <div class="sun__info">
                            <div>
                                <img src="src/assets/logoSingle.png" alt="" class="logoSingle">
                            </div>
                            <div class="sun__info-balance">0</div>
                            <div class="sun__info-balance-text">SUN Balance</div>
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
            addressUser: '',
        }
    },
    methods: {
        close() {
            this.$emit('close');
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

<style lang="scss">
    .address_con {
        padding: 20px;
        background: hsla(0,0%,66.7%,.2);
        border-radius: 15px;
    }

    .address_tip_text {
        color: #999;
        text-align: left;
    }

    .address_text span:first-child {
        font-size: 14px;
        font-weight: 100;
    }

    .address_text span:last-child {
        color: #666;
    }

    .address_text {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .copy-icon {
        width: 14px;
    }

    .sun__info {
        margin-top: 20px;
        text-align: center;
        padding: 20px;
    }

    .logoSingle {
        width: 100px;
    }

    .sun__info-balance {
        font-family: HelveticaNeue-Medium;
        font-size: 24px;
        color: #1a1a1a;
        letter-spacing: 0;
        margin-top: 20px;
    }

    .sun__info-balance-text {
        font-family: HelveticaNeue;
        font-size: 14px;
        color: #999;
        letter-spacing: 0;
    }
</style>