<template>
    <footer>
        <div class="footer-contact">
            <a href="https://twitter.com/defi_sunio">Twiiter</a>
            <a href="https://t.me/SunIO_Defi">Telegram</a>
            <a class="qrCode">
                WeChat
                <img src="src/assets/qrcode.png" alt="" class="footer-contact__qrCode">
            </a>
        </div>
    </footer>
</template>

<script>
export default {
    data: function() {
      return {
        
      }
    },
}
</script>

<style lang="scss">
    .footer-contact__qrCode {
        display: none;
    }

    .footer-contact {
        text-align: center;
        padding-bottom: 2rem;
    }

    .footer-contact a {
        color: #999;
        font-size: 12px;
        margin: 0 2rem;
    }
</style>