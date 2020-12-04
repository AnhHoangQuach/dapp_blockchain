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
        width: 120px;
        height: 120px;
    }

    .footer-contact {
        text-align: center;
        padding-bottom: 2.5rem;
        width: 80%;
        padding-top: 2.5rem;
        margin: 0 auto;
        position: relative;
        z-index: 10000;
    }

    .footer-contact a {
        color: #999;
        font-size: 12px;
        margin: 0 2rem;
        text-decoration: none;
        position: relative;
        padding: 10px 0;
    }

    .footer-contact a:hover {
        color: #5915e1;
    }

    .footer-contact a:last-child {
        cursor: pointer;
    }

    .footer-contact a:last-child:hover .footer-contact__qrCode {
        position: absolute;
        top: -120px;
        left: -35px;
        display: block;
        z-index: 10;
    }
</style>