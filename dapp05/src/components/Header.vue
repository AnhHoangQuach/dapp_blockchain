<template>
    <div class="header-container">
        <div class="header-content">
            <div class="logo">
                <img v-bind:src="imgURL" alt="">
            </div>
            <div class="menu">
                <ul>
                    <li v-for="(item, index) in listNavBar" :key="index"></li>
                </ul>
            </div>
            <div class="header-right">
                <div class="connect-wallet">
                    Connect to Wallet
                </div>
                <div class="lg-content">
                    <ul>
                        <li>English</li>
                        <li>日本語</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        imgURL: {
            type: String,
            default: "src/assets/logo_header.png",
        },
        listNavBar: {
            type: Object,
        }
    },
}
</script>

<style lang="scss" scoped>
    .header-container {
        background: url('../assets/bg_header.png');
        background-size: 100%;
        height: 400px;
        width: 100%;
        position: absolute;
        z-index: -1;
        top: 0;
        left: 0;
        .header-content {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            padding: 10px 2vw;
        }  
        .logo {
            img {
                width: 150px;
            }
        }
    }
</style>
